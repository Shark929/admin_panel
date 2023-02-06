import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderFirestoreDb {
  //read
  static Stream<List<OrderModel>> orderStream() {
    return firebaseFirestore
        .collection('vendorCart')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<OrderModel> carts = [];

      for (var cart in querySnapshot.docs) {
        final cartModel =
            OrderModel.fromDocumentSnapshot(documentSnapshot: cart);
        carts.add(cartModel);
      }

      return carts;
    });
  }

  //update
  static updateCode(String code, documentId) {
    firebaseFirestore.collection('vendorCart').doc(documentId).update(
      {
        'code': code,
      },
    );
  }


   //delete
  static deleteOrder(String documentId) {
    firebaseFirestore.collection('vendorCart').doc(documentId).delete();
  }
}
