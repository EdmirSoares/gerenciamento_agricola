class PurchaseEntity {
  final int? id;
  final int supplierId;
  final DateTime purchaseDate;
  final int totalValueInCents;
  final DateTime? dueDate;
  final bool isPaid;
  final DateTime? paymentDate;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  const PurchaseEntity({
    this.id,
    required this.supplierId,
    required this.purchaseDate,
    required this.totalValueInCents,
    this.dueDate,
    this.isPaid = false,
    this.paymentDate,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  factory PurchaseEntity.create({
    required int supplierId,
    required DateTime purchaseDate,
    required int totalValueInCents,
    DateTime? dueDate,
    bool isPaid = false,
    DateTime? paymentDate,
    String? description,
  }) {
    if (supplierId <= 0) {
      throw ArgumentError('ID do fornecedor deve ser maior que zero');
    }

    if (totalValueInCents < 0) {
      throw ArgumentError('Valor total não pode ser negativo');
    }

    final now = DateTime.now();
    if (purchaseDate.isAfter(now)) {
      throw ArgumentError('Data da compra não pode ser no futuro');
    }

    if (isPaid && paymentDate == null) {
      throw ArgumentError('Compra paga deve ter data de pagamento');
    }

    if (paymentDate != null && paymentDate.isBefore(purchaseDate)) {
      throw ArgumentError('Data de pagamento não pode ser anterior à data da compra');
    }

    final trimmedDescription = description?.trim();

    final currentTime = DateTime.now();
    return PurchaseEntity(
      supplierId: supplierId,
      purchaseDate: purchaseDate,
      totalValueInCents: totalValueInCents,
      dueDate: dueDate,
      isPaid: isPaid,
      paymentDate: paymentDate,
      description: trimmedDescription?.isEmpty == true ? null : trimmedDescription,
      createdAt: currentTime,
      updatedAt: currentTime,
      isDeleted: false,
    );
  }

  PurchaseEntity copyWith({
    int? id,
    int? supplierId,
    DateTime? purchaseDate,
    int? totalValueInCents,
    DateTime? dueDate,
    bool? isPaid,
    DateTime? paymentDate,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final newSupplierId = supplierId ?? this.supplierId;
    final newTotalValue = totalValueInCents ?? this.totalValueInCents;
    final newPurchaseDate = purchaseDate ?? this.purchaseDate;
    final newIsPaid = isPaid ?? this.isPaid;
    final newPaymentDate = paymentDate ?? this.paymentDate;

    if (newSupplierId <= 0) {
      throw ArgumentError('ID do fornecedor deve ser maior que zero');
    }

    if (newTotalValue < 0) {
      throw ArgumentError('Valor total não pode ser negativo');
    }

    if (newIsPaid && newPaymentDate == null) {
      throw ArgumentError('Compra paga deve ter data de pagamento');
    }

    if (newPaymentDate != null && newPaymentDate.isBefore(newPurchaseDate)) {
      throw ArgumentError('Data de pagamento não pode ser anterior à data da compra');
    }

    String? newDescription;
    if (description != null) {
      final trimmed = description.trim();
      newDescription = trimmed.isEmpty ? null : trimmed;
    } else {
      newDescription = this.description;
    }

    return PurchaseEntity(
      id: id ?? this.id,
      supplierId: newSupplierId,
      purchaseDate: newPurchaseDate,
      totalValueInCents: newTotalValue,
      dueDate: dueDate ?? this.dueDate,
      isPaid: newIsPaid,
      paymentDate: newPaymentDate,
      description: newDescription,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  bool get isValid => supplierId > 0 && totalValueInCents >= 0;

  bool get isOverdue {
    if (isPaid || dueDate == null) return false;
    return dueDate!.isBefore(DateTime.now());
  }

  bool get isPending => !isPaid;

  double get totalValueInReais => totalValueInCents / 100.0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurchaseEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          supplierId == other.supplierId &&
          purchaseDate == other.purchaseDate &&
          totalValueInCents == other.totalValueInCents &&
          dueDate == other.dueDate &&
          isPaid == other.isPaid &&
          paymentDate == other.paymentDate &&
          description == other.description;

  @override
  int get hashCode =>
      id.hashCode ^
      supplierId.hashCode ^
      purchaseDate.hashCode ^
      totalValueInCents.hashCode ^
      dueDate.hashCode ^
      isPaid.hashCode ^
      paymentDate.hashCode ^
      description.hashCode;

  @override
  String toString() => 'PurchaseEntity(id: $id, fornecedorId: $supplierId, '
      'dataDaCompra: $purchaseDate, valorTotal: R\$ ${totalValueInReais.toStringAsFixed(2)}, '
      'paga: $isPaid, vencida: $isOverdue)';
}
