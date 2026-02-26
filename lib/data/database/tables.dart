import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

const uuidGenerator = Uuid();

enum StockMovementType { inEntry, outEntry, loss, adjustment }

mixin BaseTable on Table {
  TextColumn get uuid => text().clientDefault(() => uuidGenerator.v4())();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class Simulations extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get producerName => text().withLength(min: 1, max: 100)();

  IntColumn get principalAmountInCents => integer()();
  IntColumn get interestRateBasisPoints => integer()(); // 5.25% = 525

  IntColumn get periods => integer()();
  IntColumn get totalAmountInCents => integer()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

class FarmCategories extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();

  List<Set<Column>> get indexes => [
    {name},
  ];
}

class FarmProducts extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();

  IntColumn get categoryId => integer().references(FarmCategories, #id)();

  TextColumn get description => text().nullable()();

  TextColumn get unit => text().withLength(min: 1, max: 50)();

  BoolColumn get isProduction => boolean()();

  List<Set<Column>> get indexes => [
    {categoryId},
    {name},
  ];
}

class FarmStock extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer().references(FarmProducts, #id)();

  RealColumn get quantity => real()();
  RealColumn get minimumStock => real().nullable()();

  TextColumn get location => text().nullable()();
  TextColumn get lotNumber => text().nullable()();
  DateTimeColumn get expirationDate => dateTime().nullable()();

  List<Set<Column>> get indexes => [
    {productId},
    {lotNumber},
  ];
}

class FarmStockMovements extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get stockId => integer().references(FarmStock, #id)();

  IntColumn get type => intEnum<StockMovementType>()();

  RealColumn get quantity => real()();
  IntColumn get unitCostInCents => integer().nullable()();

  TextColumn get referenceType => text().nullable()();
  TextColumn get referenceId => text().nullable()();

  List<Set<Column>> get indexes => [
    {stockId},
    {type},
  ];
}

class FarmSuppliers extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get contactInfo => text().nullable()();
}

class FarmPurchases extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get supplierId => integer().references(FarmSuppliers, #id)();

  DateTimeColumn get purchaseDate => dateTime()();

  IntColumn get totalValueInCents => integer()();

  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();
  DateTimeColumn get paymentDate => dateTime().nullable()();

  TextColumn get description => text().nullable()();

  List<Set<Column>> get indexes => [
    {supplierId},
    {isPaid},
  ];
}

class FarmPurchaseItems extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get purchaseId => integer().references(FarmPurchases, #id)();

  IntColumn get productId => integer().references(FarmProducts, #id)();

  RealColumn get quantity => real()();
  IntColumn get unitCostInCents => integer()();

  List<Set<Column>> get indexes => [
    {purchaseId},
    {productId},
  ];
}

class FarmAreas extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  RealColumn get sizeInHectares => real().nullable()();
}

class FarmProductions extends Table with BaseTable {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get productId => integer().references(FarmProducts, #id)();

  IntColumn get productionAreaId => integer().references(FarmAreas, #id)();

  RealColumn get quantity => real()();

  IntColumn get unitPriceInCents => integer()();
  IntColumn get productionCostInCents => integer()();

  DateTimeColumn get harvestDate => dateTime()();

  List<Set<Column>> get indexes => [
    {productId},
    {productionAreaId},
  ];
}
