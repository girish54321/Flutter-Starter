import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/state/userListState.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserInfoScreenUI extends StatelessWidget {
  const UserInfoScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localData = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(localData.userinfo)),
      body: ListView(
        children: [
          GetX<ProductController>(
              init: ProductController(),
              builder: (controller) {
                UserListResponseData? val =
                    controller.userListResponseData.value;
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      ElasticIn(
                        child: CircleAvatar(
                          radius: 66.0,
                          backgroundImage: NetworkImage(val.avatar as String),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeIn(
                        child: Text(
                          val.firstName! + " " + val.lastName!,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      FadeIn(
                        child: Text(
                          val.email!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
