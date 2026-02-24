import 'package:gerenciamento_agricola/domain/entities/stock_entity.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_movement_with_product.dart';

abstract class StockMovementsState {}

class StockMovementsInicial extends StockMovementsState {}

class StockMovementsLoading extends StockMovementsState {}

class StockMovementsLoaded extends StockMovementsState {
  final List<StockEntity> stocks;
  StockMovementsLoaded(this.stocks);
}

class StockMovementWithProductLoaded extends StockMovementsState {
  final List<StockMovementWithProduct> stock;
  StockMovementWithProductLoaded(this.stock);
}

class StockMovementsError extends StockMovementsState {
  final String message;
  final String? details;
  final ErrorType type;
  
  StockMovementsError(
    this.message, {
    this.details,
    this.type = ErrorType.generic,
  });
}

enum ErrorType {
  validation,
  notFound,
  network,
  permission,
  generic,
}
