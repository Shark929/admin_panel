import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  String? vendorId;
  late String vendorRestaurantName;
  late String vendorPhone;
  late String vendorEmail;
  late String vendorLocation;
  late String vendorMall;
  late String vendorImage;
  late bool isAuthorise;

  VendorModel({
    this.vendorId,
    required this.vendorRestaurantName,
    required this.vendorEmail,
    required this.vendorPhone,
    required this.vendorLocation,
    required this.vendorMall,
    required this.vendorImage,
    required this.isAuthorise,
  });

  VendorModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    vendorId = documentSnapshot['vendorId'];
    vendorRestaurantName = documentSnapshot['vendorRestaurantName'];
    vendorEmail = documentSnapshot['vendorEmail'];
    vendorPhone = documentSnapshot['vendorPhone'];
    vendorLocation = documentSnapshot['vendorLocation'];
    vendorMall = documentSnapshot['vendorMall'];
    vendorImage = documentSnapshot['vendorImage'];
    isAuthorise = documentSnapshot['isAuthorise'];
  }
}
