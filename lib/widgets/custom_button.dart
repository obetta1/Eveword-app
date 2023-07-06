import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.wSize,
    required this.hSize,
    required this.onpressed,
    required this.label,
  });

  final double wSize;
  final double hSize;
  final Function onpressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onpressed(),
      child: Container(
        alignment: Alignment.center,
        width: wSize * 0.5,
        height: hSize * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/loginbtn.png'))),
        child: TextButton(
          onPressed: () {},
          child:  Text(
            label,
            style:const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
