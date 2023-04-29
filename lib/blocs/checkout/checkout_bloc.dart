import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomerce/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecomerce/models/checkout_model.dart';
import 'package:ecomerce/repository/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc(
      {required CartBloc cartBloc,
      required CheckoutRepository checkoutRepository})
      : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        //checck if the carbloc is loaded and add it to the checkout stete
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliverFee:
                    (cartBloc.state as CartLoaded).cart.deliverFee.toString(),
                total: (cartBloc.state as CartLoaded).cart.total.toString())
            : CheckoutLoading()) {
    //we listen to the cartbloc to make sure  everything is uptodateded
    _cartSubscription = cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateChackout(cart: state.cart));
      }
    });
    on<UpdateChackout>(mapUpdateChakoutTostate);
    on<ComfiremCheckout>(mapComfiremChecckoutToState);
  }

  FutureOr<void> mapUpdateChakoutTostate(
      UpdateChackout event, Emitter<CheckoutState> emit) async {
    print('mapUpdateChakoutTostate');
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          deliverFee: event.cart?.deliverFee ?? state.deliverFee,
          subtotal: event.cart?.subtotal ?? state.subtotal,
          total: event.cart?.total ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipecode: event.zipecode ?? state.zipecode));
    }
  }

  FutureOr<void> mapComfiremChecckoutToState(
      ComfiremCheckout event, Emitter<CheckoutState> emit) async {
    _cartSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        print('done');
        emit(CheckoutLoading());
      } catch (e) {
        print('$e');
      }
    }
  }
}
