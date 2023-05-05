import 'package:ecomerce/models/models.dart';
import 'package:equatable/equatable.dart';

class CheckoutModel extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? counntry;
  final String? zipecode;
  final String? subtotal;
  final String? deliveryFee;
  final int total;
  final List<ProductModel>? products;

  const CheckoutModel(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.city,
      required this.counntry,
      required this.zipecode,
      required this.subtotal,
      required this.deliveryFee,
      required this.total,
      required this.products});

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        counntry,
        zipecode,
        subtotal,
        deliveryFee,
        total,
        products
      ];

  Map<String, Object> toDocument() {
    Map customerAdress = {};

    customerAdress['address'] = address;
    customerAdress['city'] = city;
    customerAdress['country'] = counntry;
    customerAdress['zipcode'] = zipecode;

    return {
      'customerAdress': customerAdress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total.toString()
    };
  }
}
