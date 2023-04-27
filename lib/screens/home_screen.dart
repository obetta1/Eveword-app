import 'package:ecomerce/blocs/bloc/home_bloc/home_bloc.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final HomeBloc homebloc = HomeBloc();

    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeToCartPageActionState) {
          Navigator.of(context).pushNamed('/cart');
        } else if (state is HomeToWishlistPageActionState) {
          Navigator.of(context).pushNamed('/wishlist');
        }
        if (state is AddToWishListPageState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            'item has beeb add',
            style: TextStyle(color: Colors.white),
          )));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('home'),
              actions: [
                IconButton(
                    onPressed: () {
                      homebloc.add(HomeProdWishlistButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite_border)),
                IconButton(
                    onPressed: () {
                      homebloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined))
              ],
            ),
            bottomNavigationBar: const CustomNavBar(),
            body: ListView(children: [
              Column(
                children: [
                  const CustomCarousel(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SectionTile(title: 'RECOMMENDED'),
                  ProductCardCarousel(
                      products: ProductModel.products
                          .where((product) => product.isRecommended)
                          .toList()),
                  //CustomCarousel()
                  const SectionTile(title: 'POPULAR'),
                  ProductCardCarousel(
                      products: ProductModel.products
                          .where((product) => product.isPopular)
                          .toList()),
                ],
              ),
            ]),
          );
        }
      },
    );
  }
}
