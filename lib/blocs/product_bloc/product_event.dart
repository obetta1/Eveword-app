part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends ProductEvent {}

class UpdateProductsEvent extends ProductEvent {
  final List<ProductModel> products;

  const UpdateProductsEvent(this.products);

  @override
  List<Object> get props => [products];
}
