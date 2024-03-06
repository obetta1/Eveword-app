import 'package:ecomerce/admin_pannel/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
    final order = Get.put(OrderController());
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'cart',
        showIcon: false,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue.shade400,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        order.newOrder.update(
                            'deliveryFee', (_) => state.cart.deliverFee,
                            ifAbsent: () => 0.0);
                        order.newOrder.update(
                            'subtotal', (_) => state.cart.subtotal,
                            ifAbsent: () => state.cart.subtotal);
                        order.newOrder.update('total', (_) => state.cart.total,
                            ifAbsent: () => state.cart.total);

                        Navigator.pushNamed(context, '/checkout');
                      },
                      child: Text('GO TO CHECKOUT',
                          style: textheme.displaySmall!
                              .copyWith(color: Colors.lightBlue)))
                ],
              ),
            );
          },
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const SizedBox(
                height: 200, child: CircularProgressIndicator());
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
  CartBody({
    super.key,
    required this.textheme,
    required this.deliveryFee,
    required this.state,
  });

  final CartLoaded state;
  final TextTheme textheme;
  final double deliveryFee;
  final order = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          style: TextStyle(color: Colors.white, fontSize: 16)))
                ],
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: state.cart
                        .productQauntity(state.cart.products)
                        .keys
                        .length,
                    itemBuilder: (context, index) {
                      order.newOrder.update(
                          'productId', (_) => state.cart.products[index].id,
                          ifAbsent: () => state.cart.products[index].id);
                      order.newOrder.update(
                          'id', (_) => state.cart.products[index].id,
                          ifAbsent: () => '12');

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
                    }),
              ),
            ],
          ),
          const OrderSummary(),
        ],
      ),
    );
  }
}
