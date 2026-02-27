class PurchaseItemEntity {
  final int? id;
  final int purchaseId;
  final int productId;
  final double quantity;
  final int unitCostInCents;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  PurchaseItemEntity({
    this.id,
    required this.purchaseId,
    required this.productId,
    required this.quantity,
    required this.unitCostInCents,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  factory PurchaseItemEntity.create({
    required int purchaseId,
    required int productId,
    required double quantity,
    required int unitCostInCents,
    String? uuid,
  }) {
    if (purchaseId <= 0) {
      throw ArgumentError('Compra inválida ou não encontrada');
    }
    if (productId <= 0) {
      throw ArgumentError('Produto inválido ou não encontrado');
    }
    if (quantity <= 0) {
      throw ArgumentError('Quantidade deve ser maior que zero');
    }
    if (unitCostInCents < 0) {
      throw ArgumentError('Custo unitário não pode ser negativo');
    }

    final now = DateTime.now();
    return PurchaseItemEntity(
      purchaseId: purchaseId,
      productId: productId,
      quantity: quantity,
      unitCostInCents: unitCostInCents,
      uuid: uuid ?? '',
      createdAt: now,
      updatedAt: now,
      isDeleted: false,
    );
  }

  PurchaseItemEntity copyWith({
    int? id,
    int? purchaseId,
    int? productId,
    double? quantity,
    int? unitCostInCents,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final newPurchaseId = purchaseId ?? this.purchaseId;
    final newProductId = productId ?? this.productId;
    final newQuantity = quantity ?? this.quantity;
    final newUnitCostInCents = unitCostInCents ?? this.unitCostInCents;

    if (newPurchaseId <= 0) {
      throw ArgumentError('Compra inválida ou não encontrada');
    }
    if (newProductId <= 0) {
      throw ArgumentError('Produto inválido ou não encontrado');
    }
    if (newQuantity <= 0) {
      throw ArgumentError('Quantidade deve ser maior que zero');
    }
    if (newUnitCostInCents < 0) {
      throw ArgumentError('Custo unitário não pode ser negativo');
    }

    return PurchaseItemEntity(
      id: id ?? this.id,
      purchaseId: newPurchaseId,
      productId: newProductId,
      quantity: newQuantity,
      unitCostInCents: newUnitCostInCents,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: DateTime.now(),
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  bool get isValid {
    return purchaseId > 0 &&
        productId > 0 &&
        quantity > 0 &&
        unitCostInCents >= 0;
  }

  int get totalCostInCents {
    return (quantity * unitCostInCents).round();
  }

  double get totalCostInReais {
    return totalCostInCents / 100;
  }

  double get unitCostInReais {
    return unitCostInCents / 100;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PurchaseItemEntity &&
        other.id == id &&
        other.purchaseId == purchaseId &&
        other.productId == productId &&
        other.quantity == quantity &&
        other.unitCostInCents == unitCostInCents &&
        other.uuid == uuid &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      purchaseId,
      productId,
      quantity,
      unitCostInCents,
      uuid,
      isDeleted,
    );
  }

  @override
  String toString() {
    return 'PurchaseItemEntity(id: $id, compraId: $purchaseId, produtoId: $productId, '
        'quantidade: $quantity, custoUnitario: R\$ ${unitCostInReais.toStringAsFixed(2)}, '
        'total: R\$ ${totalCostInReais.toStringAsFixed(2)})';
  }
}
