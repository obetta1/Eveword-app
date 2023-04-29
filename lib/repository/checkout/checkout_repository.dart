import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerce/models/checkout_model.dart';
import 'package:ecomerce/repository/checkout/base_checkout_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(CheckoutModel checkout) {
    return _firebaseFirestore
        .collection('checkouts')
        .add(checkout.toDocument());
  }
}
