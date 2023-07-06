import 'package:ecomerce/admin_pannel/controller/order_controller.dart';
import 'package:ecomerce/admin_pannel/model/orders.dart';
import 'package:ecomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order';

  final OrderController orderController = Get.put(OrderController());

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => OrderScreen());
  }

  OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List orders = [orderController.orders, orderController.pendingOders];

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'orders',
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlue.withAlpha(40),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: 40,
                          color: orderController.index.value == 0
                              ? Colors.lightBlue.withAlpha(40)
                              : Colors.white,
                          child: TextButton(
                              onPressed: () {
                                orderController.index.value = 0;
                              },
                              child: const Text('All orders')),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          color: orderController.index.value == 1
                              ? Colors.lightBlue.withAlpha(40)
                              : Colors.white,
                          child: TextButton(
                              onPressed: () {
                                orderController.index.value = 1;
                              },
                              child: const Text('Pending orders')),
                        ),
                      )
                    ],
                  )),
              Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: orders[orderController.index.value].lenght,
                    itemBuilder: (BuildContext context, int index) {
                      //print('${orderController.orders[index]}');
                      return OrderCard(
                        order: orders[orderController.index.value][index],
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
