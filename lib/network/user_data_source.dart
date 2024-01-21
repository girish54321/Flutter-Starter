import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:reqres_app/network/ReqResClient.dart';
import 'package:reqres_app/network/model/result.dart';
import 'package:reqres_app/network/model/usermodal.dart';
import 'package:reqres_app/network/util/api_path.dart';
import 'package:reqres_app/network/util/request_type.dart';
import 'package:reqres_app/widget/DialogHelper.dart';

class UserDataSource {
  ReqResClient client = ReqResClient(Client());

  Future<Result> getUserProfile(String endPoint) async {
    Result incomingData = Result.loading("Loading");
    try {
      final response = await client.request(
          requestType: RequestType.GET,
          path: APIPathHelper.getValue(APIPath.user),
          endPoint: endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        incomingData = Result<UserModal>.success(
            UserModal.fromJson(json.decode(response.body)));
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
