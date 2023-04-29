part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateChackout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipecode;
  final CartModel?
      cart; // cartModel is used because we already had delifee, subtotal, and total on the cart bloc is

  const UpdateChackout(
      {this.fullName,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipecode,
      this.cart});

  @override
  List<Object?> get props =>
      [fullName, email, address, city, country, zipecode, cart];
}

class ComfiremCheckout extends CheckoutEvent {
  final CheckoutModel checkout;

  const ComfiremCheckout({required this.checkout});

  @override
  List<Object> get props => [checkout];
}
