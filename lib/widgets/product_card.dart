import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../models/models.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {Key? key,
      required this.products,
      this.widthFactor = 2.5,
      this.tagWidthFactor = 70,
      this.isWishlist = false})
      : super(key: key);

  final double widthFactor;
  final double tagWidthFactor;
  final ProductModel products;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: products);
      },
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 180,
            child: Image.network(
              products.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: tagWidthFactor,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor,
              height: 50,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            right: tagWidthFactor + 5,
            child: Container(
              width: 5,
              height: 40,
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Text(
                          products.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text(
                        '₦${products.price}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Expanded(
                      flex: 5,
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return const CircularProgressIndicator();
                          }
                          if (state is CartLoaded) {
                            return IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdded(products));
                                },
                                icon: const Icon(
                                  Icons.add_circle_rounded,
                                  color: Colors.white,
                                ));
                          } else {
                            return const Text('something went wrong');
                          }
                        },
                      )),
                  isWishlist
                      ? BlocBuilder<WishlistBloc, WishlistState>(
                          builder: (context, state) {
                            return IconButton(
                                onPressed: () {
                                  context
                                      .read<WishlistBloc>()
                                      .add(RemoveFreomWishlist(products));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ));
                          },
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
