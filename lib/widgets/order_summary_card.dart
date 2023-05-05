import 'package:flutter/material.dart';
import '../models/models.dart';

class OrderSummaryCard extends StatelessWidget {
  final ProductModel products;
  final int qauntity;

  const OrderSummaryCard({
    super.key,
    required this.products,
    required this.qauntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            products.imageUrl,
            fit: BoxFit.cover,
            height: 80,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(products.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Colors.black)),
                Text('QTY: $qauntity',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.black))
              ],
            ),
          ),
          Expanded(
            child: Text('₦${products.price}',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
