import 'package:get/get.dart';

class IndexController extends GetxController {
  int index = 0;
  void getIndex(int setIndex) {
    index = setIndex;
    update();
  }
}
