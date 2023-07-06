import 'package:ecomerce/widgets/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/checkout/checkout_bloc.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key, required this.screen}) : super(key: key);

  final String screen;

  List<Widget> _selectNaveBar(BuildContext context, String screen) {
    switch (screen) {
      case '/cart':
        return _buildCartNavBar(context, screen);

      case '/checkout':
        return _buidCheckoutNavBar(context, screen);

      default:
        return _buildNavBar(context, screen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightBlue.shade400,
      child: SizedBox(
        height: 50,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _selectNaveBar(context, screen)),
      ),
    );
  }

  List<Widget> _buildNavBar(BuildContext context, String screen) {
    return <Widget>[
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: const Icon(Icons.shopping_cart, color: Colors.white)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
          icon: const Icon(Icons.person, color: Colors.white))
    ];
  }

  List<Widget> _buidCheckoutNavBar(BuildContext context, String screen) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CheckoutLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      context
                          .read<CheckoutBloc>()
                          .add(ComfiremCheckout(checkout: state.checkout));
                      Navigator.pushReplacementNamed(context, '/comfirm_order');
                      PaymentPaystack(
                              price: state.total,
                              email: state.email!,
                              ctx: context)
                          .chargeCardandMakepayment();
                    },
                    child: Text('ODER NOW',
                        style: Theme.of(context).textTheme.displaySmall))
              ],
            );
          } else {
            return const Text('something went wrong');
          }
        },
      ),
    ];
  }

  List<Widget> _buildCartNavBar(BuildContext context, String screen) {
    return [
      ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/checkout');
          },
          child: Text('GO TO CHECKOUT',
              style: Theme.of(context).textTheme.displaySmall))
    ];
  }
}
