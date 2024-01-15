import 'package:flutter/cupertino.dart';
import '../model/user_model.dart';
import '../service/api_service.dart';


class UserProvider extends ChangeNotifier {
  List<UserModel> userList = [];


  Future fetchData() async {
    userList = await UserApiService.getProductInfo();
    notifyListeners();
  }
}
