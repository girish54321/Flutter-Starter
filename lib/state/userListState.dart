import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reqres_app/network/model/userListModal.dart';

class ProductController extends GetxController {
  // your state variables
  var counter = 244.obs;
  Rx<UserListResponseData> userListResponseData = UserListResponseData().obs;
  Rx<UserListResponse> userList = UserListResponse().obs;
  Rx<UserListResponse> flitteredUserList = UserListResponse().obs;

  // your methods
  void selectUser(UserListResponseData item) {
    userListResponseData.value = item;
    update();
  }

  @override
  void onInit() {
    // Here you can fetch you product from server
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // Here, you can dispose your StreamControllers
    // you can cancel timers
    super.onClose();
  }

  void saveResponseInState(UserListResponse userListResponse) {
    userList.value = userListResponse;
    flitteredUserList.value = userListResponse;
  }

  Stream<List<UserListResponseData>> searchList(String query) {
    Future<List<UserListResponseData>> futureTask() async {
      await Future.delayed(const Duration(seconds: 1));
      return userList.value.data
          ?.where((item) => item!.email!.contains(query))
          .toList() as List<UserListResponseData>;
    }

    return Stream<List<UserListResponseData>>.fromFuture(futureTask());
  }
}
