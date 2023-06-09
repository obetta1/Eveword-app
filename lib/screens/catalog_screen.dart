import 'package:ecomerce/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/product_bloc/product_bloc.dart';
import '../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: const CustomNavBar(
          screen: routeName,
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoaded) {
              List<ProductModel> categoryProduct = state.products
                  .where((product) => product.category == category.name)
                  .toList();
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.15,
                ),
                itemCount: categoryProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    products: categoryProduct[index],
                    widthFactor: 2.2,
                  );
                },
              );
            } else {
              return const Text('something went wrong');
            }
          },
        ));
  }
}
