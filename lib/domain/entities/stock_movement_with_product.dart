import 'package:gerenciamento_agricola/data/database/tables.dart';

class StockMovementWithProduct {
  final int movementId;
  final int productId;
  final StockMovementType type;
  final double quantity;
  final int? unitCostInCents;
  final String? referenceType;
  final DateTime createdAt;
  final DateTime updatedAt;

  final String productName;
  final String productUnit;
  final int categoryId;
  final String? productDescription;
  final bool isProduction;

  StockMovementWithProduct({
    required this.movementId,
    required this.productId,
    required this.type,
    required this.quantity,
    this.unitCostInCents,
    this.referenceType,
    required this.createdAt,
    required this.updatedAt,
    required this.productName,
    required this.productUnit,
    required this.categoryId,
    this.productDescription,
    required this.isProduction,
  });

  double? get totalCostInReais {
    if (unitCostInCents == null) return null;
    return (quantity * unitCostInCents!) / 100;
  }

  String get typeDescription {
    switch (type) {
      case StockMovementType.inEntry:
        return 'Entrada';
      case StockMovementType.outEntry:
        return 'Saída';
      case StockMovementType.loss:
        return 'Perda';
      case StockMovementType.adjustment:
        return 'Ajuste';
    }
  }

  String get formattedQuantity => '$quantity $productUnit';
}
