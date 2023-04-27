import 'package:flutter/material.dart';

class StackCard extends StatelessWidget {
  final String product;
  final String price;

  const StackCard({super.key, required this.product, required this.price});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            alignment: Alignment.bottomCenter,
            color: Colors.black.withAlpha(50),
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width - 10,
            height: 50,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product,
                    style: textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    price,
                    style: textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
