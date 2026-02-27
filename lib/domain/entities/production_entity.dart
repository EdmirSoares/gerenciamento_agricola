class ProductionEntity {
  final int? id;
  final int productId;
  final int productionAreaId;
  final double quantity;
  final int unitPriceInCents;
  final int productionCostInCents;
  final DateTime harvestDate;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  ProductionEntity({
    this.id,
    required this.productId,
    required this.productionAreaId,
    required this.quantity,
    required this.unitPriceInCents,
    required this.productionCostInCents,
    required this.harvestDate,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  factory ProductionEntity.create({
    required int productId,
    required int productionAreaId,
    required double quantity,
    required int unitPriceInCents,
    required int productionCostInCents,
    required DateTime harvestDate,
    String? uuid,
  }) {
    if (productId <= 0) {
      throw ArgumentError('Código do produto incorreto ou não encontrado');
    }
    if (productionAreaId <= 0) {
      throw ArgumentError(
        'Código da área de produção incorreto ou não encontrado',
      );
    }
    if (quantity <= 0) {
      throw ArgumentError('Quantidade deve ser maior que 0');
    }
    if (unitPriceInCents < 0) {
      throw ArgumentError('Preço unitário deve ser não negativo');
    }
    if (productionCostInCents < 0) {
      throw ArgumentError('Custo de produção deve ser não negativo');
    }

    final now = DateTime.now();
    final harvestDateOnly = DateTime(
      harvestDate.year,
      harvestDate.month,
      harvestDate.day,
    );
    final todayOnly = DateTime(now.year, now.month, now.day);

    if (harvestDateOnly.isAfter(todayOnly)) {
      throw ArgumentError('Data da colheita não pode estar no futuro');
    }

    return ProductionEntity(
      productId: productId,
      productionAreaId: productionAreaId,
      quantity: quantity,
      unitPriceInCents: unitPriceInCents,
      productionCostInCents: productionCostInCents,
      harvestDate: harvestDate,
      uuid: uuid ?? '',
      createdAt: now,
      updatedAt: now,
      isDeleted: false,
    );
  }

  ProductionEntity copyWith({
    int? id,
    int? productId,
    int? productionAreaId,
    double? quantity,
    int? unitPriceInCents,
    int? productionCostInCents,
    DateTime? harvestDate,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final newProductId = productId ?? this.productId;
    final newProductionAreaId = productionAreaId ?? this.productionAreaId;
    final newQuantity = quantity ?? this.quantity;
    final newUnitPriceInCents = unitPriceInCents ?? this.unitPriceInCents;
    final newProductionCostInCents =
        productionCostInCents ?? this.productionCostInCents;
    final newHarvestDate = harvestDate ?? this.harvestDate;

    if (newProductId <= 0) {
      throw ArgumentError('Código do produto incorreto ou não encontrado');
    }
    if (newProductionAreaId <= 0) {
      throw ArgumentError(
        'Código da área de produção incorreto ou não encontrado',
      );
    }
    if (newQuantity <= 0) {
      throw ArgumentError('Quantidade deve ser maior que 0');
    }
    if (newUnitPriceInCents < 0) {
      throw ArgumentError('Preço unitário deve ser não negativo');
    }
    if (newProductionCostInCents < 0) {
      throw ArgumentError('Custo de produção deve ser não negativo');
    }

    final now = DateTime.now();
    final harvestDateOnly = DateTime(
      newHarvestDate.year,
      newHarvestDate.month,
      newHarvestDate.day,
    );
    final todayOnly = DateTime(now.year, now.month, now.day);

    if (harvestDateOnly.isAfter(todayOnly)) {
      throw ArgumentError('Data da colheita não pode estar no futuro');
    }

    return ProductionEntity(
      id: id ?? this.id,
      productId: newProductId,
      productionAreaId: newProductionAreaId,
      quantity: newQuantity,
      unitPriceInCents: newUnitPriceInCents,
      productionCostInCents: newProductionCostInCents,
      harvestDate: newHarvestDate,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: DateTime.now(),
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  bool get isValid {
    final now = DateTime.now();
    final harvestDateOnly = DateTime(
      harvestDate.year,
      harvestDate.month,
      harvestDate.day,
    );
    final todayOnly = DateTime(now.year, now.month, now.day);

    return productId > 0 &&
        productionAreaId > 0 &&
        quantity > 0 &&
        unitPriceInCents >= 0 &&
        productionCostInCents >= 0 &&
        !harvestDateOnly.isAfter(todayOnly);
  }

  int get totalRevenueInCents {
    return (quantity * unitPriceInCents).round();
  }

  double get totalRevenueInReais {
    return totalRevenueInCents / 100;
  }

  double get unitPriceInReais {
    return unitPriceInCents / 100;
  }

  double get productionCostInReais {
    return productionCostInCents / 100;
  }

  int get profitInCents {
    return totalRevenueInCents - productionCostInCents;
  }

  double get profitInReais {
    return profitInCents / 100;
  }

  double get profitMarginPercentage {
    if (totalRevenueInCents == 0) return 0;
    return (profitInCents / totalRevenueInCents) * 100;
  }

  bool get isProfitable {
    return profitInCents > 0;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductionEntity &&
        other.id == id &&
        other.productId == productId &&
        other.productionAreaId == productionAreaId &&
        other.quantity == quantity &&
        other.unitPriceInCents == unitPriceInCents &&
        other.productionCostInCents == productionCostInCents &&
        other.harvestDate == harvestDate &&
        other.uuid == uuid &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      productId,
      productionAreaId,
      quantity,
      unitPriceInCents,
      productionCostInCents,
      harvestDate,
      uuid,
      isDeleted,
    );
  }

  @override
  String toString() {
    return 'ProductionEntity(id: $id, productId: $productId, areaId: $productionAreaId, '
        'quantidade: $quantity, receita: R\$ ${totalRevenueInReais.toStringAsFixed(2)}, '
        'custo: R\$ ${productionCostInReais.toStringAsFixed(2)}, '
        'lucro: R\$ ${profitInReais.toStringAsFixed(2)}, data da colheita: $harvestDate)';
  }
}
