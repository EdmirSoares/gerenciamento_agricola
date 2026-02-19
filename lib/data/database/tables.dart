import 'package:drift/drift.dart';

enum StockMovementType { inEntry, outEntry, loss, adjustment }

class Simulations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get producerName => text().withLength(min: 1, max: 100)();

  TextColumn get principalAmount => text()();
  TextColumn get interestRate => text()();
  IntColumn get periods => integer()();
  TextColumn get totalAmount => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
}

class FarmCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class FarmProducts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get categoryId => integer().references(FarmCategories, #id)();
  TextColumn get description => text().nullable()();
  TextColumn get unit =>
      text().withLength(min: 1, max: 50)(); // kg, L, un, saca
  BoolColumn get isProduction => boolean()(); // produzido no sítio
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class FarmStock extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(FarmProducts, #id)();

  RealColumn get quantity => real()(); //atualizar somente via movimentações
  RealColumn get minimumStock => real().nullable()();

  TextColumn get location => text().nullable()();
  TextColumn get lotNumber => text().nullable()();
  DateTimeColumn get expirationDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  List<Set<Column>> get indexes => [
    {productId},
  ];
}

class FarmStockMovements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(FarmProducts, #id)();

  IntColumn get type => intEnum<StockMovementType>()();

  IntColumn get quantity => integer()();
  IntColumn get unitCostInCents => integer().nullable()();

  TextColumn get referenceType => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  List<Set<Column>> get indexes => [
    {productId},
  ];
}

class FarmSupplyers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get contactInfo => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class FarmPurchases extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get supplierId => integer().references(FarmSupplyers, #id)();

  DateTimeColumn get purchaseDate => dateTime()();
  IntColumn get totalValueInCents => integer()();

  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();
  DateTimeColumn get paymentDate => dateTime().nullable()();

  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class FarmPurchaseItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get purchaseId => integer().references(FarmPurchases, #id)();
  IntColumn get productId => integer().references(FarmProducts, #id)();

  IntColumn get quantity => integer()();
  IntColumn get unitCostInCents => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();

  List<Set<Column>> get indexes => [
    {productId},
  ];
}

class FarmAreas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  RealColumn get sizeInHectares => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}

class FarmProductions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(FarmProducts, #id)();

  IntColumn get quantity => integer()();
  IntColumn get unitPriceInCents => integer()();
  IntColumn get productionCostInCents => integer()();

  DateTimeColumn get harvestDate => dateTime()();
  IntColumn get productionAreaId => integer().references(FarmAreas, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
}
