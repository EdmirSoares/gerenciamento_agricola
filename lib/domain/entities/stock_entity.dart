class StockEntity {
  final int? id;
  final int productId;
  final double quantity;
  final double? minimumStock;
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
    required double quantity,
    double? minimumStock,
    String? location,
    String? lotNumber,
    DateTime? expirationDate,
  }) {
    if (productId <= 0) {
      throw ArgumentError('ID do produto deve ser maior que zero');
    }

    if (quantity < 0) {
      throw ArgumentError('Quantidade não pode ser negativa');
    }

    final now = DateTime.now();

    if (expirationDate != null && expirationDate.isBefore(now)) {
      throw ArgumentError('Data de validade não pode ser no passado');
    }

    return StockEntity(
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
  }

  StockEntity copyWith({
    int? id,
    int? productId,
    double? quantity,
    double? minimumStock,
    String? location,
    String? lotNumber,
    DateTime? expirationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    return StockEntity(
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
  }
}
