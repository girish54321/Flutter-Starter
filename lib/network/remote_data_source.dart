import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:reqres_app/network/ReqResClient.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/userListModal.dart';
import 'package:reqres_app/network/util/api_path.dart';
import 'package:reqres_app/network/util/request_type.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class RemoteDataSource {
  ReqResClient client = ReqResClient(Client());

  Future<Result> userLogin(parameter) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
          requestType: RequestType.POST,
          path: APIPathHelper.getValue(APIPath.login),
          parameter: parameter);
      // print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        incomingData = Result<LoginSuccess>.success(
            LoginSuccess.fromJson(json.decode(response.body)));
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

  Future<Result> userList() async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: APIPathHelper.getValue(APIPath.users),
          params: {"per_page": "50"});
      // print(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        incomingData = Result<UserListResponse>.success(
            UserListResponse.fromJson(json.decode(response.body)));
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
