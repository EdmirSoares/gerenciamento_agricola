import 'package:gerenciamento_agricola/domain/entities/products_entity.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductsEntity> products;
  ProductsLoaded(this.products);
}

class ProductOperationError extends ProductsState {
  final String message;
  final String? details;
  final ErrorType type;

  ProductOperationError(
    this.message, {
    this.details,
    this.type = ErrorType.generic,
  });
}

enum ErrorType { validation, notFound, network, permission, generic }
