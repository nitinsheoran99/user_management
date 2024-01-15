import 'dart:convert';


import '../model/user_list.dart';
import '../model/user_model.dart';
import '../util/api_endpoints.dart';
import 'package:http/http.dart' as http;

class UserApiService{
  static Future<List<UserModel>> getProductInfo() async {
    String url = ApiEndpoint.baseURl;
    http.Response response = await http.get(
      Uri.parse(url),

    );
    if (response.statusCode == 200) {
      String body = response.body;
      final data = jsonDecode(body);

      UserResponseList userResponseList= UserResponseList.fromJson(data);
      return userResponseList.details;
    } else {
      throw 'Something went wrong';
    }
  }
}