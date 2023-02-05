import 'package:admin_panel/constants/vendor_wallet_firestore_db.dart';
import 'package:admin_panel/models/vendor_wallet_model.dart';
import 'package:get/get.dart';

class VendorWalletController extends GetxController {
  Rx<List<VendorWalletModel>> vendorWalletList =
      Rx<List<VendorWalletModel>>([]);
  List<VendorWalletModel> get wallet => vendorWalletList.value;

  @override
  void onReady() {
    vendorWalletList.bindStream(VendorWalletFirestoreDb.walletStream());
  }
}
