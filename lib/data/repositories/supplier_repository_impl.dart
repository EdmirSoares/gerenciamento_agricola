import 'package:drift/drift.dart';
import 'package:gerenciamento_agricola/data/database/app_database.dart';
import 'package:gerenciamento_agricola/domain/entities/supplier_entity.dart';
import 'package:gerenciamento_agricola/domain/repositories/supplier_repository.dart';

class SupplierRepositoryImpl implements ISupplierRepository {
  final AppDatabase _db;

  SupplierRepositoryImpl(this._db);

  @override
  Future<void> saveSupplier(SupplierEntity supplier) async {
    final companion = FarmSupplyersCompanion(
      name: Value(supplier.name),
      contactInfo: Value(supplier.contactInfo),
      createdAt: Value(supplier.createdAt),
      updatedAt: Value(supplier.updatedAt),
      isDeleted: Value(supplier.isDeleted),
    );

    await _db.into(_db.farmSupplyers).insert(companion);
  }

  @override
  Future<List<SupplierEntity>> getAllSuppliers() async {
    final query = _db.select(_db.farmSupplyers)
      ..where((tbl) => tbl.isDeleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]);

    final results = await query.get();
    return results.map((row) => _mapToEntity(row)).toList();
  }

  @override
  Future<SupplierEntity?> getSupplierById(int id) async {
    final query = _db.select(_db.farmSupplyers)
      ..where((tbl) => tbl.id.equals(id) & tbl.isDeleted.equals(false));

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    return _mapToEntity(result);
  }

  @override
  Future<void> updateSupplier(SupplierEntity supplier) async {
    if (supplier.id == null) {
      throw Exception('Não é possível atualizar fornecedor sem ID');
    }

    final companion = FarmSupplyersCompanion(
      id: Value(supplier.id!),
      name: Value(supplier.name),
      contactInfo: Value(supplier.contactInfo),
      updatedAt: Value(DateTime.now()),
    );

    await _db.update(_db.farmSupplyers).replace(companion);
  }

  @override
  Future<void> deleteSupplier(int id) async {
    await (_db.update(
      _db.farmSupplyers,
    )..where((tbl) => tbl.id.equals(id))).write(
      const FarmSupplyersCompanion(
        isDeleted: Value(true),
        updatedAt: Value.absent(),
      ),
    );
  }

  @override
  Future<List<SupplierEntity>> searchSuppliersByName(String query) async {
    final results =
        await (_db.select(_db.farmSupplyers)
              ..where(
                (tbl) =>
                    tbl.name.like('%$query%') & tbl.isDeleted.equals(false),
              )
              ..orderBy([(tbl) => OrderingTerm.asc(tbl.name)]))
            .get();

    return results.map((row) => _mapToEntity(row)).toList();
  }

  SupplierEntity _mapToEntity(FarmSupplyer row) {
    return SupplierEntity(
      id: row.id,
      name: row.name,
      contactInfo: row.contactInfo,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
    );
  }
}
