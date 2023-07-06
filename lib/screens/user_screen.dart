import 'package:ecomerce/admin_pannel/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../admin_pannel/screen/screens.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_bloc.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

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
    var wSize = MediaQuery.of(context).size.width;
    var hSize = MediaQuery.of(context).size.height;
    AuthController auth = Get.put(AuthController());
    return Scaffold(
      //appBar: CustomAppBar(title: 'user'),
      bottomNavigationBar: const CustomNavBar(
        screen: routeName,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            children: [
              //appbar container used to decorate the appbar

              Container(
                width: wSize,
                height: hSize * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/signup.png'),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: hSize * 0.05,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {Get.to(UpdateProfileScreen());},
                        icon: const Icon(Icons.edit),
                        label: const Text('edith profile')),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/images/order-logo.jpg',
                                  )))),
                    ),
                    Text(
                      'User name',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),

              CustomButton(
                label: 'Logout',
                wSize: wSize,
                hSize: hSize,
                onpressed: () {
                  auth.logoutUser();
                  // context.read<AuthBloc>().add(LogoutUserEvent());
                  // Get.to(const LoginScreen());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
