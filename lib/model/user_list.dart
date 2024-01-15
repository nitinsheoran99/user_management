import 'package:user_management/model/user_model.dart';
class UserResponseList {
  List<UserModel> details = [];
  UserResponseList({required this.details});

  factory UserResponseList.fromJson(List<dynamic> json) {
    List<UserModel> productList = [];
    for (var productJson in json) {
      productList.add(UserModel.fromJson(productJson));
    }
    return UserResponseList(details: productList);
  }
}