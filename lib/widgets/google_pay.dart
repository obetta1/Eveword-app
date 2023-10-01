// import 'dart:io';
//
// import 'package:ecomerce/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
//
// class GooglePay extends StatelessWidget {
//   const GooglePay({super.key, required this.total, required this.products});
//   final String total;
//   final List<ProductModel> products;
//
//   static const String defaultGooglePay = '''{
//   "provider": "google_pay",
//   "data": {
//     "environment": "TEST",
//     "apiVersion": 2,
//     "apiVersionMinor": 0,
//     "allowedPaymentMethods": [
//       {
//         "type": "CARD",
//         "tokenizationSpecification": {
//           "type": "PAYMENT_GATEWAY",
//           "parameters": {
//             "gateway": "example",
//             "gatewayMerchantId": "gatewayMerchantId"
//           }
//         },
//         "parameters": {
//           "allowedCardNetworks": ["VISA", "MASTERCARD"],
//           "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
//           "billingAddressRequired": true,
//           "billingAddressParameters": {
//             "format": "FULL",
//             "phoneNumberRequired": true
//           }
//         }
//       }
//     ],
//     "merchantInfo": {
//       "merchantId": "01234567890123456789",
//       "merchantName": "Example Merchant Name"
//     },
//     "transactionInfo": {
//       "countryCode": "US",
//       "currencyCode": "USD"
//     }
//   }
// }''';
//
//   static const String defaultApplePay = '''{
//   "provider": "apple_pay",
//   "data": {
//     "merchantIdentifier": "merchant.com.sams.fish",
//     "displayName": "Sam's Fish",
//     "merchantCapabilities": ["3DS", "debit", "credit"],
//     "supportedNetworks": ["amex", "visa", "discover", "masterCard"],
//     "countryCode": "US",
//     "currencyCode": "USD",
//     "requiredBillingContactFields": ["emailAddress", "name", "phoneNumber", "postalAddress"],
//     "requiredShippingContactFields": [],
//     "shippingMethods": [
//       {
//         "amount": "0.00",
//         "detail": "Available within an hour",
//         "identifier": "in_store_pickup",
//         "label": "In-Store Pickup"
//       },
//       {
//         "amount": "4.99",
//         "detail": "5-8 Business Days",
//         "identifier": "flat_rate_shipping_id_2",
//         "label": "UPS Ground"
//       },
//       {
//         "amount": "29.99",
//         "detail": "1-3 Business Days",
//         "identifier": "flat_rate_shipping_id_1",
//         "label": "FedEx Priority Mail"
//       }
//     ]
//   }
// }''';
//
//   @override
//   Widget build(BuildContext context) {
//     var paymentItems = products
//         .map((product) => PaymentItem(
//             label: product.name,
//             amount: product.price.toString(),
//             type: PaymentItemType.item,
//             status: PaymentItemStatus.final_price))
//         .toList();
//
//     paymentItems.add(PaymentItem(
//         label: 'Total',
//         amount: total,
//         type: PaymentItemType.total,
//         status: PaymentItemStatus.final_price));
//
//     void onGooglePayResult(Map<String, dynamic> result) {
//       debugPrint(result.toString());
//       print('googlle pay result');
//     }
//
//     // final Future<PaymentConfiguration> googlePayConfigFuture =
//     //     PaymentConfiguration.fromAsset(defaultGooglePay);
//     if (Platform.isAndroid) {
//       return GooglePayButton(
//         paymentConfiguration:
//             PaymentConfiguration.fromJsonString(defaultGooglePay),
//         paymentItems: paymentItems,
//         type: GooglePayButtonType.buy,
//         margin: const EdgeInsets.only(top: 15.0),
//         onPaymentResult: onGooglePayResult,
//         loadingIndicator: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     } else if (Platform.isIOS) {
//       return ApplePayButton(
//         paymentConfiguration:
//             PaymentConfiguration.fromJsonString(defaultApplePay),
//         paymentItems: paymentItems,
//         style: ApplePayButtonStyle.black,
//         type: ApplePayButtonType.buy,
//         margin: const EdgeInsets.only(top: 15.0),
//         onPaymentResult: onApplePayResult,
//         loadingIndicator: const Center(
//           child: CircularProgressIndicator(),
//         ),
//         width: MediaQuery.of(context).size.width - 50,
//         height: 50,
//       );
//     } else {
//       return Text(Platform.localeName);
//     }
//   }
//
//   void onApplePayResult(Map<String, dynamic> result) {
//     print('$result');
//   }
// }
