import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecomerce/repository/category/category_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategoryEvent>(_loadCategory);
    on<UpdateCategoryEvent>(_updateCategory);
  }

//this loadcategory gets some data and triger the update category event
  FutureOr<void> _loadCategory(
      LoadCategoryEvent event, Emitter<CategoryState> emit) async {
    _categorySubscription?.cancel();

    // this is used to add the UpdateCategory event to the bloc
    _categorySubscription = _categoryRepository
        .getAllCategory()
        .listen((categories) => add(UpdateCategoryEvent(categories)));
  }

  FutureOr<void> _updateCategory(
      UpdateCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoaded(categories: event.categories));
  }
}
