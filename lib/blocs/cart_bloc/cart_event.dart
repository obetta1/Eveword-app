part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  final ProductModel products;

  const CartProductAdded(this.products);

  @override
  List<Object> get props => [products];
}

class CartProductRemoved extends CartEvent {
  final ProductModel products;

  const CartProductRemoved(this.products);

  @override
  List<Object> get props => [products];
}
