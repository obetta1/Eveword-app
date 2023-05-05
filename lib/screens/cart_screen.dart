import 'package:ecomerce/models/models.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    var textheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'cart',
        showIcon: false,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Text('GO TO CHECKOUT', style: textheme.displaySmall))
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return CartBody(
              textheme: textheme,
              deliveryFee: state.cart.deliverFee,
              state: state,
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
    required this.textheme,
    required this.deliveryFee,
    required this.state,
  });

  final CartLoaded state;
  final TextTheme textheme;
  final double deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.cart.freeDeliver,
                    style: textheme.headlineLarge,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(),
                          elevation: 0),
                      child: const Text('Add more items',
                          style: TextStyle(color: Colors.white)))
                ],
              ),
              SizedBox(
                  height: 450,
                  child: ListView.builder(
                      itemCount: state.cart
                          .productQauntity(state.cart.products)
                          .keys
                          .length,
                      itemBuilder: (context, index) {
                        return CatProductCard(
                          products: state.cart
                              .productQauntity(state.cart.products)
                              .keys
                              .elementAt(index),
                          qauntity: state.cart
                              .productQauntity(state.cart.products)
                              .values
                              .elementAt(index)
                              .toString(),
                        );
                      })),
            ],
          ),
          const OrderSummary(),
        ],
      ),
    );
  }
}
