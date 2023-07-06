import 'package:ecomerce/admin_pannel/controller/order_controller.dart';
import 'package:ecomerce/widgets/stack_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart_bloc/cart_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});


  @override
  Widget build(BuildContext context) {
    final TextTheme textheme = Theme.of(context).textTheme;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {




          return Column(
            children: [
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: textheme.displaySmall,
                        ),
                        Text(
                          '₦${state.cart.subtotalString}',
                          style: textheme.displaySmall,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DELIVERY FEE',
                          style: textheme.displaySmall,
                        ),
                        Text(
                          '₦${state.cart.deliverFee}',
                          style: textheme.displaySmall,
                        )
                      ],
                    )
                  ],
                ),
              ),
              StackCard(
                product: 'TOTAL',
                price: "₦${state.cart.deliverFee + state.cart.subtotal}",
              )
            ],
          );
        } else {
          return const Text('something went wrong');
        }
      },
    );
  }
}
