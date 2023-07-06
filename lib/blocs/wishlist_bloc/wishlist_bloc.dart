import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomerce/models/models.dart';
import 'package:ecomerce/repository/wishlist_repo/local_storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../models/wishlist_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepository _localStorageRepository;

  WishlistBloc({required LocalStorageRepository localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(WishlistLoadng()) {
    on<WishlistStarted>(mapStateToWishlist);
    on<AddToWishlist>(addEventToWishlist);
    on<RemoveFreomWishlist>(removeFreomWishlist);
  }

  FutureOr<void> mapStateToWishlist(
      WishlistStarted event, Emitter<WishlistState> emit) async {
    Box box = await _localStorageRepository.open();
    List<ProductModel> products = _localStorageRepository.getWishlist(box);
    emit(WishlistLoadng());
    await Future.delayed(const Duration(seconds: 1));
    emit(WishlistLoaded(wishlist: WishlistModel(products: products)));
  }

  FutureOr<void> addEventToWishlist(
      AddToWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        //adding wishlsit to tht local storage
        Box box = await _localStorageRepository.open();
        _localStorageRepository.addProductTowishlist(box, event.wishlist);

        emit(WishlistLoaded(
            wishlist: WishlistModel(
                products: List.from(state.wishlist.products)
                  ..add(event.wishlist))));
      } catch (e) {
        emit(WishlistError());
        debugPrint(' something went wrong >>>> $e');
      }
    }
  }

  FutureOr<void> removeFreomWishlist(
      RemoveFreomWishlist event, Emitter<WishlistState> emit) async {
    if (state is WishlistLoaded) {
      try {
        //remove the wishlist from the local storage
        Box box = await _localStorageRepository.open();
        _localStorageRepository.removeProductFromWishlist(box, event.wishlist);
        emit(WishlistLoaded(
            wishlist: WishlistModel(
                products: List.from(state.wishlist.products)
                  ..remove(event.wishlist))));
      } catch (e) {
        debugPrint('produt removed from wishlist');
      }
    }
  }
}
