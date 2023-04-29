import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/user';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const UserScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(title: 'user'),
        bottomNavigationBar: CustomNavBar(
          screen: routeName,
        ));
  }
}
