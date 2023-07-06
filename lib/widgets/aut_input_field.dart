import 'package:flutter/material.dart';

class AutImputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData?icon;
  //Function(String)? onChange;

  const AutImputField(
      {super.key,
      required this.controller,
      required this.label,
        this.icon,
      //required this.onChange
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(1, 1),
                blurRadius: 10,
                spreadRadius: 7)
          ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          icon: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(icon),
          ),
          iconColor: Colors.orange[700],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
