part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];

  get wishlist => null;
}

class WishlistLoadng extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistLoaded extends WishlistState {
  @override
  final WishlistModel wishlist;

  const WishlistLoaded({this.wishlist = const WishlistModel()});

  @override
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {
  @override
  List<Object> get props => [];
}
