import 'package:flutter/material.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreen.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/widget/loadingView.dart';

class HomeScreenUI extends StatelessWidget {
  final Function userLogout;
  final RemoteDataSource remoteDataSource;
  final Function goToUserInfoScreen;
  final List<AppMenuItem> menu;
  final Function goToSettings;
  const HomeScreenUI(
      {Key? key,
      required this.userLogout,
      required this.remoteDataSource,
      required this.goToUserInfoScreen,
      required this.menu,
      required this.goToSettings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: MySeachDeeget(
                      goToUserInfoScreen: goToUserInfoScreen,
                      hintText: 'Search user',
                    ));
              },
              icon: const Icon(Icons.search)),
          PopupMenuButton<String>(
            onSelected: (val) {
              if (val == "logout") {
                userLogout();
                return;
              }
              if (val == "setting") {
                goToSettings();
                return;
              }
            },
            itemBuilder: (BuildContext context) {
              return menu.map((AppMenuItem choice) {
                return PopupMenuItem<String>(
                    value: choice.id, child: choice.widget);
              }).toList();
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: remoteDataSource.userList(),
          builder: (BuildContext contex, AsyncSnapshot<Result> snapshot) {
            if (snapshot.data is LoadingState) {
              return const LoadingView();
            }
            if (snapshot.data is ErrorState) {
              return Text(snapshot.data.toString());
            }

            if (snapshot.data is SuccessState) {
              UserListResponse userListResponse =
                  (snapshot.data as SuccessState).value;
              return ListView.builder(
                itemCount: userListResponse.data!.length,
                itemBuilder: (context, index) {
                  UserListResponseData? userItem =
                      userListResponse.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 33.0,
                      backgroundImage: NetworkImage(userItem!.avatar as String),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(userItem.firstName! + " " + userItem.lastName!),
                    subtitle: Text(userItem.email!),
                    onTap: () {
                      goToUserInfoScreen(userItem);
                    },
                  );
                },
              );
            }
            return const LoadingView();
          }),
    );
  }
}

class MySeachDeeget extends SearchDelegate {
  final String hintText;
  final Function goToUserInfoScreen;
  MySeachDeeget({
    required this.hintText,
    required this.goToUserInfoScreen,
  });
  RemoteDataSource _apiResponse = RemoteDataSource();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  String? get searchFieldLabel => hintText;

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: _apiResponse.userList(),
        builder: (BuildContext contex, AsyncSnapshot<Result> snapshot) {
          if (snapshot.data is LoadingState) {
            return const LoadingView();
          }
          if (snapshot.data is ErrorState) {
            return Text(snapshot.data.toString());
          }

          if (snapshot.data is SuccessState) {
            UserListResponse userListResponse =
                (snapshot.data as SuccessState).value;
            var items = userListResponse.data;
            return ListView.builder(
              itemCount: userListResponse.data!.length,
              itemBuilder: (context, index) {
                UserListResponseData? userItem = userListResponse.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 33.0,
                    backgroundImage: NetworkImage(userItem!.avatar as String),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(userItem.firstName! + " " + userItem.lastName!),
                  subtitle: Text(userItem.email!),
                  onTap: () {
                    goToUserInfoScreen(userItem);
                  },
                );
              },
            );
          }
          return const LoadingView();
        });
  }
}
