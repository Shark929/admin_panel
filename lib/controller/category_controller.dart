import 'package:admin_panel/constants/category_firestore_db.dart';
import 'package:admin_panel/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  Rx<List<CategoryModel>> categoryList = Rx<List<CategoryModel>>([]);

  List<CategoryModel> get category => categoryList.value;

  @override
  void onReady() {
    categoryList.bindStream(CategoryFirestoreDb.categoryStream());
  }
}
