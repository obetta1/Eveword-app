import 'dart:io';

import 'package:ecomerce/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

class PaymentPaystack {
  final String email;
  final int price;
  final BuildContext ctx;

  PaymentPaystack(
      {required this.email, required this.price, required this.ctx});
  PaystackPlugin paystack = PaystackPlugin();

  Future initializePlugin() async {
    await paystack.initialize(publicKey: PAY_KEY);
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard? _getCardUi() {
    return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
  }

  chargeCardandMakepayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price! * 100
        ..email = email
        ..reference = _getReference()
        ..currency = 'NGN'
        ..card = _getCardUi();

      CheckoutResponse response = await paystack.checkout(ctx,
          charge: charge,
          method: CheckoutMethod.card,
          fullscreen: false,
          logo: Image.asset(
            'assets/images/order-logo.jpg',
            width: 100,
            height: 100,
          ));

      if (response.status) {
        Navigator.pushReplacementNamed(ctx, '/comfirm_order');
        print('transaction successfull');
      } else {
        Navigator.pushReplacementNamed(ctx, '/comfirm_order');
        print('transaction failed try again later${response}');
      }
    });
  }
}
