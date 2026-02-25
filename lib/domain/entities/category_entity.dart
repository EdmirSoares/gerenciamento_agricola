class CategoryEntity {
  final int? id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  CategoryEntity({
    this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  bool get isValid => name.trim().isNotEmpty && name.trim().length >= 3;

  factory CategoryEntity.create({required String name}) {
    if (name.trim().isEmpty || name.trim().length < 3) {
      throw ArgumentError('Nome da categoria deve ter pelo menos 3 caracteres');
    }

    final now = DateTime.now();
    return CategoryEntity(
      name: name.trim(),
      createdAt: now,
      updatedAt: now,
      isDeleted: false,
    );
  }

  CategoryEntity copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final newName = name ?? this.name;

    if (newName.trim().isEmpty || newName.trim().length < 3) {
      throw ArgumentError('Nome da categoria deve ter pelo menos 3 caracteres');
    }

    return CategoryEntity(
      id: id ?? this.id,
      name: newName.trim(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
