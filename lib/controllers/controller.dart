import 'package:get/get.dart';

class MyController extends GetxController {
  var count = 0.obs;

  /// method to increase the count value
  void countIncrease() {
    count++;
  }

  /// method to Decrease the count value
  void countDecrease() {
    count--;
  }

  /// method to Reset the count value
  void countReset() {
    count.value = 0;
  }
}
