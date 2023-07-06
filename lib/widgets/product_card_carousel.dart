import 'package:flutter/material.dart';
import '../models/models.dart';
import 'widgets.dart';

class ProductCardCarousel extends StatelessWidget {
  const ProductCardCarousel({Key? key, required this.products})
      : super(key: key);

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: ProductCard(products: products[index]),
          );
        },
      ),
    );
  }
}
