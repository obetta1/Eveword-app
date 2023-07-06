import 'package:ecomerce/widgets/aut_input_field.dart';
import 'package:ecomerce/widgets/custom_button.dart';
import 'package:ecomerce/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wSize = MediaQuery.of(context).size.width;
    var hSize = MediaQuery.of(context).size.height;
    final TextEditingController fullName = TextEditingController();
    final TextEditingController address = TextEditingController();
    final TextEditingController city = TextEditingController();
    final TextEditingController country = TextEditingController();
    final TextEditingController zipcode = TextEditingController();
    return  Scaffold(
      bottomNavigationBar: CustomNavBar(screen: '',),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
               height: hSize * 0.2 ,
             ),
             Text(
                'Update Profile',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white),
              ),
           ],
         ),
        ),

          AutImputField(
              controller: fullName,
              label: 'fullName',
              icon: Icons.person),
         const SizedBox(
            height: 10,
          ),
          AutImputField(
              controller: address,
              label: 'address',
              ),
          const SizedBox(
            height: 10,
          ),
          AutImputField(
              controller: city,
              label: 'city',
              icon: Icons.location_city),
          const SizedBox(
            height: 10,
          ),
          AutImputField(
              controller: country,
              label: 'country',
              ),
          const SizedBox(
            height: 10,
          ),
          AutImputField(
              controller: zipcode,
              label: 'zipcode',
              icon: Icons.code),
          const SizedBox(
            height: 10,
          ),

          CustomButton(label: 'Save' ,wSize: wSize, hSize: hSize, onpressed: (){

          }),

        ],
      ),
    );
  }
}
