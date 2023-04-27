import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/home'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              height: 200,
              width: 200,
            ),
          ),
          Container(
            color: Colors.deepOrange[900],
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
              child: Text(
                'Eve World',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
