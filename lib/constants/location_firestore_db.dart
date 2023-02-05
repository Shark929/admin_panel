import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationFirestoreDb {
  //add function
  static addLocation(LocationModel locationModel) async {
    await firebaseFirestore.collection('location').add({
      'locationName': locationModel.locationName,
    });
  }

  //get function
  static Stream<List<LocationModel>> locationStream() {
    return firebaseFirestore
        .collection('location')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<LocationModel> locations = [];
      for (var location in querySnapshot.docs) {
        final locationModel =
            LocationModel.fromDocumentSnapshot(documentSnapshot: location);

        locations.add(locationModel);
      }

      return locations;
    });
  }

  //update function

  //delete function
  static deleteLocation(String locationId) {
    firebaseFirestore
        .collection('admin')
        .doc(adminId)
        .collection('location')
        .doc(locationId)
        .delete();
  }
}
