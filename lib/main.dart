import 'package:ecomerce/admin_pannel/controller/auth_controller.dart';
import 'package:ecomerce/blocs/auth/auth_bloc.dart';
import 'package:ecomerce/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecomerce/blocs/category/bloc/category_bloc.dart';
import 'package:ecomerce/blocs/checkout/checkout_bloc.dart';
import 'package:ecomerce/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:ecomerce/config/app_router.dart';
import 'package:ecomerce/config/theme.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:ecomerce/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'blocs/product_bloc/product_bloc.dart';
import 'repository/repository.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => UserRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(
                  authRepository: context.read<AuthRepository>(),
                  userRepository: context.read<UserRepository>())),
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
                ..add(LoadProductsEvent())),
          BlocProvider(
              create: (_) =>
                  WishlistBloc(localStorageRepository: LocalStorageRepository())
                    ..add(WishlistStarted()))
        ],
        child: GetMaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeData(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
