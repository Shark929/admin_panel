import 'package:admin_panel/constants/promotion_firestore_db.dart';
import 'package:admin_panel/models/promotion_model.dart';
import 'package:get/get.dart';

class PromotionController extends GetxController {
  Rx<List<PromotionModel>> promotionList = Rx<List<PromotionModel>>([]);

  List<PromotionModel> get promotion => promotionList.value;

  @override
  void onReady() {
    promotionList.bindStream(PromotionFirestoreDb.promotionStream());
  }
}
