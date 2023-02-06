import 'package:admin_panel/constants/revenue_firestore_db.dart';
import 'package:admin_panel/models/revenue_model.dart';
import 'package:get/get.dart';

class RevenueController extends GetxController {
  Rx<List<RevenueModel>> revenueList = Rx<List<RevenueModel>>([]);

  List<RevenueModel> get revenues => revenueList.value;

  @override
  void onReady() {
    revenueList.bindStream(RevenueFirestoreDb.revenueStream());
  }
}
