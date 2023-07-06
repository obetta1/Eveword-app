import 'dart:async';

import 'package:ecomerce/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../blocs/auth/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          print('splash screen state===${state.status}');
          Timer(const Duration(seconds: 3), () {
            if (state.status == AuthStatus.unAuthenticated) {
              Get.to(const LoginScreen());
            } else if (state.status == AuthStatus.authenticated) {
              Get.to(const HomeScreen());
            } else if (state.status == AuthStatus.unknown) {
              Get.to(const SignUpScreen());
            }
            //  Navigator.pushReplacementNamed(context, '/home');
          });

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/images/order-logo.jpg'),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
