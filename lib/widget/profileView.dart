import 'package:flutter/material.dart';
import 'package:reqres_app/widget/appNetworkImage.dart';

class ProfileView extends StatelessWidget {
  final String? userName;
  final String? userBio;
  final String? userImage;
  const ProfileView({Key? key, this.userName, this.userBio, this.userImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 12, right: 12),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: AppNetWorkIamge(imageUrl: userImage ?? "", radius: 28),
                radius: 28,
              ),
              title: Text(userName ?? ""),
              subtitle: Text(userBio ?? ""),
            )),
      ),
    );
  }
}
