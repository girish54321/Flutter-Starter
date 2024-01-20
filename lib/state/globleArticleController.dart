import 'package:get/get.dart';
import 'package:reqres_app/network/artile_data_source.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/util/helper.dart';

class GlobalArticleController extends GetxController {
  var counter = 244.obs;
  Rx<ArticlesResponse> articles = ArticlesResponse().obs;
  Rx<bool> globalFeedLoading = true.obs;
  final ArticleDataSource _apiResponse = ArticleDataSource();

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
    globalFeedLoading.value = true;
    var parameter = {"limit": "20"};
    Future<Result> result = _apiResponse.getGlobeFeedArticle(parameter);
    result.then((value) {
      globalFeedLoading.value = false;
      if (value is SuccessState) {
        Helper().hideLoading();
        var res = value.value as ArticlesResponse;
        articles.value = res;
      } else {}
    });
  }
}
