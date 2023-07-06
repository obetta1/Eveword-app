import 'package:flutter/material.dart';

import '../admin_pannel/controller/product_controller.dart';

class BuidCheckBox extends StatelessWidget {
  final String title;
  final String name;
  final ProductController productController;
  final bool? controllerValue;

  const BuidCheckBox({
    super.key,
    required this.title,
    required this.name,
    required this.productController,
    this.controllerValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          onChanged: (value) {
            productController.newProduct
                .update(name, (_) => value, ifAbsent: () => value);
          },
          activeColor: Colors.green,
          checkColor: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
