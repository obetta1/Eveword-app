part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];

  get checkout => null;

  get email => null;

  get fullName => null;

  get products => null;

  get deliverFee => null;

  get subtotal => null;

  get total => null;

  get address => null;

  get city => null;

  get country => null;

  get zipecode => null;
}

class CheckoutLoading extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutLoaded extends CheckoutState {
  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? country;
  @override
  final String? zipecode;
  @override
  final String? subtotal;
  @override
  final String? deliverFee;
  @override
  final String? total;
  @override
  final List<ProductModel>? products;
  @override
  final CheckoutModel checkout;

  CheckoutLoaded({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipecode,
    this.subtotal,
    this.deliverFee,
    this.total,
    this.products,
  }) : checkout = CheckoutModel(
            fullName: fullName,
            email: email,
            address: address,
            city: city,
            counntry: country,
            zipecode: zipecode,
            subtotal: subtotal,
            deliveryFee: deliverFee,
            total: total,
            products: products);

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipecode,
        subtotal,
        deliverFee,
        total,
        products
      ];
}
