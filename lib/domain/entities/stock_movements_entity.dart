import 'package:gerenciamento_agricola/data/database/tables.dart';

/// Tipos de movimentação de estoque:
/// - [StockMovementType.inEntry]: Entrada de estoque
/// - [StockMovementType.outEntry]: Saída de estoque
/// - [StockMovementType.loss]: Perda
/// - [StockMovementType.adjustment]: Ajuste manual
/// 
class StockMovementEntity {
  final int? id;
  final int productId;
  final StockMovementType type;
  final double quantity;
  final int? unitCostInCents;
  final String? referenceType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  StockMovementEntity({
    this.id,
    required this.productId,
    required this.type,
    required this.quantity,
    this.unitCostInCents,
    this.referenceType,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  factory StockMovementEntity.create({
    required int productId,
    required StockMovementType type,
    required double quantity,
    int? unitCostInCents,
    String? referenceType,
  }) {
    if (productId <= 0) {
      throw ArgumentError('ID do produto deve ser maior que zero');
    }

    if (quantity <= 0) {
      throw ArgumentError('Quantidade deve ser maior que zero');
    }

    if (unitCostInCents != null && unitCostInCents < 0) {
      throw ArgumentError('Custo unitário não pode ser negativo');
    }

    final now = DateTime.now();

    return StockMovementEntity(
      productId: productId,
      type: type,
      quantity: quantity,
      unitCostInCents: unitCostInCents,
      referenceType: referenceType,
      createdAt: now,
      updatedAt: now,
      isDeleted: false,
    );
  }

  StockMovementEntity copyWith({
    int? id,
    int? productId,
    StockMovementType? type,
    double? quantity,
    int? unitCostInCents,
    String? referenceType,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final newQuantity = quantity ?? this.quantity;
    final newUnitCost = unitCostInCents ?? this.unitCostInCents;

    if (newQuantity <= 0) {
      throw ArgumentError('Quantidade deve ser maior que zero');
    }

    if (newUnitCost != null && newUnitCost < 0) {
      throw ArgumentError('Custo unitário não pode ser negativo');
    }

    return StockMovementEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      type: type ?? this.type,
      quantity: newQuantity,
      unitCostInCents: newUnitCost,
      referenceType: referenceType ?? this.referenceType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
