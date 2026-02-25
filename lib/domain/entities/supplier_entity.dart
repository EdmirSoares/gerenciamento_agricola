class SupplierEntity {
  final int? id;
  final String name;
  final String? contactInfo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  SupplierEntity({
    this.id,
    required this.name,
    this.contactInfo,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  bool get isValid => name.trim().isNotEmpty && name.trim().length >= 3;

  bool get hasContactInfo =>
      contactInfo != null && contactInfo!.trim().isNotEmpty;

  factory SupplierEntity.create({required String name, String? contactInfo}) {
    if (name.trim().isEmpty || name.trim().length < 3) {
      throw ArgumentError(
        'Nome do fornecedor deve ter pelo menos 3 caracteres',
      );
    }

    final now = DateTime.now();

    return SupplierEntity(
      name: name.trim(),
      contactInfo: contactInfo?.trim().isEmpty == true
          ? null
          : contactInfo?.trim(),
      createdAt: now,
      updatedAt: now,
      isDeleted: false,
    );
  }

  SupplierEntity copyWith({
    int? id,
    String? name,
    String? contactInfo,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final newName = name ?? this.name;

    if (newName.trim().isEmpty || newName.trim().length < 3) {
      throw ArgumentError(
        'Nome do fornecedor deve ter pelo menos 3 caracteres',
      );
    }

    String? newContactInfo;
    if (contactInfo != null) {
      newContactInfo = contactInfo.trim().isEmpty ? null : contactInfo.trim();
    } else {
      newContactInfo = this.contactInfo;
    }

    return SupplierEntity(
      id: id ?? this.id,
      name: newName.trim(),
      contactInfo: newContactInfo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
