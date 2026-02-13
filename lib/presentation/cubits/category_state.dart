import 'package:gerenciamento_agricola/domain/entities/category_entity.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  CategoriesLoaded(this.categories);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}