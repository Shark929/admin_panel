import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/user_model.dart';
import 'package:admin_panel/models/wallet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<List<User>> _users = Rx<List<User>>([]);
  List<User> get user => _users.value;
  final Rx<List<WalletModel>> _wallets = Rx<List<WalletModel>>([]);
  List<WalletModel> get wallet => _wallets.value;
  getUser() async {
    firebaseFirestore
        .collection('users')
        // .doc()
        // .collection(collectionPath)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<User> returnValue = [];
      for (var element in querySnapshot.docs) {
        returnValue.add(User.fromSnap(element));
      }
      return returnValue;
    });
  }

  getWallet() async {
    _wallets.bindStream(firebaseFirestore
        .collection('wallets')
        .doc("A4RsmDZlodSRWuwvveAb8YZE1293")
        .collection('transactions')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<WalletModel> returnValue = [];
      for (var element in querySnapshot.docs) {
        returnValue.add(WalletModel.fromSnap(element));
      }
      return returnValue;
    }));
  }
}
