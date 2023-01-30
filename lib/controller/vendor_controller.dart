import 'package:admin_panel/constants/vendor_firestore_db.dart';
import 'package:admin_panel/models/vendor_model.dart';
import 'package:get/get.dart';

class VendorController extends GetxController {
  Rx<List<VendorModel>> vendorList = Rx<List<VendorModel>>([]);
  List<VendorModel> get vendor => vendorList.value;

  @override
  void onReady() {
    vendorList.bindStream(VendorFirestoreDb.vendorStream());
  }
}
