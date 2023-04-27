import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../models/models.dart';

class CatProductCard extends StatelessWidget {
  const CatProductCard(
      {super.key, required this.products, required this.qauntity});

  final ProductModel products;
  final String qauntity;

  @override
  Widget build(BuildContext context) {
    var textheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            products.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.name,
                  style: textheme.displaySmall,
                ),
                Text(
                  '₦${products.price}',
                  style: textheme.displaySmall,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemoved(products));
                      },
                      icon: const Icon(Icons.remove_circle)),
                  Text(
                    qauntity,
                    style: textheme.displaySmall,
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductAdded(products));
                      },
                      icon: const Icon(Icons.add_circle))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
