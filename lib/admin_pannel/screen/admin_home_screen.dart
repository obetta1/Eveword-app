import 'package:charts_flutter_new/flutter.dart' as chart;
import 'package:ecomerce/admin_pannel/controller/order_controller.dart';
import 'package:ecomerce/admin_pannel/controller/order_stats_controller.dart';
import 'package:ecomerce/admin_pannel/model/order_stats.dart';
import 'package:ecomerce/admin_pannel/screen/new_product_screen.dart';
import 'package:ecomerce/admin_pannel/screen/screens.dart';
import 'package:ecomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdminHomeScreen extends StatelessWidget {
  static String routeName = '/admin';
  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => AdminHomeScreen());
  }

  AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Admin'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('order cart'),
          FutureBuilder(
              future: orderStatsController.stats.value,
              builder: (BuildContext context,
                  AsyncSnapshot<List<OrderStats>> snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomBarchart(orderStats: snapshot.data!),
                      ));
                } else if (snapshot.hasError) {
                  return const Text('snapshot.hasError');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
          // this can be used to add orderstats to backend
          InkWell(
              onTap: () {
                orderStatsController.addOrderStats(OrderStats.data.first);
              },
              child: Text('Add order Stats')),
          const Text('charts of monthly sales'),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.to(NewProductScreen());
                    },
                    child: const Text(
                      'Add New Product',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                // ElevatedButton(
                //     onPressed: () {},
                //     child: const Text(
                //       'View all Product',
                //       style: TextStyle(
                //         fontSize: 20,
                //       ),
                //     )),
                ElevatedButton(
                    onPressed: () {
                      Get.to(OrderScreen());
                    },
                    child: const Text(
                      'Manage order',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                // ElevatedButton(
                //     onPressed: () {},
                //     child: const Text(
                //       'Edit Product',
                //       style: TextStyle(
                //         fontSize: 20,
                //       ),
                //     ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomBarchart extends StatelessWidget {
  const CustomBarchart({super.key, required this.orderStats});
  final List<OrderStats> orderStats;

  @override
  Widget build(BuildContext context) {
    List<chart.Series<OrderStats, String>> series = [
      chart.Series(
          id: 'orders',
          data: orderStats,
          domainFn: (series, _) =>
              DateFormat.ms().format(series.dateTime).toString(),
          measureFn: (series, _) => series.orders,
          colorFn: (series, _) => series.barColor!)
    ];
    return chart.BarChart(
      series,
      animate: true,
    );
  }
}
