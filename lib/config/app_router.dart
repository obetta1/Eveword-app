import 'package:ecomerce/models/models.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case UserScreen.routeName:
        return UserScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as ProductModel);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CheckoutScreen.routeNane:
        return CheckoutScreen.route();
      default:
        return _errorRoute();
    }
  }

  static _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('error'),
              ),
            ));
  }
}
