class ProductsEntity {
  final int? id;
  final String name;
  final int categoryId;
  final String description;
  final String unit;
  final bool isProduction;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;

  ProductsEntity({
    this.id,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.unit,
    required this.isProduction,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
  });

  bool get isValid =>
      name.trim().isNotEmpty && name.length >= 3 && categoryId > 0;

  factory ProductsEntity.create({
    required String name,
    required int categoryId,
    String description = '',
    required String unit,
    required bool isProduction,
  }) {
    final now = DateTime.now();

    final entity = ProductsEntity(
      name: name,
      categoryId: categoryId,
      description: description,
      unit: unit,
      isProduction: isProduction,
      createdAt: now,
      updatedAt: now,
    );

    if (!entity.isValid) {
      throw ArgumentError('Produto inválido: $name');
    }

    return entity;
  }

  ProductsEntity copyWith({
    int? id,
    String? name,
    int? categoryId,
    String? description,
    String? unit,
    bool? isProduction,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
  }) {
    final entity = ProductsEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      unit: unit ?? this.unit,
      isProduction: isProduction ?? this.isProduction,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );

    if (!entity.isValid) {
      throw ArgumentError('Produto inválido: ${entity.name}');
    }

    return entity;
  }
}
