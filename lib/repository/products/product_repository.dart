import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/models/product_model.dart';
import 'package:ecomerce/repository/products/base_product_repo.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<ProductModel>> getAllProduct() {
    return _firebaseFirestore.collection('products').snapshots().map((snap) {
      return snap.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    });
  }
}
