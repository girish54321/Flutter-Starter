import 'package:get/get.dart';
import 'package:reqres_app/network/artile_data_source.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/util/helper.dart';
import 'package:reqres_app/state/authController.dart';

class BookArticleController extends GetxController {
  var counter = 244.obs;
  Rx<ArticlesResponse> bookMarkArticles = ArticlesResponse().obs;
  Rx<bool> bookMarkLoading = true.obs;
  final ArticleDataSource _apiResponse = ArticleDataSource();
  final AuthController authController =
      GetInstance().put<AuthController>(AuthController());

  @override
  void onInit() {
    // Here you can fetch you product from server
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getFeedArticle();
  }

  @override
  void onClose() {
    // you can cancel timers
    super.onClose();
  }

  void getFeedArticle() {
    bookMarkLoading.value = true;
    var userName = authController.userData.value.username;
    var parameter = {"limit": "20", "favorited": userName.toString()};
    Future<Result> result = _apiResponse.getGlobeFeedArticle(parameter);
    result.then((value) {
      bookMarkLoading.value = false;
      if (value is SuccessState) {
        Helper().hideLoading();
        var res = value.value as ArticlesResponse;
        bookMarkArticles.value = res;
      } else {}
    });
  }
}
