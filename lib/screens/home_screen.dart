import 'package:ecomerce/admin_pannel/screen/admin_home_screen.dart';
import 'package:ecomerce/admin_pannel/screen/new_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../admin_pannel/screen/screens.dart';
import '../blocs/product_bloc/product_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/order-logo.jpg',
          height: 50,
        ),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                //Get.to(NewProductScreen());
                Get.to(AdminHomeScreen());
              },
              child: const Text('Admin'))
        ],
      ),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: ListView(children: [
        Column(
          children: [
            const CustomCarousel(),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                return Column(
                  children: [
                    const SectionTile(title: 'RECOMMENDED'),
                    ProductCardCarousel(
                        products: state.products
                            .where((product) => product.isRecommended)
                            .toList()),
                    const SectionTile(title: 'POPULAR'),
                    ProductCardCarousel(
                        products: state.products
                            .where((product) => product.isPopular)
                            .toList()),
                  ],
                );
              } else {
                return const Text('Something went wrong');
              }
            })
          ],
        ),
      ]),
    );
  }
}
