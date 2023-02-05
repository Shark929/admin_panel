import 'package:admin_panel/constants/dashboard_firestore_db.dart';
import 'package:admin_panel/models/dashboard_model.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<List<DashboardModel>> dashboard = Rx<List<DashboardModel>>([]);

  List<DashboardModel> get dashboardList => dashboard.value;

  @override
  void onReady() {
    dashboard.bindStream(DashboardFirestoreDb.dashboardStream());
  }
}
