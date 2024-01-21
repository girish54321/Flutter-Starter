import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:reqres_app/network/ReqResClient.dart';
import 'package:reqres_app/network/model/ArticlesResponse.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/network/util/api_path.dart';
import 'package:reqres_app/network/util/request_type.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class ArticleDataSource {
  ReqResClient client = ReqResClient(Client());

  Future<Result> getFeedArticle(params) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: APIPathHelper.getValue(APIPath.feed),
          params: params);
      if (response.statusCode == 200 || response.statusCode == 201) {
        incomingData = Result<ArticlesResponse>.success(
            ArticlesResponse.fromJson(json.decode(response.body)));
        return incomingData;
      } else {
        DialogHelper.showErrorDialog(description: response.body.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErrorDialog(description: "Something went wrong!");
      return incomingData;
    }
  }

  Future<Result> getGlobeFeedArticle(params) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: APIPathHelper.getValue(APIPath.articles),
          params: params);
      if (response.statusCode == 200 || response.statusCode == 201) {
        incomingData = Result<ArticlesResponse>.success(
            ArticlesResponse.fromJson(json.decode(response.body)));
        return incomingData;
      } else {
        DialogHelper.showErrorDialog(description: response.body.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErrorDialog(description: "Something went wrong!");
      return incomingData;
    }
  }
}
