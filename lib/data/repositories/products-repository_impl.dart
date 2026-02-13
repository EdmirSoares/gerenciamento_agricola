import 'package:drift/drift.dart';
import 'package:gerenciamento_agricola/data/database/app_database.dart';
import 'package:gerenciamento_agricola/domain/entities/products_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements IProductRepository {
  final AppDatabase _db;

  ProductsRepositoryImpl(this._db);

  @override
  Future<void> saveProduct(ProductsEntity product) async {
    final companion = FarmProductsCompanion(
      name: Value<String>(product.name),
      categoryId: Value<int>(product.categoryId),
      createdAt: Value<DateTime>(product.createdAt),
      updatedAt: Value<DateTime>(product.updatedAt),
      isDeleted: Value<bool>(product.isDeleted),
    );

    await _db.into(_db.farmProducts).insert(companion);
  }

  @override
  Future<List<ProductsEntity>> getAllProducts() async {
    final results = await _db.select(_db.farmProducts).get();
    return results
        .map(
          (row) => ProductsEntity(
            id: row.id,
            name: row.name,
            categoryId: row.categoryId,
            unit: row.unit,
            description: row.description ?? '',
            isProduction: row.isProduction,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
            isDeleted: row.isDeleted,
          ),
        )
        .toList();
  }

  @override
  Future<ProductsEntity?> getProductById(int id) async {
    final query = _db.select(_db.farmProducts)
      ..where((tbl) => tbl.id.equals(id));
    final result = await query.getSingleOrNull();
    if (result == null) return null;

    return ProductsEntity(
      id: result.id,
      name: result.name,
      categoryId: result.categoryId,
      unit: result.unit,
      description: result.description ?? '',
      isProduction: result.isProduction,
      createdAt: result.createdAt,
      updatedAt: result.updatedAt,
      isDeleted: result.isDeleted,
    );
  }

  @override
  Future<void> updateProduct(ProductsEntity product) async {
    if (product.id == null) {
      throw Exception('Não é possível atualizar produto sem ID');
    }

    final companion = FarmProductsCompanion(
      id: Value<int>(product.id!),
      name: Value<String>(product.name),
      categoryId: Value<int>(product.categoryId),
      unit: Value<String>(product.unit),
      description: Value<String?>(product.description),
      isProduction: Value<bool>(product.isProduction),
      createdAt: Value<DateTime>(product.createdAt),
      updatedAt: Value<DateTime>(product.updatedAt),
      isDeleted: Value<bool>(product.isDeleted),
    );

    await _db.update(_db.farmProducts).replace(companion);
  }

  @override
  Future<void> deleteProduct(int id) async {
    await (_db.delete(
      _db.farmProducts,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<List<ProductsEntity>> getProductsByCategoryId(int categoryId) async {
    final query = _db.select(_db.farmProducts)
      ..where((tbl) => tbl.categoryId.equals(categoryId));
    final results = await query.get();
    return results
        .map(
          (row) => ProductsEntity(
            id: row.id,
            name: row.name,
            categoryId: row.categoryId,
            unit: row.unit,
            description: row.description ?? '',
            isProduction: row.isProduction,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
            isDeleted: row.isDeleted,
          ),
        )
        .toList();
  }

  @override
  Future<List<ProductsEntity>> searchProductsByName(String query) async {
    final results = await (_db.select(
      _db.farmProducts,
    )..where((tbl) => tbl.name.like('%$query%'))).get();
    return results
        .map(
          (row) => ProductsEntity(
            id: row.id,
            name: row.name,
            categoryId: row.categoryId,
            unit: row.unit,
            description: row.description ?? '',
            isProduction: row.isProduction,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
            isDeleted: row.isDeleted,
          ),
        )
        .toList();
  }

  @override
  Future<List<ProductsEntity>> getProductionProducts() async {
    final results = await (_db.select(
      _db.farmProducts,
    )..where((tbl) => tbl.isProduction.equals(true))).get();
    return results
        .map(
          (row) => ProductsEntity(
            name: row.name,
            categoryId: row.categoryId,
            description: row.description ?? '',
            unit: row.unit,
            isProduction: row.isProduction,
            createdAt: row.createdAt,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();
  }
}
