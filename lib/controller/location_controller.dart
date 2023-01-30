import 'package:admin_panel/constants/location_firestore_db.dart';
import 'package:admin_panel/models/location_model.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  Rx<List<LocationModel>> locationList = Rx<List<LocationModel>>([]);

  List<LocationModel> get location => locationList.value;

  @override
  void onReady() {
    locationList.bindStream(LocationFirestoreDb.locationStream());
  }
}
