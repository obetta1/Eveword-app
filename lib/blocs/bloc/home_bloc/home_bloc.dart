import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomerce/models/wishlist_model.dart';
import 'package:equatable/equatable.dart';

import '../../../models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<AddToWishListPageEvent>(addToCartListPageEvent);

    on<RemoveItemFromWishListEvent>(removeItemFromWishListEvent);
    on<HomeProdWishlistButtonClikedEvent>(homeProdWishlistButtonClikedEvent);
    on<HomeProdButtonCartlikedEvent>(homeProdButtonCartlikedEvent);
    on<HomeProdWishlistButtonNavigateEvent>(homeWishlistNavigateEvent);
    on<HomeCartButtonNavigateEvent>(HomeCartNavigateEvent);
  }

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    //emit(HomeLoadedSuccess();
  }

  FutureOr<void> homeProdWishlistButtonClikedEvent(
      HomeProdWishlistButtonClikedEvent event, Emitter<HomeState> emit) {
    print('product wish list clicked');
  }

  FutureOr<void> homeProdButtonCartlikedEvent(
      HomeProdButtonCartlikedEvent event, Emitter<HomeState> emit) {
    print('cart list clicked');
  }

  FutureOr<void> homeWishlistNavigateEvent(
      HomeProdWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeToWishlistPageActionState());
  }

  FutureOr<void> HomeCartNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeToCartPageActionState());
  }

  FutureOr<void> addToCartListPageEvent(
      AddToWishListPageEvent event, Emitter<HomeState> emit) async {
    //wishlist.add(event.products);
    //emit(AddToWishListPageState(wishlists: ProductModel(List.from(state.))));
    print('item add to wishlis');
  }

  FutureOr<void> removeItemFromWishListEvent(
      RemoveItemFromWishListEvent event, Emitter<HomeState> emit) {
    wishlist.remove(event.product);
    //emit(HomeLoadedSuccess(wishlist));
    print('item remove to wishlis');
  }
}
