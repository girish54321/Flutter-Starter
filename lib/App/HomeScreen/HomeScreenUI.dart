import 'package:flutter/material.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/network/remote_data_source.dart';

class HomeScreenUI extends StatelessWidget {
  final Function userLogout;
  final RemoteDataSource remoteDataSource;
  const HomeScreenUI(
      {Key? key, required this.userLogout, required this.remoteDataSource})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: FutureBuilder(
          future: remoteDataSource.userList(),
          builder: (BuildContext contex, AsyncSnapshot<Result> snapshot) {
            if (snapshot.data is LoadingState) {
              return Text("Loading");
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
                  UserListResponseData? userItem =
                      userListResponse.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(userItem!.avatar as String),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(userItem?.firstName as String),
                  );
                },
              );
            }
            return Text("Loading");
          }),
    );
  }
}
