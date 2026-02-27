import '../../domain/entities/purchase_item_entity.dart';
import '../widgets/error_display_widget.dart';

abstract class PurchaseItemState {}

class PurchaseItemInitial extends PurchaseItemState {}

class PurchaseItemLoading extends PurchaseItemState {}

class PurchaseItemSuccess extends PurchaseItemState {
  final String message;

  PurchaseItemSuccess(this.message);
}

class PurchaseItemsLoaded extends PurchaseItemState {
  final List<PurchaseItemEntity> items;

  PurchaseItemsLoaded(this.items);
}

class PurchaseItemError extends PurchaseItemState implements AppError {
  @override
  final String message;
  @override
  final String? details;
  @override
  final ErrorType type;

  PurchaseItemError({
    required this.message,
    this.details,
    this.type = ErrorType.generic,
  });
}
