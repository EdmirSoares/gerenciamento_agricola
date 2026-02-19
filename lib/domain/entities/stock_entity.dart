class StockEntity {
  final int? id;
  final int productId;
  final int quantity;
  final int? minimumStock;
  final String? location;
  final String? lotNumber;
  final DateTime? expirationDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  StockEntity({
    this.id,
    required this.productId,
    required this.quantity,
    this.minimumStock,
    this.location,
    this.lotNumber,
    this.expirationDate,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  bool get isLowStock => minimumStock != null && quantity <= minimumStock!;

  factory StockEntity.create({
    required int productId,
    required int quantity,
    int? minimumStock,
    String? location,
    String? lotNumber,
    DateTime? expirationDate,
  }) {
    final now = DateTime.now();
    final entity = StockEntity(
      productId: productId,
      quantity: quantity,
      minimumStock: minimumStock,
      location: location,
      lotNumber: lotNumber,
      expirationDate: expirationDate,
      createdAt: now,
      updatedAt: now,
      isDeleted: false,
    );

    if (entity.isLowStock) {
      throw ArgumentError('Estoque baixo para o produto ID: $productId');
    }

    if (productId <= 0) {
      throw ArgumentError('ID do produto deve ser maior que zero');
    }

    if (quantity < 0) {
      throw ArgumentError('Quantidade não pode ser negativa');
    }

    if(expirationDate != null && expirationDate.isBefore(now)) {
      throw ArgumentError('Data de validade não pode ser no passado');
    }

    return entity;
  }

  StockEntity copyWith({
    int? id,
    int? productId,
    int? quantity,
    int? minimumStock,
    String? location,
    String? lotNumber,
    DateTime? expirationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final entity = StockEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      minimumStock: minimumStock ?? this.minimumStock,
      location: location ?? this.location,
      lotNumber: lotNumber ?? this.lotNumber,
      expirationDate: expirationDate ?? this.expirationDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );

    if (entity.isLowStock) {
      throw ArgumentError(
        'Estoque baixo para o produto ID: ${entity.productId}',
      );
    }

    return entity;
  }
}
