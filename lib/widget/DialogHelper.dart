import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
        GetPlatform.isAndroid
            ? AlertDialog(
                title: Text(title),
                content: Text(description ?? ""),
                actions: [
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      Get.until((route) => !Get.isDialogOpen!);
                    },
                  ),
                ],
                scrollable: true,
              )
            : CupertinoAlertDialog(
                title: Text(title),
                content: Text(description ?? ""),
                actions: [
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      Get.until((route) => !Get.isDialogOpen!);
                    },
                  ),
                ],
              ),
        barrierDismissible: true);
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
        GetPlatform.isAndroid
            ? AlertDialog(
                content: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 8),
                      Text(message ?? 'Loading...'),
                    ],
                  ),
                ),
                scrollable: true,
              )
            : CupertinoAlertDialog(
                content: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 8),
                      Text(message ?? 'Loading...'),
                    ],
                  ),
                ),
              ),
        barrierDismissible: true);
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
