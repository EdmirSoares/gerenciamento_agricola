import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Simulations,
    FarmCategories,
    FarmProducts,
    FarmStock,
    FarmStockMovements,
    FarmSupplyers,
    FarmPurchases,
    FarmPurchaseItems,
    FarmAreas,
    FarmProductions,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  Future<List<Simulation>> getUnsyncedSimulations() {
    return (select(simulations)..where((t) => t.isSynced.equals(false))).get();
  }

  Future<int> saveSimulation(SimulationsCompanion entry) {
    return into(simulations).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'agri_credit.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
