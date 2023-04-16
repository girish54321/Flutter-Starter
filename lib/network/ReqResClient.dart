import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:reqres_app/AppConst/AppConst.dart';
import 'util/nothing.dart';
import 'util/request_type.dart';
import 'util/request_type_exception.dart';

class ReqResClient {
  static const String _baseUrl = "https://reqres.in/api";
  final Client _client;
  GetStorage box = GetStorage();

  ReqResClient(this._client);

  Future<Response> request(
      {required RequestType requestType,
      required String path,
      Map<String, String>? params,
      dynamic parameter = Nothing}) async {
    //* Check for the Token
    final headers = <String, String>{
      'Content-Type': 'application/json',
      if (box.hasData(JWT_KEY)) 'Authorization': 'Bearer ${box.read(JWT_KEY)}',
    };
    switch (requestType) {
      case RequestType.GET:
        var uri = _baseUrl +
            path +
            ((params != null) ? this.queryParameters(params) : "");
        return _client.get(Uri.parse(uri));
      case RequestType.POST:
        return _client.post(Uri.parse("$_baseUrl/$path"),
            headers: headers, body: json.encode(parameter));
      case RequestType.DELETE:
        return _client.delete(Uri.parse("$_baseUrl/$path"));
      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request mentioned is not found");
    }
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }
}
