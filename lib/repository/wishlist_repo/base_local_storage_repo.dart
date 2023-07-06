import 'package:hive/hive.dart';

import '../../models/product_model.dart';

abstract class BaseLocalStorageRepository {
  Future<Box> open();
  List<ProductModel> getWishlist(Box box);
  Future<void> addProductTowishlist(Box box, ProductModel product);
  Future<void> removeProductFromWishlist(Box box, ProductModel product);
  Future<void> clearWishlist(Box box);
}
