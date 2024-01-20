import 'package:get/get.dart';
import 'package:reqres_app/network/artile_data_source.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/util/helper.dart';

class FeedArticleController extends GetxController {
  var counter = 244.obs;
  Rx<ArticlesResponse> articles = ArticlesResponse().obs;
  Rx<bool> feedLoading = true.obs;
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
    feedLoading.value = true;
    var parameter = {"limit": "20"};
    Future<Result> result = _apiResponse.getFeedArticle(parameter);
    result.then((value) {
      feedLoading.value = false;
      if (value is SuccessState) {
        Helper().hideLoading();
        var res = value.value as ArticlesResponse;
        articles.value = res;
      } else {}
    });
  }
}
