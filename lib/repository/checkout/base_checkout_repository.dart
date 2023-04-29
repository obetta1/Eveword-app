import 'package:ecomerce/models/checkout_model.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(CheckoutModel checkout);
}
