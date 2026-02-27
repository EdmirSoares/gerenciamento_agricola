import '../entities/area_entity.dart';

abstract class IAreaRepository {
  Future<AreaEntity> saveArea(AreaEntity area);

  Future<List<AreaEntity>> getAllAreas();

  Future<AreaEntity?> getAreaById(int id);

  Future<List<AreaEntity>> searchAreasByName(String name);

  Future<AreaEntity> updateArea(AreaEntity area);

  Future<void> deleteArea(int id);
}
