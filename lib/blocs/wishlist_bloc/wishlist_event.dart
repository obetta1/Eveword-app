part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class WishlistStarted extends WishlistEvent {}

class AddToWishlist extends WishlistEvent {
  final ProductModel wishlist;

  const AddToWishlist(this.wishlist);

  @override
  List<Object> get props => [wishlist];
}

class RemoveFreomWishlist extends WishlistEvent {
  final ProductModel wishlist;

  const RemoveFreomWishlist(this.wishlist);

  @override
  List<Object> get props => [wishlist];
}
