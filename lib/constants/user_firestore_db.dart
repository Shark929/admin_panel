import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestoreDb {
  //create
  static addUser(UserModel userModel) async {
    await firebaseFirestore.collection('users').add({
      'username': userModel.username,
      'email': userModel.email,
      'phoneNum': userModel.phoneNum,
    });
  }

  //read
  static Stream<List<UserModel>> userStream() {
    return firebaseFirestore
        .collection('users')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<UserModel> users = [];

      for (var user in querySnapshot.docs) {
        final userModel =
            UserModel.fromDocumentSnapshot(documentSnapshot: user);

        users.add(userModel);
      }

      return users;
    });
  }
  //update

  //delete
  static deleteUser(String documentId) {
    firebaseFirestore.collection('users').doc(documentId).delete();
  }
}
