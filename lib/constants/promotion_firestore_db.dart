import 'package:admin_panel/constants/constants.dart';
import 'package:admin_panel/models/promotion_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromotionFirestoreDb {
  //create
  static addPromotion(PromotionModel promotionModel) async {
    await firebaseFirestore.collection('promotion').add({
      'promotionLabel': promotionModel.promotionLabel,
      'promotionPercentage': promotionModel.promotionPercentage,
      'promotionDescription': promotionModel.promotionDescription,
      'promotionCode': promotionModel.promotionCode,
      // 'startDate': promotionModel.startDate,
      // 'endDate': promotionModel.endDate,
    });
  }

  //read
  static Stream<List<PromotionModel>> promotionStream() {
    return firebaseFirestore
        .collection('promotion')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<PromotionModel> promotions = [];

      for (var promotion in querySnapshot.docs) {
        final promotionModel =
            PromotionModel.documentSnapshot(documentSnapshot: promotion);

        promotions.add(promotionModel);
      }

      return promotions;
    });
  }
  //update

  //delete

  static deletePromotion(String documentId) {
    firebaseFirestore.collection('promotion').doc(documentId).delete();
  }
}
