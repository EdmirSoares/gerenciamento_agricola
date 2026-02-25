import 'package:gerenciamento_agricola/domain/entities/stock_entity.dart';

abstract class StockState {}

class StockInicial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<StockEntity> stocks;
  StockLoaded(this.stocks);
}

class StockError extends StockState {
  final String message;
  final String? details;
  final ErrorType type;
  
  StockError(
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
