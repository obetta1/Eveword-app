import 'package:ecomerce/models/models.dart';
import 'package:equatable/equatable.dart';

class WishlistModel extends Equatable {
  final List<ProductModel> products;

  const WishlistModel({this.products = const <ProductModel>[]});

  Map wishlistProducts(products) {
    var qauntity = Map();

    products.forEach((products) {
      //if (!qauntity.containsKey(products)) {
      qauntity[products] = 1;
      // } else {
      //   qauntity[products] += 1;
      // }
    });

    return qauntity;
  }

  @override
  List<Object?> get props => [products];
}
