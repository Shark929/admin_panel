import 'package:admin_panel/models/user_model.dart';
import 'package:get/get.dart';
import '../constants/user_firestore_db.dart';

class UserController extends GetxController {
  Rx<List<UserModel>> userList = Rx<List<UserModel>>([]);

  List<UserModel> get users => userList.value;

  @override
  void onReady() {
    userList.bindStream(UserFirestoreDb.userStream());
  }
}
