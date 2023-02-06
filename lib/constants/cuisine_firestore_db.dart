import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/category_model.dart';
import 'package:admin_panel/models/cuisine_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CuisineFirestoreDb {
  //add function
  static addCuisine(CuisineModel cuisineModel) async {
    await firebaseFirestore.collection('cuisine').add({
      'cuisine': cuisineModel.cuisine,
    });
  }

  //get function
  static Stream<List<CuisineModel>> cuisineStream() {
    return firebaseFirestore
        .collection('cuisine')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<CuisineModel> cuisines = [];
      for (var cuisine in querySnapshot.docs) {
        final cuisineModel =
            CuisineModel.fromDocumentSnapshot(documentSnapshot: cuisine);

        cuisines.add(cuisineModel);
      }

      return cuisines;
    });
  }

  //update function

  //delete function
  static deleteCuisine(String cuisineId) {
    firebaseFirestore.collection('cuisine').doc(cuisineId).delete();
  }
}
