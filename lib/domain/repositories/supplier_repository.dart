import 'package:gerenciamento_agricola/domain/entities/supplier_entity.dart';

abstract class ISupplierRepository {
  Future<void> saveSupplier(SupplierEntity supplier);
  Future<List<SupplierEntity>> getAllSuppliers();
  Future<SupplierEntity?> getSupplierById(int id);
  Future<void> updateSupplier(SupplierEntity supplier);
  Future<void> deleteSupplier(int id);
  Future<List<SupplierEntity>> searchSuppliersByName(String query);
}
