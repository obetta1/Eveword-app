import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/admin_pannel/controller/order_controller.dart';
import 'package:ecomerce/admin_pannel/model/orders.dart';
import 'package:ecomerce/widgets/custom_imputfield.dart';
import 'package:ecomerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../blocs/checkout/checkout_bloc.dart';
import '../utils/validation.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  static const String routeNane = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeNane),
        builder: (_) => CheckoutScreen());
  }
  final OrderController orderController = Get.put(OrderController());
  final formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                if (state is CheckoutLoading) {
                  return const CircularProgressIndicator();
                } else if (state is CheckoutLoaded) {
                  return Form(
                    key: formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          validaton: (value){ return Validate.validateField(value);},
                            onChange: (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateChackout(email: value));
                            },
                            label: 'Email',
                            hintText: 'Enter eamil'),
                        CustomInputField(
                          validaton:  (value)=>Validate.validateEmail(value),

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
                          validaton: (val){},
                            onChange: (value) {
                              orderController.newOrder.update(
                                  'customerId', (_) => value,
                                  ifAbsent: () => value);
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateChackout(address: value));
                            },
                            label: 'Address',
                            hintText: 'Enter address'),
                        CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateChackout(city: value));
                            },
                            label: 'City',
                            hintText: 'City'),
                        CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateChackout(country: value));
                            },
                            label: 'Country',
                            suffixIcon: true,
                            hintText: 'Enter country'),
                        CustomInputField(
                            validaton: (val){},
                            onChange: (value) {
                              context
                                  .read<CheckoutBloc>()
                                  .add(UpdateChackout(zipecode: value));
                            },
                            label: 'Zipcode',
                            hintText: 'enter zipcode'),
                        InkWell(
                          onTap: () {
                            if(formKey.currentState!.validate()){
                              saveOrdersToFirebase();
                              Navigator.pushReplacementNamed(context, '/payment');
                            }

                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            width: MediaQuery.of(context).size.width - 10,
                            height: 50,
                            color: Colors.black,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
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
                    ),
                  );
                } else {
                  return const Text('something went wrong');
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void saveOrdersToFirebase(){
print(orderController.newOrder.value);
    orderController.addOrderTofirebase(Orders(
        id: orderController.newOrder['id'],
        customerId: "re@gamil.com",
        productId: [ int.parse( orderController.newOrder['productId'])],
        deliveryFee: orderController.newOrder['deliveryFee'],
        subtotal: orderController.newOrder['subtotal'],
        total: orderController.newOrder['total'],
        isAccepted: false,
        isDelivered: false,
        createdAt: DateTime.now(),
        isCancled: false )
    );
  }
}
