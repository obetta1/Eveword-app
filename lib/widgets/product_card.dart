import 'package:ecomerce/blocs/bloc/home_bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
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

  final HomeBloc homeBloc = HomeBloc();
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
            height: 150,
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
              //margin: EdgeInsets.symmetric(horizontal: 20.0),
              width: 5,
              height: 40,
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        products.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        products.price.toString(),
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

                                  // homeBloc.add(AddToWishListPageEvent(
                                  //     products: products));
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
                      ? IconButton(
                          onPressed: () {
                            homeBloc.add(
                                RemoveItemFromWishListEvent(product: products));
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
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
