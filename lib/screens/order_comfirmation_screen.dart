import 'package:ecomerce/models/product_model.dart';
import 'package:ecomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';

class OrderComfirmationScreen extends StatelessWidget {
  OrderComfirmationScreen({super.key});

  static const String routeName = '/comfirm_order';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => OrderComfirmationScreen());
  }

  final ProductModel products = ProductModel.products[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'comfirm order'),
        bottomNavigationBar: const CustomNavBar(screen: routeName),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  color: Colors.blue[500],
                  width: double.infinity,
                  height: 250,
                ),
                Positioned(
                  top: 125,
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  child: const Image(
                    image: AssetImage('assets/images/order-logo.jpg'),
                    height: 90,
                    width: 110,
                  ),
                ),
                Positioned(
                  top: 220,
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Text('Your order is completed',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ORDER CODE: 0043-5678 ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Thank you for purchasing frome Eve world Ltd ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: Colors.black)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('ORDER CODE: 0043-5678 ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black)),
                  const OrderSummary(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('ORDER DETAILS',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.black)),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CartLoaded) {
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.cart
                              .productQauntity(state.cart.products)
                              .keys
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return OrderSummaryCard(
                                products: state.cart
                                    .productQauntity(state.cart.products)
                                    .keys
                                    .elementAt(index),
                                qauntity: state.cart
                                    .productQauntity(state.cart.products)
                                    .values
                                    .elementAt(index));
                          },
                        );
                      } else {
                        return const Text('something went wrong');
                      }
                    },
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
