import 'package:ecomerce/widgets/payment.dart';
import 'package:ecomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/checkout/checkout_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static const String routeNane = '/payment';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeNane),
        builder: (_) => const PaymentScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'payment'),
      body: Container(
        alignment: Alignment.center,
        child:
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CheckoutLoaded) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: OutlinedButton(
                        onPressed: () {
                          PaymentPaystack(
                                  price: state.total,
                                  email: state.email!,
                                  ctx: context)
                              .chargeCardandMakepayment();
                        },
                        child: const Text(
                          'Pay with Paystack',
                          style: TextStyle(fontSize: 24),
                        )),
                  ),
                  //GooglePay(total: state.total.toString(), products: state.products!)
                ]);
          } else {
            return const Text('Error has occour');
          }
        }),
      ),
    );
  }
}
