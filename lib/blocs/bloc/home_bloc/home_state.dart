part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccess extends HomeState {
  final List<ProductModel> products;

  const HomeLoadedSuccess(this.products);
}

class AddToWishListPageState extends HomeState {
  final List<ProductModel> wishlists;

  const AddToWishListPageState(this.wishlists);
}

class HomeErrorState extends HomeState {}

class HomeToWishlistPageActionState extends HomeActionState {}

class HomeToCartPageActionState extends HomeActionState {}
