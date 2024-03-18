part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
//so the
  get cart => null;
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  @override
  final CartModel cart;

  const CartLoaded({this.cart = const CartModel()});
  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
