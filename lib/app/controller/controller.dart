import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController {
  RxInt quantity = 0.obs;
  RxInt quantityCartItem = 0.obs;
  List<Map<String, dynamic>> productsCart = [];
  double amount(int quantity, double value) {
    return quantity * value;
  }
}
