import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryFirestoreDb {
  //add function
  static addCategory(CategoryModel categoryModel) async {
    await firebaseFirestore.collection('category').add({
      'category': categoryModel.category,
    });
  }

  //get function
  static Stream<List<CategoryModel>> categoryStream() {
    return firebaseFirestore
        .collection('category')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<CategoryModel> categories = [];
      for (var category in querySnapshot.docs) {
        final categoryModel =
            CategoryModel.fromDocumentSnapshot(documentSnapshot: category);

        categories.add(categoryModel);
      }

      return categories;
    });
  }

  //update function

  //delete function
  static deleteCategory(String categoryId) {
    firebaseFirestore.collection('category').doc(categoryId).delete();
  }
}
