import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/constants/constants.dart';
import 'package:ecomerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;
  static const String routeName = '/product';

  static Route route({required ProductModel product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(
              product: product,
            ));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/wishlist');
                  },
                  icon: const Icon(Icons.favorite, color: Colors.white)),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                        Navigator.pushReplacementNamed(context, '/cart');
                      },
                      child:
                          Text('ADD TO CART', style: textTheme.headlineLarge));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height),
          items: [
            HeroCarousel(
              product: product,
            )
          ],
        ),
        StackCard(
          product: product.name,
          price: product.price.toString(),
        ),
        const ExpandedText(
            title: 'Product Information', description: productDes),
        const ExpandedText(
            title: 'Delivery Information', description: productDes)
      ]),
    );
  }
}
