import 'package:get/get.dart';
import 'package:reqres_app/network/model/userListModal.dart';

class ProductController extends GetxController {
  // your state variables
  var counter = 244.obs;
  Rx<UserListResponseData> userListResponseData = UserListResponseData().obs;

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
}
