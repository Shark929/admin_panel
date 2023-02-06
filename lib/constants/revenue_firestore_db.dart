import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/revenue_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RevenueFirestoreDb {
  //create

  //read
  static Stream<List<RevenueModel>> revenueStream() {
    return firebaseFirestore
        .collection('revenue')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<RevenueModel> revenues = [];

      for (var revenue in querySnapshot.docs) {
        final revenueModel = RevenueModel.fromDocumentSnapshot(revenue);

        revenues.add(revenueModel);
      }

      return revenues;
    });
  }
  //update

  //delete
  // static deleteUser(String documentId) {
  //   firebaseFirestore.collection('users').doc(documentId).delete();
  // }
}
