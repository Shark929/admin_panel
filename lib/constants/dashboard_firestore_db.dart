import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/dashboard_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardFirestoreDb {
  //create
  static addVendorDashboard(
      DashboardModel dashboardModel, String vendorId) async {
    await firebaseFirestore.collection('dashboard').doc(vendorId).set({
      'dineIn': dashboardModel.dineIn,
      'takeAway': dashboardModel.takeAway,
      'totalCustomers': dashboardModel.totalCustomers,
      'totalOrders': dashboardModel.totalOrders,
      'vendorId': dashboardModel.vendorId,
    });
  }

  //read
  static Stream<List<DashboardModel>> dashboardStream() {
    return firebaseFirestore
        .collection('dashboard')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<DashboardModel> dashboards = [];
      for (var dashboard in querySnapshot.docs) {
        final dashboardModel = DashboardModel.fromDocumentSnapshot(dashboard);
        dashboards.add(dashboardModel);
      }

      return dashboards;
    });
  }

  //update
  static updateTotalOrders(String newOrders, documentId) {
    firebaseFirestore.collection('menus').doc(documentId).update(
      {
        'totalOrders': newOrders,
      },
    );
  }
  //delete
}
