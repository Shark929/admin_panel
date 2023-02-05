import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/vendor_wallet.dart';
import 'package:admin_panel/models/vendor_wallet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendorWalletFirestoreDb {
  static Stream<List<VendorWalletModel>> walletStream() {
    return firebaseFirestore
        .collection('wallets')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<VendorWalletModel> wallets = [];

      for (var wallet in querySnapshot.docs) {
        final vendorWalletModel =
            VendorWalletModel.fromDocumentSnapshot(documentSnapshot: wallet);
        wallets.add(vendorWalletModel);
      }
      return wallets;
    });
  }

  //update
  static updateStatus(int isApproved, documentId, double amount) {
    double newAmount = amount - (amount * 0.2);
    firebaseFirestore.collection('wallets').doc(documentId).update(
      {
        'code': isApproved,
        'amount': newAmount.toStringAsFixed(2),
      },
    );
  }
  //delete

  //create vendor new wallet
  static addNewBalance(
      WalletBalanceModel walletBalanceModel, String vendorId) async {
    await firebaseFirestore.collection('walletBalance').doc(vendorId).set({
      'balance': walletBalanceModel.balance,
      // 'date': walletBalanceModel.date,
      'vendorId': walletBalanceModel.vendorId,
    });
  }

  static addNewRevenue(
      WalletBalanceModel walletBalanceModel, String vendorId) async {
    await firebaseFirestore.collection('revenue').doc(vendorId).set({
      'balance': walletBalanceModel.balance,
      // 'date': walletBalanceModel.date,
      'vendorId': walletBalanceModel.vendorId,
    });
  }
}
