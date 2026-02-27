import '../../domain/entities/production_entity.dart';
import '../widgets/error_display_widget.dart';

abstract class ProductionState {}

class ProductionInitial extends ProductionState {}

class ProductionLoading extends ProductionState {}

class ProductionSuccess extends ProductionState {
  final String message;

  ProductionSuccess(this.message);
}

class ProductionsLoaded extends ProductionState {
  final List<ProductionEntity> productions;

  ProductionsLoaded(this.productions);
}

class ProductionError extends ProductionState implements AppError {
  @override
  final String message;
  @override
  final String? details;
  @override
  final ErrorType type;

  ProductionError({
    required this.message,
    this.details,
    this.type = ErrorType.generic,
  });
}
