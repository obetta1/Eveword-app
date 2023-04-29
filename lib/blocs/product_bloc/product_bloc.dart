import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomerce/models/models.dart';
import 'package:ecomerce/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _streamSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = ProductRepository(),
        super(ProductLoading()) {
    on<LoadProductsEvent>(mapProductsTostate);
    on<UpdateProductsEvent>(mapPoductToState);
  }

  FutureOr<void> mapProductsTostate(
      LoadProductsEvent event, Emitter<ProductState> emit) {
    _streamSubscription?.cancel();
    _streamSubscription = _productRepository
        .getAllProduct()
        .listen((products) => add(UpdateProductsEvent(products)));
  }

  FutureOr<void> mapPoductToState(
      UpdateProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoaded(products: event.products));
  }
}
