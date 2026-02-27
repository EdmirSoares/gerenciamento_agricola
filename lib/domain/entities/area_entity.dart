class AreaEntity {
  final int? id;
  final String name;
  final double? sizeInHectares;
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  AreaEntity({
    this.id,
    required this.name,
    this.sizeInHectares,
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  factory AreaEntity.create({
    required String name,
    double? sizeInHectares,
    String? uuid,
  }) {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ArgumentError('Informe um nome para a área');
    }
    if (trimmedName.length > 100) {
      throw ArgumentError('O nome da área não deve exceder 100 caracteres');
    }
    if (sizeInHectares != null && sizeInHectares < 0) {
      throw ArgumentError('O tamanho da área não pode ser negativo');
    }

    final now = DateTime.now();
    return AreaEntity(
      name: trimmedName,
      sizeInHectares: sizeInHectares,
      uuid: uuid ?? '',
      createdAt: now,
      updatedAt: now,
      isDeleted: false,
    );
  }
  AreaEntity copyWith({
    int? id,
    String? name,
    double? sizeInHectares,
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final newName = name ?? this.name;
    final newSize = sizeInHectares ?? this.sizeInHectares;

    final trimmedName = newName.trim();
    if (trimmedName.isEmpty) {
      throw ArgumentError('Informe um nome para a área');
    }
    if (trimmedName.length > 100) {
      throw ArgumentError('O nome da área não deve exceder 100 caracteres');
    }
    if (newSize != null && newSize < 0) {
      throw ArgumentError('O tamanho da área não pode ser negativo');
    }

    return AreaEntity(
      id: id ?? this.id,
      name: trimmedName,
      sizeInHectares: newSize,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: DateTime.now(),
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  bool get isValid {
    final trimmedName = name.trim();
    return trimmedName.isNotEmpty &&
        trimmedName.length <= 100 &&
        (sizeInHectares == null || sizeInHectares! >= 0);
  }

  String get formattedSize {
    if (sizeInHectares == null) return 'Tamanho não informado';
    return '${sizeInHectares!.toStringAsFixed(2)} ha';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AreaEntity &&
        other.id == id &&
        other.name == name &&
        other.sizeInHectares == sizeInHectares &&
        other.uuid == uuid &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, sizeInHectares, uuid, isDeleted);
  }

  @override
  String toString() {
    return 'AreaEntity(id: $id, nome: $name, tamanho: $formattedSize)';
  }
}
