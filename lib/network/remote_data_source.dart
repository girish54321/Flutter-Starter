import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:reqres_app/network/ReqResClient.dart';
import 'package:reqres_app/network/dataModel/LoginSuccess.dart';
import 'package:reqres_app/network/model/result.dart';
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
      if (response.statusCode == 200 || response.statusCode == 201) {
        incomingData = Result<LoginSuccess>.success(
            LoginSuccess.fromJson(json.decode(response.body)));
        return incomingData;
      } else {
        DialogHelper.showErroDialog(
            description: response.statusCode.toString());
        incomingData = Result.error(response.statusCode);
        return incomingData;
      }
    } catch (error) {
      incomingData = Result.error("Something went wrong!");
      DialogHelper.showErroDialog(description: "Something went wrong!");
      return incomingData;
    }
  }

  // Future<Result> getHomeScreenData() async {
  //   Result incomingData = Result.loading("Loading");
  //   String tokan = await Helper().getAppTokan();
  //   try {
  //     final response = await client.request(
  //         requestType: RequestType.GET,
  //         path: APIPathHelper.getValue(APIPath.home_api),
  //         params: {
  //           "client_id": tokan,
  //           "limit": "10",
  //         });
  //     if (response.statusCode == 200) {
  //       incomingData = Result<HomeResponse>.success(
  //           HomeResponse.fromJson(json.decode(response.body)));
  //       return incomingData;
  //     } else {
  //       incomingData = Result.error("Book list not available");
  //       return incomingData;
  //     }
  //   } catch (error) {
  //     incomingData = Result.error("Something went wrong!");
  //     return incomingData;
  //   }
  // }

  // Future<Result> getPlayListDataData(id) async {
  //   Result incomingData = Result.loading("Loading");
  //   String tokan = await Helper().getAppTokan();
  //   try {
  //     final response = await client.request(
  //         requestType: RequestType.GET,
  //         path: APIPathHelper.getValue(APIPath.play_list) + id,
  //         params: {"client_id": tokan});
  //     if (response.statusCode == 200) {
  //       incomingData = Result<PlayListResponse>.success(
  //           PlayListResponse.fromJson(json.decode(response.body)));
  //       return incomingData;
  //     } else {
  //       incomingData = Result.error("Book list not available");
  //       return incomingData;
  //     }
  //   } catch (error) {
  //     incomingData = Result.error("Something went wrong!");
  //     return incomingData;
  //   }
  // }
}
