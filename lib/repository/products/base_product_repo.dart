import 'package:ecomerce/models/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<ProductModel>> getAllProduct();
}
