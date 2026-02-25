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
      description: Value<String>(product.description),
      unit: Value<String>(product.unit),
      isProduction: Value<bool>(product.isProduction),
      createdAt: Value<DateTime>(product.createdAt),
      updatedAt: Value<DateTime>(product.updatedAt),
      isDeleted: Value<bool>(product.isDeleted),
    );

    await _db.into(_db.farmProducts).insert(companion);
  }

  @override
  Future<List<ProductsEntity>> getAllProducts() async {
    final query = _db.select(_db.farmProducts)
      ..where((tbl) => tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.updatedAt)]);

    final results = await query.get();
    return results.map((row) => _mapToEntity(row)).toList();
  }

  @override
  Future<ProductsEntity?> getProductById(int id) async {
    final query = _db.select(_db.farmProducts)
      ..where((tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false));
    final result = await query.getSingleOrNull();
    if (result == null) return null;

    return _mapToEntity(result);
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
    await (_db.update(
      _db.farmProducts,
    )..where((tbl) => tbl.id.equals(id))).write(
      const FarmProductsCompanion(
        isDeleted: Value(true),
        updatedAt: Value.absent(),
      ),
    );
  }

  @override
  Future<List<ProductsEntity>> getProductsByCategoryId(int categoryId) async {
    final query = _db.select(_db.farmProducts)
      ..where(
        (tbl) =>
            tbl.categoryId.equals(categoryId) & tbl.isDeleted.equals(false),
      )
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]);

    final results = await query.get();
    return results.map((row) => _mapToEntity(row)).toList();
  }

  @override
  Future<List<ProductsEntity>> searchProductsByName(String query) async {
    final results =
        await (_db.select(_db.farmProducts)
              ..where(
                (tbl) =>
                    tbl.name.like('%$query%') & tbl.isDeleted.equals(false),
              )
              ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]))
            .get();

    return results.map((row) => _mapToEntity(row)).toList();
  }

  @override
  Future<List<ProductsEntity>> getProductionProducts() async {
    final query = _db.select(_db.farmProducts)
      ..where(
        (tbl) => tbl.isProduction.equals(true) & tbl.isDeleted.equals(false),
      )
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]);

    final results = await query.get();
    return results.map((row) => _mapToEntity(row)).toList();
  }

  ProductsEntity _mapToEntity(FarmProduct row) {
    return ProductsEntity(
      id: row.id,
      name: row.name,
      categoryId: row.categoryId,
      unit: row.unit,
      description: row.description ?? '',
      isProduction: row.isProduction,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
    );
  }
}
