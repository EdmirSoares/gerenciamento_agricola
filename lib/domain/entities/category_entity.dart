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

  factory CategoryEntity.create({required String name}) {
    final now = DateTime.now();
    return CategoryEntity(
      name: name,
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
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}

