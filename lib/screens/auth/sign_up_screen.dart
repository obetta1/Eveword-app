import 'package:ecomerce/widgets/aut_input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../screens.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SignUpScreen());
  }

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    double wSize = MediaQuery.of(context).size.width;
    double hSize = MediaQuery.of(context).size.height;

    List images = ['g.png', 'f.png', 't.png'];
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
         // if(state is SignUpEvent)
          return Column(
            children: [
              // appbar container used to decorate the appbar
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
                      height: hSize * 0.16,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    'assets/images/order-logo.jpg',
                                  )))),
                    ),
                  ],
                ),
              ),
              //email text input field
              AutImputField(
                controller: emailController,
                label: 'email',
                icon: Icons.email_rounded,
              ),
              const SizedBox(height: 20),
              //password text input field
              AutImputField(
                controller: passwordController,
                label: 'password',
                icon: Icons.password_rounded,
              ),
              const SizedBox(
                height: 40,
              ),
              // signup button
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => {
                    if (emailController.text.isEmail &&
                        passwordController.text.isNotEmpty)
                      {
                       context.read<AuthBloc>().add(SignUpEvent(
                            email: emailController.text,
                            password: passwordController.text))
                      }
                  }, //AuthController.instance.register(
                  //     emailController.text.trim(), passwordController.text.trim()),
                  child: Container(
                    alignment: Alignment.center,
                    width: wSize * 0.5,
                    height: hSize * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/loginbtn.png'))),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              //reichtext this is used to nevigate to th login screen if the user already has an accounnt

              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const LoginScreen()),
                      text: 'have an account?',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 18,
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
