import 'package:gerenciamento_agricola/domain/entities/stock_entity.dart';
import '../widgets/error_display_widget.dart';

abstract class StockState {}

class StockInicial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<StockEntity> stocks;
  StockLoaded(this.stocks);
}

class StockError extends StockState implements AppError {
  @override
  final String message;
  @override
  final String? details;
  @override
  final ErrorType type;

  StockError(this.message, {this.details, this.type = ErrorType.generic});
}
