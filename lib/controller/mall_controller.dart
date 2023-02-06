import 'package:admin_panel/constants/location_firestore_db.dart';
import 'package:admin_panel/constants/mall_firestore_db.dart';
import 'package:get/get.dart';
import '../models/mall_model.dart';

class MallController extends GetxController {
  Rx<List<MallModel>> mallList = Rx<List<MallModel>>([]);

  List<MallModel> get mall => mallList.value;

  @override
  void onReady() {
    mallList.bindStream(MallFirestoreDb.mallStream());
  }
}
