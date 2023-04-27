
part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class AddToWishListPageEvent extends HomeEvent {
  final ProductModel products;

  const AddToWishListPageEvent({required this.products});
}

class RemoveItemFromWishListEvent extends HomeEvent {
  final ProductModel product;

  const RemoveItemFromWishListEvent({required this.product});
}

class HomeProdWishlistButtonClikedEvent extends HomeEvent {}

class HomeProdButtonCartlikedEvent extends HomeEvent {}

class HomeProdWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
