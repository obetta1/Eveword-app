import 'package:ecomerce/admin_pannel/model/products.dart';
import 'package:ecomerce/admin_pannel/services/database_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final List<Products> products = Products.products.obs;
  final DatabaseService database = DatabaseService();

  var newProduct = {}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get isRecommended => newProduct['isRecommended'];
  get isPopular => newProduct['isPopular'];

  void updateProductPrice(int index, Products product, double value) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQauntity(int index, Products product, int value) {
    product.quantity = value;
    products[index] = product;
  }

  void saveNewProdutPrice(Products products, String field, double value) {
    database.updatefield(products, field, value);
  }
}
