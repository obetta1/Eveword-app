import 'package:ecomerce/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecomerce/blocs/category/bloc/category_bloc.dart';
import 'package:ecomerce/blocs/checkout/checkout_bloc.dart';
import 'package:ecomerce/config/app_router.dart';
import 'package:ecomerce/config/theme.dart';
import 'package:ecomerce/repository/checkout/checkout_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/product_bloc/product_bloc.dart';
import 'repository/repository.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (context) => CheckoutBloc(
                cartBloc: context.read<CartBloc>(),
                checkoutRepository: CheckoutRepository())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategoryEvent())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProductsEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeData(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: const SplashScreen(),
      ),
    );
  }
}
