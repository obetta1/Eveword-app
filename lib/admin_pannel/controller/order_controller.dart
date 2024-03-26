import 'package:ecomerce/admin_pannel/model/orders.dart';
import 'package:ecomerce/admin_pannel/services/database_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();
  var newOrder = {}.obs;
  var pendingOders = <Orders>[].obs;
  var orders = <Orders>[].obs;

  var index = 1.obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOders.bindStream(database.getPendingOrders());
    super.onInit();
  }

  void updateOrder(Orders orders, String field, dynamic newValue) {
    database.updateOrder(orders, field, newValue);
  }

  void addOrderTofirebase(Orders orders) {
    database.addOrders(orders);
  }
}
