import 'package:ecomerce/widgets/custom_imputfield.dart';
import 'package:ecomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/checkout/checkout_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  static const String routeNane = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeNane),
        builder: (_) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: const CustomNavBar(
        screen: routeNane,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const CircularProgressIndicator();
            } else if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'CUSTOMER IMFORMATION',
                      style: textheme.headlineMedium,
                    ),
                  ),
                  CustomInputField(
                      onChange: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateChackout(email: value));
                      },
                      label: 'Email',
                      hintText: 'Enter eamil'),
                  CustomInputField(
                      onChange: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateChackout(fullName: value));
                      },
                      label: 'Full name',
                      hintText: 'Full name'),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Text(
                      'DELIVERY IMFORMATION',
                      style: textheme.headlineMedium,
                    ),
                  ),
                  CustomInputField(
                      onChange: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateChackout(address: value));
                      },
                      label: 'Address',
                      hintText: 'Enter address'),
                  CustomInputField(
                      onChange: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateChackout(city: value));
                      },
                      label: 'City',
                      hintText: 'City'),
                  CustomInputField(
                      onChange: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateChackout(country: value));
                      },
                      label: 'Country',
                      suffixIcon: true,
                      hintText: 'Enter country'),
                  CustomInputField(
                      onChange: (value) {
                        context
                            .read<CheckoutBloc>()
                            .add(UpdateChackout(zipecode: value));
                      },
                      label: 'Zipcode',
                      hintText: 'enter zipcode'),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/payment');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 50,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SELECT A PAYMENT METHOD",
                              style: textheme.displaySmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '→',
                              style: textheme.displaySmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Oder Summary',
                      style: textheme.headlineLarge,
                    ),
                  ),
                  const OrderSummary()
                ],
              );
            } else {
              return const Text('something went wrong');
            }
          },
        ),
      ),
    );
  }
}