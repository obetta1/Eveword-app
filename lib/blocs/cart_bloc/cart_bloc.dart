import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(cartStartedEvent);

    on<CartProductAdded>(cartProductAdded);
    on<CartProductRemoved>(cartProductRemoved);
  }
  FutureOr<void> cartStartedEvent(
      CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (e) {
      print('erroe in bloc $e');
    }
  }

  //this is used to add cart to an event
  FutureOr<void> cartProductAdded(
      CartProductAdded event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: CartModel(
                products: List.from(state.cart.products)
                  ..add(event.products))));
      } catch (e) {
        print('error adding products');
      }
    }
  }

  FutureOr<void> cartProductRemoved(
      CartProductRemoved event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
            cart: CartModel(
                products: List.from(state.cart.products)
                  ..remove(event.products))));
      } catch (e) {
        print('error removing products');
      }
    }
  }
}
