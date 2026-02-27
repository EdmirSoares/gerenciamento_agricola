import 'package:drift/drift.dart';
import '../../domain/entities/area_entity.dart';
import '../../domain/repositories/area_repository.dart';
import '../database/app_database.dart';

class AreaRepositoryImpl implements IAreaRepository {
  final AppDatabase _database;

  AreaRepositoryImpl(this._database);

  AreaEntity _mapToEntity(FarmArea row) {
    return AreaEntity(
      id: row.id,
      name: row.name,
      sizeInHectares: row.sizeInHectares,
      uuid: row.uuid,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isDeleted: row.isDeleted,
    );
  }

  @override
  Future<AreaEntity> saveArea(AreaEntity area) async {
    final id = await _database
        .into(_database.farmAreas)
        .insert(
          FarmAreasCompanion.insert(
            name: area.name,
            sizeInHectares: Value(area.sizeInHectares),
          ),
        );

    final savedArea = await getAreaById(id);
    return savedArea!;
  }

  @override
  Future<List<AreaEntity>> getAllAreas() async {
    final query = _database.select(_database.farmAreas)
      ..where((t) => t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.asc(t.name)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<AreaEntity?> getAreaById(int id) async {
    final query = _database.select(_database.farmAreas)
      ..where((t) => t.id.equals(id) & t.isDeleted.equals(false));

    final result = await query.getSingleOrNull();
    return result != null ? _mapToEntity(result) : null;
  }

  @override
  Future<List<AreaEntity>> searchAreasByName(String name) async {
    final query = _database.select(_database.farmAreas)
      ..where((t) => t.name.like('%$name%') & t.isDeleted.equals(false))
      ..orderBy([(t) => OrderingTerm.asc(t.name)]);

    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<AreaEntity> updateArea(AreaEntity area) async {
    await (_database.update(
      _database.farmAreas,
    )..where((t) => t.id.equals(area.id!))).write(
      FarmAreasCompanion(
        name: Value(area.name),
        sizeInHectares: Value(area.sizeInHectares),
        updatedAt: Value(DateTime.now()),
      ),
    );

    final updatedArea = await getAreaById(area.id!);
    return updatedArea!;
  }

  @override
  Future<void> deleteArea(int id) async {
    await (_database.update(
      _database.farmAreas,
    )..where((t) => t.id.equals(id))).write(
      FarmAreasCompanion(
        isDeleted: const Value(true),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
