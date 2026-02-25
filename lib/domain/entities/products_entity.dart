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

  bool get isInput => !isProduction;

  factory ProductsEntity.create({
    required String name,
    required int categoryId,
    String description = '',
    required String unit,
    required bool isProduction,
  }) {
    if (categoryId <= 0) {
      throw ArgumentError('ID da categoria deve ser maior que zero');
    }

    if (unit.trim().isEmpty) {
      throw ArgumentError('Unidade de medida não pode ser vazia');
    }

    final now = DateTime.now();

    final entity = ProductsEntity(
      name: name.trim(),
      categoryId: categoryId,
      description: description.trim(),
      unit: unit.trim(),
      isProduction: isProduction,
      createdAt: now,
      updatedAt: now,
    );

    if (!entity.isValid) {
      throw ArgumentError('Nome do produto deve ter pelo menos 3 caracteres');
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
    final newName = name ?? this.name;
    final newCategoryId = categoryId ?? this.categoryId;
    final newUnit = unit ?? this.unit;

    if (newName.trim().isEmpty || newName.trim().length < 3) {
      throw ArgumentError('Nome do produto deve ter pelo menos 3 caracteres');
    }

    if (newCategoryId <= 0) {
      throw ArgumentError('ID da categoria deve ser maior que zero');
    }

    if (newUnit.trim().isEmpty) {
      throw ArgumentError('Unidade de medida não pode ser vazia');
    }

    return ProductsEntity(
      id: id ?? this.id,
      name: newName.trim(),
      categoryId: newCategoryId,
      description: (description ?? this.description).trim(),
      unit: newUnit.trim(),
      isProduction: isProduction ?? this.isProduction,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
