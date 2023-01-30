import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/vendor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendorFirestoreDb {
  //create vendor
  static addVendor(VendorModel vendorModel) async {
    await firebaseFirestore.collection("vendors").add({
      'vendorId': vendorModel.vendorId,
      'vendorRestaurantName': vendorModel.vendorRestaurantName,
      'vendorEmail': vendorModel.vendorEmail,
      'vendorPhone': vendorModel.vendorPhone,
      'vendorLocation': vendorModel.vendorLocation,
      'vendorMall': vendorModel.vendorMall,
      'vendorImage': vendorModel.vendorImage,
      'isAuthorise': false,
    });
  }

  //read vendor
  static Stream<List<VendorModel>> vendorStream() {
    return firebaseFirestore
        .collection('vendors')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<VendorModel> vendors = [];
      for (var vendor in querySnapshot.docs) {
        final vendorModel =
            VendorModel.fromDocumentSnapshot(documentSnapshot: vendor);

        vendors.add(vendorModel);
      }

      return vendors;
    });
  }

  //update vendor
  static authoriseVendor(bool isAuthorise, documentId) {
    firebaseFirestore
        .collection('vendors')
        .doc()
        .collection('profiles')
        .doc(documentId)
        .update({
      'isAuthorise': isAuthorise,
    });
  }

  //delete vendor
  static deleteVendor(String documentId) {
    firebaseFirestore.collection('vendors').doc(documentId).delete();
  }
}
