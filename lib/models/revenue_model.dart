import 'package:cloud_firestore/cloud_firestore.dart';

class RevenueModel {
  late String balance;
  late String vendorId;

  RevenueModel({
    required this.balance,
    required this.vendorId,
  });

  RevenueModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    balance = documentSnapshot['balance'];
    vendorId = documentSnapshot['vendorId'];
  }
}
