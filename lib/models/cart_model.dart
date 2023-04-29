import 'package:equatable/equatable.dart';

import 'models.dart';

class CartModel extends Equatable {
  const CartModel({this.products = const <ProductModel>[]});

  final List<ProductModel> products;
//this is used to count the qauntity of the same product on the cart
  Map productQauntity(products) {
    var qauntity = Map();

    products.forEach((products) {
      if (!qauntity.containsKey(products)) {
        qauntity[products] = 1;
      } else {
        qauntity[products] += 1;
      }
    });

    return qauntity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalString => subtotal.toString();

  double deliveryFee(subtotal) {
    if (subtotal >= 30.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30) {
      return 'You have afree delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$$missing to get FREE delivery';
    }
  }

  String get freeDeliver => freeDelivery(subtotal);
  double get deliverFee => deliveryFee(subtotal);
  double get total => deliveryFee(subtotal) + subtotal;

  @override
  List<Object?> get props => [products];
}
