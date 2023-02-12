import 'package:admin_panel/constants/order_history_firestore_db.dart';
import 'package:admin_panel/models/order_history_model.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  Rx<List<MyCartModel>> orderHistoryList = Rx<List<MyCartModel>>([]);

  List<MyCartModel> get orderHistory => orderHistoryList.value;

  @override
  void onReady() {
    orderHistoryList.bindStream(OrderHistoryFirestoreDb.myCartStream());
  }
}
