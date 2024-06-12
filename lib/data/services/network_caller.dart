import 'dart:convert';
import 'dart:developer';
import 'package:flutter_task_manager/data/services/network_response.dart';
import 'package:flutter_task_manager/development/dev_print.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    print(url);
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          // 'Content-Type': 'application/json'
        },
        body: jsonEncode(body),
      );

      devPrint(response.statusCode.toString());
      devPrint(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
}
