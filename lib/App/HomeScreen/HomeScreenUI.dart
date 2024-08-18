import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreen.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/network/remote_data_source.dart';
import 'package:reqres_app/state/userListState.dart';
import 'package:reqres_app/widget/loadingView.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var localData = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(localData.home),
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
              return [
                AppMenuItem(
                    "setting",
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(localData.settings),
                    )),
                AppMenuItem(
                    "logout",
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: Text(localData.logout),
                    ))
              ].map((AppMenuItem choice) {
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
  final ProductController controller = Get.put(ProductController());
  var ppp = 1;
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
    return StreamBuilder(
        initialData: controller.flitteredUserList.value.data,
        stream: controller.searchList(query),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Select lot');
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return const Text('active');
            case ConnectionState.done:
              final List<UserListResponseData> da =
                  snapshot.data as List<UserListResponseData>;
              return ListView.builder(
                itemCount: da.length,
                itemBuilder: (context, index) {
                  UserListResponseData? userItem = da[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 33.0,
                      backgroundImage: NetworkImage(userItem.avatar as String),
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
        });
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
