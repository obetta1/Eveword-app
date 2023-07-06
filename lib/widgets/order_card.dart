import 'package:ecomerce/admin_pannel/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../admin_pannel/model/model.dart';

class OrderCard extends StatelessWidget {
  final Orders order;
  final OrderController orderController = Get.find();
  OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    var products = Products.products
        .where((product) => order.productId.contains(product.id))
        .toList();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Text('Customer id:  ${order.customerId}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order id:  ${order.id}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Date created:  ${DateFormat('dd-MM-yyyy').format(order.createdAt)}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                products[index].imageUrl,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            SizedBox(
                                child: Text(
                              products[index].description,
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ))
                          ],
                        ),
                      ),
                    ],
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Delivery fee:',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('₦${order.deliveryFee}',
                        style: Theme.of(context).textTheme.headlineMedium)
                  ],
                ),
                Column(
                  children: [
                    Text('Total:',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('₦${order.total}',
                        style: Theme.of(context).textTheme.headlineMedium)
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                order.isDelivered
                    ? const Text(
                        'This is order has been Delivered',
                        style: TextStyle(color: Colors.green),
                      )
                    : order.isAccepted
                        ? ElevatedButton(
                            onPressed: () => {
                              orderController.updateOrder(
                                  order, 'isDelivered', !order.isDelivered),
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                minimumSize: const Size(130, 40)),
                            child: const Text(
                              'mark order as Delivered',
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () => {
                              orderController.updateOrder(
                                  order, 'isAccepted', !order.isAccepted),
                              orderController.updateOrder(
                                  order, 'isCancled', false)
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                minimumSize: const Size(130, 40)),
                            child: const Text(
                              'Accept',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                !order.isDelivered && !order.isCancled
                    ? ElevatedButton(
                        onPressed: () => {
                          orderController.updateOrder(
                              order, 'isCancled', !order.isCancled),
                          orderController.updateOrder(
                              order, 'isAccepted', false),
                          orderController.updateOrder(
                              order, 'isDelivered', false),
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size(130, 40)),
                        child: const Text(
                          'Declined',
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    : order.isCancled
                        ? const Text('order has been cancled',
                            style: TextStyle(color: Colors.red))
                        : const SizedBox()
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
