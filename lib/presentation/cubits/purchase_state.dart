import 'package:gerenciamento_agricola/domain/entities/purchase_entity.dart';
import 'package:gerenciamento_agricola/presentation/widgets/error_display_widget.dart';

abstract class PurchaseState {}

class PurchaseInitial extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseSuccess extends PurchaseState {
  final String message;

  PurchaseSuccess(this.message);
}

class PurchasesLoaded extends PurchaseState {
  final List<PurchaseEntity> purchases;

  PurchasesLoaded(this.purchases);
}

class PurchaseError extends PurchaseState implements AppError {
  @override
  final String message;
  @override
  final String? details;
  @override
  final ErrorType type;

  PurchaseError(this.message, {this.details, this.type = ErrorType.generic});
}
