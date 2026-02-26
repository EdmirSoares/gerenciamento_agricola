import 'package:gerenciamento_agricola/domain/entities/products_entity.dart';
import '../widgets/error_display_widget.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductsEntity> products;
  ProductsLoaded(this.products);
}

class ProductOperationError extends ProductsState implements AppError {
  @override
  final String message;
  @override
  final String? details;
  @override
  final ErrorType type;

  ProductOperationError(
    this.message, {
    this.details,
    this.type = ErrorType.generic,
  });
}
