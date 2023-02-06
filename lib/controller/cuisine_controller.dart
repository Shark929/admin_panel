import 'package:admin_panel/constants/category_firestore_db.dart';
import 'package:admin_panel/constants/cuisine_firestore_db.dart';
import 'package:admin_panel/models/cuisine_model.dart';
import 'package:get/get.dart';

class CuisineController extends GetxController {
  Rx<List<CuisineModel>> cuisineList = Rx<List<CuisineModel>>([]);

  List<CuisineModel> get cuisine => cuisineList.value;

  @override
  void onReady() {
    cuisineList.bindStream(CuisineFirestoreDb.cuisineStream());
  }
}
