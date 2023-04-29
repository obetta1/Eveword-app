import 'package:ecomerce/blocs/bloc/home_bloc/home_bloc.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        title: const Text('home'),
        actions: [
          IconButton(
              onPressed: () {
                ///homebloc.add(HomeProdWishlistButtonNavigateEvent());
              },
              icon: const Icon(Icons.favorite_border)),
          IconButton(
              onPressed: () {
                //homebloc.add(HomeCartButtonNavigateEvent());
              },
              icon: const Icon(Icons.shopping_bag_outlined))
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
