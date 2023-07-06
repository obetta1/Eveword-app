import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/admin_pannel/model/model.dart';
import 'package:ecomerce/admin_pannel/services/database_service.dart';
import 'package:get/get.dart';

class OrderStatsController extends GetxController {
  final DatabaseService database = DatabaseService();
  var stats = Future.value(<OrderStats>[]).obs;

  @override
  void onInit() {
    stats.value = database.getOrderStats();
    super.onInit();
  }

  void addOrderStats(OrderStats orderStats) {
    database.addOrderStats(orderStats);
  }
}
