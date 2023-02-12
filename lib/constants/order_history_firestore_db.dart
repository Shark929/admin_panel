import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/order_history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/mall_model.dart';

class OrderHistoryFirestoreDb {
  //add function
  // static addOrderHistory(MyCartModel myCartModel) async {
  //   await firebaseFirestore.collection('orderHistory').add({
  //     'customerId': myCartModel.customerId,
  //     'customization': myCartModel.customization,
  //     'itemDescription': myCartModel.itemDescription,
  //     'itemName': myCartModel.itemName,
  //     'itemPicture': myCartModel.itemPicture,
  //     'itemPrice': myCartModel.itemPrice,
  //     'quantity': myCartModel.quantity,
  //     'totalPrice': myCartModel.totalPrice,
  //     'vendorId': myCartModel.vendorId,
  //   });
  // }

  //get function
  static Stream<List<MyCartModel>> myCartStream() {
    return firebaseFirestore
        .collection('orderHistory')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<MyCartModel> myCarts = [];
      for (var mycart in querySnapshot.docs) {
        final locationModel = MyCartModel.fromDocumentSnapshot(mycart);

        myCarts.add(locationModel);
      }

      return myCarts;
    });
  }
}
