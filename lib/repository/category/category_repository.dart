import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/models/category_model.dart';
import 'package:ecomerce/repository/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategory() {
    return _firebaseFirestore.collection('category').snapshots().map((snap) {
      return snap.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}
