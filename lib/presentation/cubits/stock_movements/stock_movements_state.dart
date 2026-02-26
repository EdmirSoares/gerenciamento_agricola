import 'package:gerenciamento_agricola/domain/entities/stock_entity.dart';
import 'package:gerenciamento_agricola/domain/entities/stock_movement_with_product.dart';
import 'package:gerenciamento_agricola/presentation/widgets/error_display_widget.dart';

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

class StockMovementsError extends StockMovementsState implements AppError {
  @override
  final String message;
  @override
  final String? details;
  @override
  final ErrorType type;

  StockMovementsError(
    this.message, {
    this.details,
    this.type = ErrorType.generic,
  });
}
