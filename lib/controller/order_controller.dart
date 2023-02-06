import 'package:admin_panel/constants/order_firestore_db.dart';
import 'package:admin_panel/models/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  Rx<List<OrderModel>> orders = Rx<List<OrderModel>>([]);
  List<OrderModel> get orderList => orders.value;

  @override
  void onReady() {
    orders.bindStream(OrderFirestoreDb.orderStream());
  }
}
