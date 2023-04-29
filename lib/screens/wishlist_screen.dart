import 'package:ecomerce/blocs/bloc/home_bloc/home_bloc.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishListScreen());
  }

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final HomeBloc homebloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Wishlist',
      ),
      bottomNavigationBar: const CustomNavBar(
        screen: WishListScreen.routeName,
      ),
      body: Wishlist(textTheme: textTheme),
    );
  }
}

class Wishlist extends StatefulWidget {
  const Wishlist({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  final HomeBloc homeBloc = HomeBloc();
  final int itemlenght = 0;
  late final ProductModel wishlist;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeLoadedSuccess) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 28.0,
                vertical: 16.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.3,
              ),
              itemCount:
                  wishlist.props.length, //state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  products: ProductModel
                      .products[index], //tate.wishlist.products[index],
                  widthFactor: 1.0,
                  tagWidthFactor: MediaQuery.of(context).size.width * 0.5,
                  isWishlist: true,
                );
              },
            );
          } else {
            return Text(
              'Something $state',
              style: widget.textTheme.displayMedium,
            );
          }
        });
  }
}
