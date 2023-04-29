part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];

  get wishlists => null;
}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccess extends HomeState {
  final ProductModel products;

  const HomeLoadedSuccess(this.products);
}

class AddToWishListPageState extends HomeState {
  @override
  final ProductModel wishlists;

  const AddToWishListPageState(this.wishlists);

  @override
  List<Object> get props => [wishlists];
}

class HomeToWishlistPageActionState extends HomeActionState {}

class HomeToCartPageActionState extends HomeActionState {}
