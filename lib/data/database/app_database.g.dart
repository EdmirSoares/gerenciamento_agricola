// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SimulationsTable extends Simulations
    with TableInfo<$SimulationsTable, Simulation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SimulationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _producerNameMeta = const VerificationMeta(
    'producerName',
  );
  @override
  late final GeneratedColumn<String> producerName = GeneratedColumn<String>(
    'producer_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _principalAmountInCentsMeta =
      const VerificationMeta('principalAmountInCents');
  @override
  late final GeneratedColumn<int> principalAmountInCents = GeneratedColumn<int>(
    'principal_amount_in_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interestRateBasisPointsMeta =
      const VerificationMeta('interestRateBasisPoints');
  @override
  late final GeneratedColumn<int> interestRateBasisPoints =
      GeneratedColumn<int>(
        'interest_rate_basis_points',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _periodsMeta = const VerificationMeta(
    'periods',
  );
  @override
  late final GeneratedColumn<int> periods = GeneratedColumn<int>(
    'periods',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalAmountInCentsMeta =
      const VerificationMeta('totalAmountInCents');
  @override
  late final GeneratedColumn<int> totalAmountInCents = GeneratedColumn<int>(
    'total_amount_in_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    producerName,
    principalAmountInCents,
    interestRateBasisPoints,
    periods,
    totalAmountInCents,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'simulations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Simulation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('producer_name')) {
      context.handle(
        _producerNameMeta,
        producerName.isAcceptableOrUnknown(
          data['producer_name']!,
          _producerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_producerNameMeta);
    }
    if (data.containsKey('principal_amount_in_cents')) {
      context.handle(
        _principalAmountInCentsMeta,
        principalAmountInCents.isAcceptableOrUnknown(
          data['principal_amount_in_cents']!,
          _principalAmountInCentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_principalAmountInCentsMeta);
    }
    if (data.containsKey('interest_rate_basis_points')) {
      context.handle(
        _interestRateBasisPointsMeta,
        interestRateBasisPoints.isAcceptableOrUnknown(
          data['interest_rate_basis_points']!,
          _interestRateBasisPointsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interestRateBasisPointsMeta);
    }
    if (data.containsKey('periods')) {
      context.handle(
        _periodsMeta,
        periods.isAcceptableOrUnknown(data['periods']!, _periodsMeta),
      );
    } else if (isInserting) {
      context.missing(_periodsMeta);
    }
    if (data.containsKey('total_amount_in_cents')) {
      context.handle(
        _totalAmountInCentsMeta,
        totalAmountInCents.isAcceptableOrUnknown(
          data['total_amount_in_cents']!,
          _totalAmountInCentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountInCentsMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Simulation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Simulation(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      producerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}producer_name'],
      )!,
      principalAmountInCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}principal_amount_in_cents'],
      )!,
      interestRateBasisPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interest_rate_basis_points'],
      )!,
      periods: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}periods'],
      )!,
      totalAmountInCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_amount_in_cents'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $SimulationsTable createAlias(String alias) {
    return $SimulationsTable(attachedDatabase, alias);
  }
}

class Simulation extends DataClass implements Insertable<Simulation> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final String producerName;
  final int principalAmountInCents;
  final int interestRateBasisPoints;
  final int periods;
  final int totalAmountInCents;
  final bool isSynced;
  const Simulation({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.producerName,
    required this.principalAmountInCents,
    required this.interestRateBasisPoints,
    required this.periods,
    required this.totalAmountInCents,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['producer_name'] = Variable<String>(producerName);
    map['principal_amount_in_cents'] = Variable<int>(principalAmountInCents);
    map['interest_rate_basis_points'] = Variable<int>(interestRateBasisPoints);
    map['periods'] = Variable<int>(periods);
    map['total_amount_in_cents'] = Variable<int>(totalAmountInCents);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  SimulationsCompanion toCompanion(bool nullToAbsent) {
    return SimulationsCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      producerName: Value(producerName),
      principalAmountInCents: Value(principalAmountInCents),
      interestRateBasisPoints: Value(interestRateBasisPoints),
      periods: Value(periods),
      totalAmountInCents: Value(totalAmountInCents),
      isSynced: Value(isSynced),
    );
  }

  factory Simulation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Simulation(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      producerName: serializer.fromJson<String>(json['producerName']),
      principalAmountInCents: serializer.fromJson<int>(
        json['principalAmountInCents'],
      ),
      interestRateBasisPoints: serializer.fromJson<int>(
        json['interestRateBasisPoints'],
      ),
      periods: serializer.fromJson<int>(json['periods']),
      totalAmountInCents: serializer.fromJson<int>(json['totalAmountInCents']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'producerName': serializer.toJson<String>(producerName),
      'principalAmountInCents': serializer.toJson<int>(principalAmountInCents),
      'interestRateBasisPoints': serializer.toJson<int>(
        interestRateBasisPoints,
      ),
      'periods': serializer.toJson<int>(periods),
      'totalAmountInCents': serializer.toJson<int>(totalAmountInCents),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Simulation copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    String? producerName,
    int? principalAmountInCents,
    int? interestRateBasisPoints,
    int? periods,
    int? totalAmountInCents,
    bool? isSynced,
  }) => Simulation(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    producerName: producerName ?? this.producerName,
    principalAmountInCents:
        principalAmountInCents ?? this.principalAmountInCents,
    interestRateBasisPoints:
        interestRateBasisPoints ?? this.interestRateBasisPoints,
    periods: periods ?? this.periods,
    totalAmountInCents: totalAmountInCents ?? this.totalAmountInCents,
    isSynced: isSynced ?? this.isSynced,
  );
  Simulation copyWithCompanion(SimulationsCompanion data) {
    return Simulation(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      producerName: data.producerName.present
          ? data.producerName.value
          : this.producerName,
      principalAmountInCents: data.principalAmountInCents.present
          ? data.principalAmountInCents.value
          : this.principalAmountInCents,
      interestRateBasisPoints: data.interestRateBasisPoints.present
          ? data.interestRateBasisPoints.value
          : this.interestRateBasisPoints,
      periods: data.periods.present ? data.periods.value : this.periods,
      totalAmountInCents: data.totalAmountInCents.present
          ? data.totalAmountInCents.value
          : this.totalAmountInCents,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Simulation(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('producerName: $producerName, ')
          ..write('principalAmountInCents: $principalAmountInCents, ')
          ..write('interestRateBasisPoints: $interestRateBasisPoints, ')
          ..write('periods: $periods, ')
          ..write('totalAmountInCents: $totalAmountInCents, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    producerName,
    principalAmountInCents,
    interestRateBasisPoints,
    periods,
    totalAmountInCents,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Simulation &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.producerName == this.producerName &&
          other.principalAmountInCents == this.principalAmountInCents &&
          other.interestRateBasisPoints == this.interestRateBasisPoints &&
          other.periods == this.periods &&
          other.totalAmountInCents == this.totalAmountInCents &&
          other.isSynced == this.isSynced);
}

class SimulationsCompanion extends UpdateCompanion<Simulation> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<String> producerName;
  final Value<int> principalAmountInCents;
  final Value<int> interestRateBasisPoints;
  final Value<int> periods;
  final Value<int> totalAmountInCents;
  final Value<bool> isSynced;
  const SimulationsCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.producerName = const Value.absent(),
    this.principalAmountInCents = const Value.absent(),
    this.interestRateBasisPoints = const Value.absent(),
    this.periods = const Value.absent(),
    this.totalAmountInCents = const Value.absent(),
    this.isSynced = const Value.absent(),
  });
  SimulationsCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required String producerName,
    required int principalAmountInCents,
    required int interestRateBasisPoints,
    required int periods,
    required int totalAmountInCents,
    this.isSynced = const Value.absent(),
  }) : producerName = Value(producerName),
       principalAmountInCents = Value(principalAmountInCents),
       interestRateBasisPoints = Value(interestRateBasisPoints),
       periods = Value(periods),
       totalAmountInCents = Value(totalAmountInCents);
  static Insertable<Simulation> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<String>? producerName,
    Expression<int>? principalAmountInCents,
    Expression<int>? interestRateBasisPoints,
    Expression<int>? periods,
    Expression<int>? totalAmountInCents,
    Expression<bool>? isSynced,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (producerName != null) 'producer_name': producerName,
      if (principalAmountInCents != null)
        'principal_amount_in_cents': principalAmountInCents,
      if (interestRateBasisPoints != null)
        'interest_rate_basis_points': interestRateBasisPoints,
      if (periods != null) 'periods': periods,
      if (totalAmountInCents != null)
        'total_amount_in_cents': totalAmountInCents,
      if (isSynced != null) 'is_synced': isSynced,
    });
  }

  SimulationsCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<String>? producerName,
    Value<int>? principalAmountInCents,
    Value<int>? interestRateBasisPoints,
    Value<int>? periods,
    Value<int>? totalAmountInCents,
    Value<bool>? isSynced,
  }) {
    return SimulationsCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      producerName: producerName ?? this.producerName,
      principalAmountInCents:
          principalAmountInCents ?? this.principalAmountInCents,
      interestRateBasisPoints:
          interestRateBasisPoints ?? this.interestRateBasisPoints,
      periods: periods ?? this.periods,
      totalAmountInCents: totalAmountInCents ?? this.totalAmountInCents,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (producerName.present) {
      map['producer_name'] = Variable<String>(producerName.value);
    }
    if (principalAmountInCents.present) {
      map['principal_amount_in_cents'] = Variable<int>(
        principalAmountInCents.value,
      );
    }
    if (interestRateBasisPoints.present) {
      map['interest_rate_basis_points'] = Variable<int>(
        interestRateBasisPoints.value,
      );
    }
    if (periods.present) {
      map['periods'] = Variable<int>(periods.value);
    }
    if (totalAmountInCents.present) {
      map['total_amount_in_cents'] = Variable<int>(totalAmountInCents.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SimulationsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('producerName: $producerName, ')
          ..write('principalAmountInCents: $principalAmountInCents, ')
          ..write('interestRateBasisPoints: $interestRateBasisPoints, ')
          ..write('periods: $periods, ')
          ..write('totalAmountInCents: $totalAmountInCents, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }
}

class $FarmCategoriesTable extends FarmCategories
    with TableInfo<$FarmCategoriesTable, FarmCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    name,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmCategory(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $FarmCategoriesTable createAlias(String alias) {
    return $FarmCategoriesTable(attachedDatabase, alias);
  }
}

class FarmCategory extends DataClass implements Insertable<FarmCategory> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final String name;
  const FarmCategory({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  FarmCategoriesCompanion toCompanion(bool nullToAbsent) {
    return FarmCategoriesCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      name: Value(name),
    );
  }

  factory FarmCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmCategory(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  FarmCategory copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    String? name,
  }) => FarmCategory(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    name: name ?? this.name,
  );
  FarmCategory copyWithCompanion(FarmCategoriesCompanion data) {
    return FarmCategory(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmCategory(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, createdAt, updatedAt, isDeleted, id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmCategory &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.name == this.name);
}

class FarmCategoriesCompanion extends UpdateCompanion<FarmCategory> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<String> name;
  const FarmCategoriesCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FarmCategoriesCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<FarmCategory> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FarmCategoriesCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<String>? name,
  }) {
    return FarmCategoriesCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmCategoriesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $FarmProductsTable extends FarmProducts
    with TableInfo<$FarmProductsTable, FarmProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES farm_categories (id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isProductionMeta = const VerificationMeta(
    'isProduction',
  );
  @override
  late final GeneratedColumn<bool> isProduction = GeneratedColumn<bool>(
    'is_production',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_production" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    name,
    categoryId,
    description,
    unit,
    isProduction,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_products';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmProduct> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('is_production')) {
      context.handle(
        _isProductionMeta,
        isProduction.isAcceptableOrUnknown(
          data['is_production']!,
          _isProductionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isProductionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmProduct(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      isProduction: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_production'],
      )!,
    );
  }

  @override
  $FarmProductsTable createAlias(String alias) {
    return $FarmProductsTable(attachedDatabase, alias);
  }
}

class FarmProduct extends DataClass implements Insertable<FarmProduct> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final String name;
  final int categoryId;
  final String? description;
  final String unit;
  final bool isProduction;
  const FarmProduct({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.name,
    required this.categoryId,
    this.description,
    required this.unit,
    required this.isProduction,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['unit'] = Variable<String>(unit);
    map['is_production'] = Variable<bool>(isProduction);
    return map;
  }

  FarmProductsCompanion toCompanion(bool nullToAbsent) {
    return FarmProductsCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      name: Value(name),
      categoryId: Value(categoryId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      unit: Value(unit),
      isProduction: Value(isProduction),
    );
  }

  factory FarmProduct.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmProduct(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      description: serializer.fromJson<String?>(json['description']),
      unit: serializer.fromJson<String>(json['unit']),
      isProduction: serializer.fromJson<bool>(json['isProduction']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<int>(categoryId),
      'description': serializer.toJson<String?>(description),
      'unit': serializer.toJson<String>(unit),
      'isProduction': serializer.toJson<bool>(isProduction),
    };
  }

  FarmProduct copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    String? name,
    int? categoryId,
    Value<String?> description = const Value.absent(),
    String? unit,
    bool? isProduction,
  }) => FarmProduct(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    name: name ?? this.name,
    categoryId: categoryId ?? this.categoryId,
    description: description.present ? description.value : this.description,
    unit: unit ?? this.unit,
    isProduction: isProduction ?? this.isProduction,
  );
  FarmProduct copyWithCompanion(FarmProductsCompanion data) {
    return FarmProduct(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      description: data.description.present
          ? data.description.value
          : this.description,
      unit: data.unit.present ? data.unit.value : this.unit,
      isProduction: data.isProduction.present
          ? data.isProduction.value
          : this.isProduction,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmProduct(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('unit: $unit, ')
          ..write('isProduction: $isProduction')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    name,
    categoryId,
    description,
    unit,
    isProduction,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmProduct &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.name == this.name &&
          other.categoryId == this.categoryId &&
          other.description == this.description &&
          other.unit == this.unit &&
          other.isProduction == this.isProduction);
}

class FarmProductsCompanion extends UpdateCompanion<FarmProduct> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<String> name;
  final Value<int> categoryId;
  final Value<String?> description;
  final Value<String> unit;
  final Value<bool> isProduction;
  const FarmProductsCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.description = const Value.absent(),
    this.unit = const Value.absent(),
    this.isProduction = const Value.absent(),
  });
  FarmProductsCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    required int categoryId,
    this.description = const Value.absent(),
    required String unit,
    required bool isProduction,
  }) : name = Value(name),
       categoryId = Value(categoryId),
       unit = Value(unit),
       isProduction = Value(isProduction);
  static Insertable<FarmProduct> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? categoryId,
    Expression<String>? description,
    Expression<String>? unit,
    Expression<bool>? isProduction,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
      if (description != null) 'description': description,
      if (unit != null) 'unit': unit,
      if (isProduction != null) 'is_production': isProduction,
    });
  }

  FarmProductsCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<String>? name,
    Value<int>? categoryId,
    Value<String?>? description,
    Value<String>? unit,
    Value<bool>? isProduction,
  }) {
    return FarmProductsCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      unit: unit ?? this.unit,
      isProduction: isProduction ?? this.isProduction,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (isProduction.present) {
      map['is_production'] = Variable<bool>(isProduction.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmProductsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId, ')
          ..write('description: $description, ')
          ..write('unit: $unit, ')
          ..write('isProduction: $isProduction')
          ..write(')'))
        .toString();
  }
}

class $FarmStockTable extends FarmStock
    with TableInfo<$FarmStockTable, FarmStockData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmStockTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES farm_products (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minimumStockMeta = const VerificationMeta(
    'minimumStock',
  );
  @override
  late final GeneratedColumn<double> minimumStock = GeneratedColumn<double>(
    'minimum_stock',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lotNumberMeta = const VerificationMeta(
    'lotNumber',
  );
  @override
  late final GeneratedColumn<String> lotNumber = GeneratedColumn<String>(
    'lot_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expirationDateMeta = const VerificationMeta(
    'expirationDate',
  );
  @override
  late final GeneratedColumn<DateTime> expirationDate =
      GeneratedColumn<DateTime>(
        'expiration_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    productId,
    quantity,
    minimumStock,
    location,
    lotNumber,
    expirationDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_stock';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmStockData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('minimum_stock')) {
      context.handle(
        _minimumStockMeta,
        minimumStock.isAcceptableOrUnknown(
          data['minimum_stock']!,
          _minimumStockMeta,
        ),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('lot_number')) {
      context.handle(
        _lotNumberMeta,
        lotNumber.isAcceptableOrUnknown(data['lot_number']!, _lotNumberMeta),
      );
    }
    if (data.containsKey('expiration_date')) {
      context.handle(
        _expirationDateMeta,
        expirationDate.isAcceptableOrUnknown(
          data['expiration_date']!,
          _expirationDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmStockData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmStockData(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      minimumStock: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}minimum_stock'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      lotNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lot_number'],
      ),
      expirationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expiration_date'],
      ),
    );
  }

  @override
  $FarmStockTable createAlias(String alias) {
    return $FarmStockTable(attachedDatabase, alias);
  }
}

class FarmStockData extends DataClass implements Insertable<FarmStockData> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final int productId;
  final double quantity;
  final double? minimumStock;
  final String? location;
  final String? lotNumber;
  final DateTime? expirationDate;
  const FarmStockData({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.productId,
    required this.quantity,
    this.minimumStock,
    this.location,
    this.lotNumber,
    this.expirationDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || minimumStock != null) {
      map['minimum_stock'] = Variable<double>(minimumStock);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || lotNumber != null) {
      map['lot_number'] = Variable<String>(lotNumber);
    }
    if (!nullToAbsent || expirationDate != null) {
      map['expiration_date'] = Variable<DateTime>(expirationDate);
    }
    return map;
  }

  FarmStockCompanion toCompanion(bool nullToAbsent) {
    return FarmStockCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      productId: Value(productId),
      quantity: Value(quantity),
      minimumStock: minimumStock == null && nullToAbsent
          ? const Value.absent()
          : Value(minimumStock),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      lotNumber: lotNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(lotNumber),
      expirationDate: expirationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expirationDate),
    );
  }

  factory FarmStockData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmStockData(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      minimumStock: serializer.fromJson<double?>(json['minimumStock']),
      location: serializer.fromJson<String?>(json['location']),
      lotNumber: serializer.fromJson<String?>(json['lotNumber']),
      expirationDate: serializer.fromJson<DateTime?>(json['expirationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'minimumStock': serializer.toJson<double?>(minimumStock),
      'location': serializer.toJson<String?>(location),
      'lotNumber': serializer.toJson<String?>(lotNumber),
      'expirationDate': serializer.toJson<DateTime?>(expirationDate),
    };
  }

  FarmStockData copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    int? productId,
    double? quantity,
    Value<double?> minimumStock = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> lotNumber = const Value.absent(),
    Value<DateTime?> expirationDate = const Value.absent(),
  }) => FarmStockData(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    productId: productId ?? this.productId,
    quantity: quantity ?? this.quantity,
    minimumStock: minimumStock.present ? minimumStock.value : this.minimumStock,
    location: location.present ? location.value : this.location,
    lotNumber: lotNumber.present ? lotNumber.value : this.lotNumber,
    expirationDate: expirationDate.present
        ? expirationDate.value
        : this.expirationDate,
  );
  FarmStockData copyWithCompanion(FarmStockCompanion data) {
    return FarmStockData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      minimumStock: data.minimumStock.present
          ? data.minimumStock.value
          : this.minimumStock,
      location: data.location.present ? data.location.value : this.location,
      lotNumber: data.lotNumber.present ? data.lotNumber.value : this.lotNumber,
      expirationDate: data.expirationDate.present
          ? data.expirationDate.value
          : this.expirationDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmStockData(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('minimumStock: $minimumStock, ')
          ..write('location: $location, ')
          ..write('lotNumber: $lotNumber, ')
          ..write('expirationDate: $expirationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    productId,
    quantity,
    minimumStock,
    location,
    lotNumber,
    expirationDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmStockData &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.minimumStock == this.minimumStock &&
          other.location == this.location &&
          other.lotNumber == this.lotNumber &&
          other.expirationDate == this.expirationDate);
}

class FarmStockCompanion extends UpdateCompanion<FarmStockData> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<int> productId;
  final Value<double> quantity;
  final Value<double?> minimumStock;
  final Value<String?> location;
  final Value<String?> lotNumber;
  final Value<DateTime?> expirationDate;
  const FarmStockCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.minimumStock = const Value.absent(),
    this.location = const Value.absent(),
    this.lotNumber = const Value.absent(),
    this.expirationDate = const Value.absent(),
  });
  FarmStockCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required int productId,
    required double quantity,
    this.minimumStock = const Value.absent(),
    this.location = const Value.absent(),
    this.lotNumber = const Value.absent(),
    this.expirationDate = const Value.absent(),
  }) : productId = Value(productId),
       quantity = Value(quantity);
  static Insertable<FarmStockData> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<int>? productId,
    Expression<double>? quantity,
    Expression<double>? minimumStock,
    Expression<String>? location,
    Expression<String>? lotNumber,
    Expression<DateTime>? expirationDate,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (minimumStock != null) 'minimum_stock': minimumStock,
      if (location != null) 'location': location,
      if (lotNumber != null) 'lot_number': lotNumber,
      if (expirationDate != null) 'expiration_date': expirationDate,
    });
  }

  FarmStockCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<int>? productId,
    Value<double>? quantity,
    Value<double?>? minimumStock,
    Value<String?>? location,
    Value<String?>? lotNumber,
    Value<DateTime?>? expirationDate,
  }) {
    return FarmStockCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      minimumStock: minimumStock ?? this.minimumStock,
      location: location ?? this.location,
      lotNumber: lotNumber ?? this.lotNumber,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (minimumStock.present) {
      map['minimum_stock'] = Variable<double>(minimumStock.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (lotNumber.present) {
      map['lot_number'] = Variable<String>(lotNumber.value);
    }
    if (expirationDate.present) {
      map['expiration_date'] = Variable<DateTime>(expirationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmStockCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('minimumStock: $minimumStock, ')
          ..write('location: $location, ')
          ..write('lotNumber: $lotNumber, ')
          ..write('expirationDate: $expirationDate')
          ..write(')'))
        .toString();
  }
}

class $FarmStockMovementsTable extends FarmStockMovements
    with TableInfo<$FarmStockMovementsTable, FarmStockMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmStockMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _stockIdMeta = const VerificationMeta(
    'stockId',
  );
  @override
  late final GeneratedColumn<int> stockId = GeneratedColumn<int>(
    'stock_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES farm_stock (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<StockMovementType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<StockMovementType>(
        $FarmStockMovementsTable.$convertertype,
      );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitCostInCentsMeta = const VerificationMeta(
    'unitCostInCents',
  );
  @override
  late final GeneratedColumn<int> unitCostInCents = GeneratedColumn<int>(
    'unit_cost_in_cents',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referenceTypeMeta = const VerificationMeta(
    'referenceType',
  );
  @override
  late final GeneratedColumn<String> referenceType = GeneratedColumn<String>(
    'reference_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _referenceIdMeta = const VerificationMeta(
    'referenceId',
  );
  @override
  late final GeneratedColumn<String> referenceId = GeneratedColumn<String>(
    'reference_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    stockId,
    type,
    quantity,
    unitCostInCents,
    referenceType,
    referenceId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_stock_movements';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmStockMovement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('stock_id')) {
      context.handle(
        _stockIdMeta,
        stockId.isAcceptableOrUnknown(data['stock_id']!, _stockIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stockIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_cost_in_cents')) {
      context.handle(
        _unitCostInCentsMeta,
        unitCostInCents.isAcceptableOrUnknown(
          data['unit_cost_in_cents']!,
          _unitCostInCentsMeta,
        ),
      );
    }
    if (data.containsKey('reference_type')) {
      context.handle(
        _referenceTypeMeta,
        referenceType.isAcceptableOrUnknown(
          data['reference_type']!,
          _referenceTypeMeta,
        ),
      );
    }
    if (data.containsKey('reference_id')) {
      context.handle(
        _referenceIdMeta,
        referenceId.isAcceptableOrUnknown(
          data['reference_id']!,
          _referenceIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmStockMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmStockMovement(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      stockId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock_id'],
      )!,
      type: $FarmStockMovementsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      unitCostInCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost_in_cents'],
      ),
      referenceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_type'],
      ),
      referenceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_id'],
      ),
    );
  }

  @override
  $FarmStockMovementsTable createAlias(String alias) {
    return $FarmStockMovementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<StockMovementType, int, int> $convertertype =
      const EnumIndexConverter<StockMovementType>(StockMovementType.values);
}

class FarmStockMovement extends DataClass
    implements Insertable<FarmStockMovement> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final int stockId;
  final StockMovementType type;
  final double quantity;
  final int? unitCostInCents;
  final String? referenceType;
  final String? referenceId;
  const FarmStockMovement({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.stockId,
    required this.type,
    required this.quantity,
    this.unitCostInCents,
    this.referenceType,
    this.referenceId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['stock_id'] = Variable<int>(stockId);
    {
      map['type'] = Variable<int>(
        $FarmStockMovementsTable.$convertertype.toSql(type),
      );
    }
    map['quantity'] = Variable<double>(quantity);
    if (!nullToAbsent || unitCostInCents != null) {
      map['unit_cost_in_cents'] = Variable<int>(unitCostInCents);
    }
    if (!nullToAbsent || referenceType != null) {
      map['reference_type'] = Variable<String>(referenceType);
    }
    if (!nullToAbsent || referenceId != null) {
      map['reference_id'] = Variable<String>(referenceId);
    }
    return map;
  }

  FarmStockMovementsCompanion toCompanion(bool nullToAbsent) {
    return FarmStockMovementsCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      stockId: Value(stockId),
      type: Value(type),
      quantity: Value(quantity),
      unitCostInCents: unitCostInCents == null && nullToAbsent
          ? const Value.absent()
          : Value(unitCostInCents),
      referenceType: referenceType == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceType),
      referenceId: referenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceId),
    );
  }

  factory FarmStockMovement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmStockMovement(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      stockId: serializer.fromJson<int>(json['stockId']),
      type: $FarmStockMovementsTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitCostInCents: serializer.fromJson<int?>(json['unitCostInCents']),
      referenceType: serializer.fromJson<String?>(json['referenceType']),
      referenceId: serializer.fromJson<String?>(json['referenceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'stockId': serializer.toJson<int>(stockId),
      'type': serializer.toJson<int>(
        $FarmStockMovementsTable.$convertertype.toJson(type),
      ),
      'quantity': serializer.toJson<double>(quantity),
      'unitCostInCents': serializer.toJson<int?>(unitCostInCents),
      'referenceType': serializer.toJson<String?>(referenceType),
      'referenceId': serializer.toJson<String?>(referenceId),
    };
  }

  FarmStockMovement copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    int? stockId,
    StockMovementType? type,
    double? quantity,
    Value<int?> unitCostInCents = const Value.absent(),
    Value<String?> referenceType = const Value.absent(),
    Value<String?> referenceId = const Value.absent(),
  }) => FarmStockMovement(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    stockId: stockId ?? this.stockId,
    type: type ?? this.type,
    quantity: quantity ?? this.quantity,
    unitCostInCents: unitCostInCents.present
        ? unitCostInCents.value
        : this.unitCostInCents,
    referenceType: referenceType.present
        ? referenceType.value
        : this.referenceType,
    referenceId: referenceId.present ? referenceId.value : this.referenceId,
  );
  FarmStockMovement copyWithCompanion(FarmStockMovementsCompanion data) {
    return FarmStockMovement(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      stockId: data.stockId.present ? data.stockId.value : this.stockId,
      type: data.type.present ? data.type.value : this.type,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitCostInCents: data.unitCostInCents.present
          ? data.unitCostInCents.value
          : this.unitCostInCents,
      referenceType: data.referenceType.present
          ? data.referenceType.value
          : this.referenceType,
      referenceId: data.referenceId.present
          ? data.referenceId.value
          : this.referenceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmStockMovement(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('stockId: $stockId, ')
          ..write('type: $type, ')
          ..write('quantity: $quantity, ')
          ..write('unitCostInCents: $unitCostInCents, ')
          ..write('referenceType: $referenceType, ')
          ..write('referenceId: $referenceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    stockId,
    type,
    quantity,
    unitCostInCents,
    referenceType,
    referenceId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmStockMovement &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.stockId == this.stockId &&
          other.type == this.type &&
          other.quantity == this.quantity &&
          other.unitCostInCents == this.unitCostInCents &&
          other.referenceType == this.referenceType &&
          other.referenceId == this.referenceId);
}

class FarmStockMovementsCompanion extends UpdateCompanion<FarmStockMovement> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<int> stockId;
  final Value<StockMovementType> type;
  final Value<double> quantity;
  final Value<int?> unitCostInCents;
  final Value<String?> referenceType;
  final Value<String?> referenceId;
  const FarmStockMovementsCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.stockId = const Value.absent(),
    this.type = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitCostInCents = const Value.absent(),
    this.referenceType = const Value.absent(),
    this.referenceId = const Value.absent(),
  });
  FarmStockMovementsCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required int stockId,
    required StockMovementType type,
    required double quantity,
    this.unitCostInCents = const Value.absent(),
    this.referenceType = const Value.absent(),
    this.referenceId = const Value.absent(),
  }) : stockId = Value(stockId),
       type = Value(type),
       quantity = Value(quantity);
  static Insertable<FarmStockMovement> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<int>? stockId,
    Expression<int>? type,
    Expression<double>? quantity,
    Expression<int>? unitCostInCents,
    Expression<String>? referenceType,
    Expression<String>? referenceId,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (stockId != null) 'stock_id': stockId,
      if (type != null) 'type': type,
      if (quantity != null) 'quantity': quantity,
      if (unitCostInCents != null) 'unit_cost_in_cents': unitCostInCents,
      if (referenceType != null) 'reference_type': referenceType,
      if (referenceId != null) 'reference_id': referenceId,
    });
  }

  FarmStockMovementsCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<int>? stockId,
    Value<StockMovementType>? type,
    Value<double>? quantity,
    Value<int?>? unitCostInCents,
    Value<String?>? referenceType,
    Value<String?>? referenceId,
  }) {
    return FarmStockMovementsCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      stockId: stockId ?? this.stockId,
      type: type ?? this.type,
      quantity: quantity ?? this.quantity,
      unitCostInCents: unitCostInCents ?? this.unitCostInCents,
      referenceType: referenceType ?? this.referenceType,
      referenceId: referenceId ?? this.referenceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stockId.present) {
      map['stock_id'] = Variable<int>(stockId.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $FarmStockMovementsTable.$convertertype.toSql(type.value),
      );
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitCostInCents.present) {
      map['unit_cost_in_cents'] = Variable<int>(unitCostInCents.value);
    }
    if (referenceType.present) {
      map['reference_type'] = Variable<String>(referenceType.value);
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<String>(referenceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmStockMovementsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('stockId: $stockId, ')
          ..write('type: $type, ')
          ..write('quantity: $quantity, ')
          ..write('unitCostInCents: $unitCostInCents, ')
          ..write('referenceType: $referenceType, ')
          ..write('referenceId: $referenceId')
          ..write(')'))
        .toString();
  }
}

class $FarmSuppliersTable extends FarmSuppliers
    with TableInfo<$FarmSuppliersTable, FarmSupplier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmSuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactInfoMeta = const VerificationMeta(
    'contactInfo',
  );
  @override
  late final GeneratedColumn<String> contactInfo = GeneratedColumn<String>(
    'contact_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    name,
    contactInfo,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_suppliers';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmSupplier> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact_info')) {
      context.handle(
        _contactInfoMeta,
        contactInfo.isAcceptableOrUnknown(
          data['contact_info']!,
          _contactInfoMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmSupplier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmSupplier(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      contactInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_info'],
      ),
    );
  }

  @override
  $FarmSuppliersTable createAlias(String alias) {
    return $FarmSuppliersTable(attachedDatabase, alias);
  }
}

class FarmSupplier extends DataClass implements Insertable<FarmSupplier> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final String name;
  final String? contactInfo;
  const FarmSupplier({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.name,
    this.contactInfo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || contactInfo != null) {
      map['contact_info'] = Variable<String>(contactInfo);
    }
    return map;
  }

  FarmSuppliersCompanion toCompanion(bool nullToAbsent) {
    return FarmSuppliersCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      name: Value(name),
      contactInfo: contactInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(contactInfo),
    );
  }

  factory FarmSupplier.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmSupplier(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      contactInfo: serializer.fromJson<String?>(json['contactInfo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'contactInfo': serializer.toJson<String?>(contactInfo),
    };
  }

  FarmSupplier copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    String? name,
    Value<String?> contactInfo = const Value.absent(),
  }) => FarmSupplier(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    name: name ?? this.name,
    contactInfo: contactInfo.present ? contactInfo.value : this.contactInfo,
  );
  FarmSupplier copyWithCompanion(FarmSuppliersCompanion data) {
    return FarmSupplier(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      contactInfo: data.contactInfo.present
          ? data.contactInfo.value
          : this.contactInfo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmSupplier(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactInfo: $contactInfo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, createdAt, updatedAt, isDeleted, id, name, contactInfo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmSupplier &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.name == this.name &&
          other.contactInfo == this.contactInfo);
}

class FarmSuppliersCompanion extends UpdateCompanion<FarmSupplier> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<String> name;
  final Value<String?> contactInfo;
  const FarmSuppliersCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.contactInfo = const Value.absent(),
  });
  FarmSuppliersCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    this.contactInfo = const Value.absent(),
  }) : name = Value(name);
  static Insertable<FarmSupplier> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? contactInfo,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (contactInfo != null) 'contact_info': contactInfo,
    });
  }

  FarmSuppliersCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<String>? name,
    Value<String?>? contactInfo,
  }) {
    return FarmSuppliersCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      name: name ?? this.name,
      contactInfo: contactInfo ?? this.contactInfo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (contactInfo.present) {
      map['contact_info'] = Variable<String>(contactInfo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmSuppliersCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactInfo: $contactInfo')
          ..write(')'))
        .toString();
  }
}

class $FarmPurchasesTable extends FarmPurchases
    with TableInfo<$FarmPurchasesTable, FarmPurchase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmPurchasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES farm_suppliers (id)',
    ),
  );
  static const VerificationMeta _purchaseDateMeta = const VerificationMeta(
    'purchaseDate',
  );
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
    'purchase_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalValueInCentsMeta = const VerificationMeta(
    'totalValueInCents',
  );
  @override
  late final GeneratedColumn<int> totalValueInCents = GeneratedColumn<int>(
    'total_value_in_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
    'is_paid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_paid" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _paymentDateMeta = const VerificationMeta(
    'paymentDate',
  );
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
    'payment_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    supplierId,
    purchaseDate,
    totalValueInCents,
    dueDate,
    isPaid,
    paymentDate,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_purchases';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmPurchase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
        _purchaseDateMeta,
        purchaseDate.isAcceptableOrUnknown(
          data['purchase_date']!,
          _purchaseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('total_value_in_cents')) {
      context.handle(
        _totalValueInCentsMeta,
        totalValueInCents.isAcceptableOrUnknown(
          data['total_value_in_cents']!,
          _totalValueInCentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalValueInCentsMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('is_paid')) {
      context.handle(
        _isPaidMeta,
        isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta),
      );
    }
    if (data.containsKey('payment_date')) {
      context.handle(
        _paymentDateMeta,
        paymentDate.isAcceptableOrUnknown(
          data['payment_date']!,
          _paymentDateMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmPurchase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmPurchase(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      )!,
      purchaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}purchase_date'],
      )!,
      totalValueInCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_value_in_cents'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      isPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_paid'],
      )!,
      paymentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}payment_date'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
    );
  }

  @override
  $FarmPurchasesTable createAlias(String alias) {
    return $FarmPurchasesTable(attachedDatabase, alias);
  }
}

class FarmPurchase extends DataClass implements Insertable<FarmPurchase> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final int supplierId;
  final DateTime purchaseDate;
  final int totalValueInCents;
  final DateTime? dueDate;
  final bool isPaid;
  final DateTime? paymentDate;
  final String? description;
  const FarmPurchase({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.supplierId,
    required this.purchaseDate,
    required this.totalValueInCents,
    this.dueDate,
    required this.isPaid,
    this.paymentDate,
    this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['supplier_id'] = Variable<int>(supplierId);
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    map['total_value_in_cents'] = Variable<int>(totalValueInCents);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['is_paid'] = Variable<bool>(isPaid);
    if (!nullToAbsent || paymentDate != null) {
      map['payment_date'] = Variable<DateTime>(paymentDate);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  FarmPurchasesCompanion toCompanion(bool nullToAbsent) {
    return FarmPurchasesCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      supplierId: Value(supplierId),
      purchaseDate: Value(purchaseDate),
      totalValueInCents: Value(totalValueInCents),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      isPaid: Value(isPaid),
      paymentDate: paymentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory FarmPurchase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmPurchase(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int>(json['supplierId']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      totalValueInCents: serializer.fromJson<int>(json['totalValueInCents']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
      paymentDate: serializer.fromJson<DateTime?>(json['paymentDate']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int>(supplierId),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'totalValueInCents': serializer.toJson<int>(totalValueInCents),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'isPaid': serializer.toJson<bool>(isPaid),
      'paymentDate': serializer.toJson<DateTime?>(paymentDate),
      'description': serializer.toJson<String?>(description),
    };
  }

  FarmPurchase copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    int? supplierId,
    DateTime? purchaseDate,
    int? totalValueInCents,
    Value<DateTime?> dueDate = const Value.absent(),
    bool? isPaid,
    Value<DateTime?> paymentDate = const Value.absent(),
    Value<String?> description = const Value.absent(),
  }) => FarmPurchase(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    supplierId: supplierId ?? this.supplierId,
    purchaseDate: purchaseDate ?? this.purchaseDate,
    totalValueInCents: totalValueInCents ?? this.totalValueInCents,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    isPaid: isPaid ?? this.isPaid,
    paymentDate: paymentDate.present ? paymentDate.value : this.paymentDate,
    description: description.present ? description.value : this.description,
  );
  FarmPurchase copyWithCompanion(FarmPurchasesCompanion data) {
    return FarmPurchase(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      totalValueInCents: data.totalValueInCents.present
          ? data.totalValueInCents.value
          : this.totalValueInCents,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      isPaid: data.isPaid.present ? data.isPaid.value : this.isPaid,
      paymentDate: data.paymentDate.present
          ? data.paymentDate.value
          : this.paymentDate,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmPurchase(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('totalValueInCents: $totalValueInCents, ')
          ..write('dueDate: $dueDate, ')
          ..write('isPaid: $isPaid, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    supplierId,
    purchaseDate,
    totalValueInCents,
    dueDate,
    isPaid,
    paymentDate,
    description,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmPurchase &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.purchaseDate == this.purchaseDate &&
          other.totalValueInCents == this.totalValueInCents &&
          other.dueDate == this.dueDate &&
          other.isPaid == this.isPaid &&
          other.paymentDate == this.paymentDate &&
          other.description == this.description);
}

class FarmPurchasesCompanion extends UpdateCompanion<FarmPurchase> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<int> supplierId;
  final Value<DateTime> purchaseDate;
  final Value<int> totalValueInCents;
  final Value<DateTime?> dueDate;
  final Value<bool> isPaid;
  final Value<DateTime?> paymentDate;
  final Value<String?> description;
  const FarmPurchasesCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.totalValueInCents = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.description = const Value.absent(),
  });
  FarmPurchasesCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required int supplierId,
    required DateTime purchaseDate,
    required int totalValueInCents,
    this.dueDate = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.description = const Value.absent(),
  }) : supplierId = Value(supplierId),
       purchaseDate = Value(purchaseDate),
       totalValueInCents = Value(totalValueInCents);
  static Insertable<FarmPurchase> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<DateTime>? purchaseDate,
    Expression<int>? totalValueInCents,
    Expression<DateTime>? dueDate,
    Expression<bool>? isPaid,
    Expression<DateTime>? paymentDate,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (totalValueInCents != null) 'total_value_in_cents': totalValueInCents,
      if (dueDate != null) 'due_date': dueDate,
      if (isPaid != null) 'is_paid': isPaid,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (description != null) 'description': description,
    });
  }

  FarmPurchasesCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<int>? supplierId,
    Value<DateTime>? purchaseDate,
    Value<int>? totalValueInCents,
    Value<DateTime?>? dueDate,
    Value<bool>? isPaid,
    Value<DateTime?>? paymentDate,
    Value<String?>? description,
  }) {
    return FarmPurchasesCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      totalValueInCents: totalValueInCents ?? this.totalValueInCents,
      dueDate: dueDate ?? this.dueDate,
      isPaid: isPaid ?? this.isPaid,
      paymentDate: paymentDate ?? this.paymentDate,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (totalValueInCents.present) {
      map['total_value_in_cents'] = Variable<int>(totalValueInCents.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmPurchasesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('totalValueInCents: $totalValueInCents, ')
          ..write('dueDate: $dueDate, ')
          ..write('isPaid: $isPaid, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $FarmPurchaseItemsTable extends FarmPurchaseItems
    with TableInfo<$FarmPurchaseItemsTable, FarmPurchaseItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmPurchaseItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _purchaseIdMeta = const VerificationMeta(
    'purchaseId',
  );
  @override
  late final GeneratedColumn<int> purchaseId = GeneratedColumn<int>(
    'purchase_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES farm_purchases (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES farm_products (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitCostInCentsMeta = const VerificationMeta(
    'unitCostInCents',
  );
  @override
  late final GeneratedColumn<int> unitCostInCents = GeneratedColumn<int>(
    'unit_cost_in_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    purchaseId,
    productId,
    quantity,
    unitCostInCents,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_purchase_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmPurchaseItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
        _purchaseIdMeta,
        purchaseId.isAcceptableOrUnknown(data['purchase_id']!, _purchaseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_purchaseIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_cost_in_cents')) {
      context.handle(
        _unitCostInCentsMeta,
        unitCostInCents.isAcceptableOrUnknown(
          data['unit_cost_in_cents']!,
          _unitCostInCentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitCostInCentsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmPurchaseItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmPurchaseItem(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      purchaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      unitCostInCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_cost_in_cents'],
      )!,
    );
  }

  @override
  $FarmPurchaseItemsTable createAlias(String alias) {
    return $FarmPurchaseItemsTable(attachedDatabase, alias);
  }
}

class FarmPurchaseItem extends DataClass
    implements Insertable<FarmPurchaseItem> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final int purchaseId;
  final int productId;
  final double quantity;
  final int unitCostInCents;
  const FarmPurchaseItem({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.purchaseId,
    required this.productId,
    required this.quantity,
    required this.unitCostInCents,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['purchase_id'] = Variable<int>(purchaseId);
    map['product_id'] = Variable<int>(productId);
    map['quantity'] = Variable<double>(quantity);
    map['unit_cost_in_cents'] = Variable<int>(unitCostInCents);
    return map;
  }

  FarmPurchaseItemsCompanion toCompanion(bool nullToAbsent) {
    return FarmPurchaseItemsCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      purchaseId: Value(purchaseId),
      productId: Value(productId),
      quantity: Value(quantity),
      unitCostInCents: Value(unitCostInCents),
    );
  }

  factory FarmPurchaseItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmPurchaseItem(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      purchaseId: serializer.fromJson<int>(json['purchaseId']),
      productId: serializer.fromJson<int>(json['productId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitCostInCents: serializer.fromJson<int>(json['unitCostInCents']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'purchaseId': serializer.toJson<int>(purchaseId),
      'productId': serializer.toJson<int>(productId),
      'quantity': serializer.toJson<double>(quantity),
      'unitCostInCents': serializer.toJson<int>(unitCostInCents),
    };
  }

  FarmPurchaseItem copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    int? purchaseId,
    int? productId,
    double? quantity,
    int? unitCostInCents,
  }) => FarmPurchaseItem(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    purchaseId: purchaseId ?? this.purchaseId,
    productId: productId ?? this.productId,
    quantity: quantity ?? this.quantity,
    unitCostInCents: unitCostInCents ?? this.unitCostInCents,
  );
  FarmPurchaseItem copyWithCompanion(FarmPurchaseItemsCompanion data) {
    return FarmPurchaseItem(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      purchaseId: data.purchaseId.present
          ? data.purchaseId.value
          : this.purchaseId,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitCostInCents: data.unitCostInCents.present
          ? data.unitCostInCents.value
          : this.unitCostInCents,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmPurchaseItem(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('unitCostInCents: $unitCostInCents')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    purchaseId,
    productId,
    quantity,
    unitCostInCents,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmPurchaseItem &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.purchaseId == this.purchaseId &&
          other.productId == this.productId &&
          other.quantity == this.quantity &&
          other.unitCostInCents == this.unitCostInCents);
}

class FarmPurchaseItemsCompanion extends UpdateCompanion<FarmPurchaseItem> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<int> purchaseId;
  final Value<int> productId;
  final Value<double> quantity;
  final Value<int> unitCostInCents;
  const FarmPurchaseItemsCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.purchaseId = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitCostInCents = const Value.absent(),
  });
  FarmPurchaseItemsCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required int purchaseId,
    required int productId,
    required double quantity,
    required int unitCostInCents,
  }) : purchaseId = Value(purchaseId),
       productId = Value(productId),
       quantity = Value(quantity),
       unitCostInCents = Value(unitCostInCents);
  static Insertable<FarmPurchaseItem> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<int>? purchaseId,
    Expression<int>? productId,
    Expression<double>? quantity,
    Expression<int>? unitCostInCents,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (purchaseId != null) 'purchase_id': purchaseId,
      if (productId != null) 'product_id': productId,
      if (quantity != null) 'quantity': quantity,
      if (unitCostInCents != null) 'unit_cost_in_cents': unitCostInCents,
    });
  }

  FarmPurchaseItemsCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<int>? purchaseId,
    Value<int>? productId,
    Value<double>? quantity,
    Value<int>? unitCostInCents,
  }) {
    return FarmPurchaseItemsCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      purchaseId: purchaseId ?? this.purchaseId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      unitCostInCents: unitCostInCents ?? this.unitCostInCents,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<int>(purchaseId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitCostInCents.present) {
      map['unit_cost_in_cents'] = Variable<int>(unitCostInCents.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmPurchaseItemsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('productId: $productId, ')
          ..write('quantity: $quantity, ')
          ..write('unitCostInCents: $unitCostInCents')
          ..write(')'))
        .toString();
  }
}

class $FarmAreasTable extends FarmAreas
    with TableInfo<$FarmAreasTable, FarmArea> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmAreasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeInHectaresMeta = const VerificationMeta(
    'sizeInHectares',
  );
  @override
  late final GeneratedColumn<double> sizeInHectares = GeneratedColumn<double>(
    'size_in_hectares',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    name,
    sizeInHectares,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_areas';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmArea> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('size_in_hectares')) {
      context.handle(
        _sizeInHectaresMeta,
        sizeInHectares.isAcceptableOrUnknown(
          data['size_in_hectares']!,
          _sizeInHectaresMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmArea map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmArea(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sizeInHectares: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}size_in_hectares'],
      ),
    );
  }

  @override
  $FarmAreasTable createAlias(String alias) {
    return $FarmAreasTable(attachedDatabase, alias);
  }
}

class FarmArea extends DataClass implements Insertable<FarmArea> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final String name;
  final double? sizeInHectares;
  const FarmArea({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.name,
    this.sizeInHectares,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || sizeInHectares != null) {
      map['size_in_hectares'] = Variable<double>(sizeInHectares);
    }
    return map;
  }

  FarmAreasCompanion toCompanion(bool nullToAbsent) {
    return FarmAreasCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      name: Value(name),
      sizeInHectares: sizeInHectares == null && nullToAbsent
          ? const Value.absent()
          : Value(sizeInHectares),
    );
  }

  factory FarmArea.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmArea(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sizeInHectares: serializer.fromJson<double?>(json['sizeInHectares']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'sizeInHectares': serializer.toJson<double?>(sizeInHectares),
    };
  }

  FarmArea copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    String? name,
    Value<double?> sizeInHectares = const Value.absent(),
  }) => FarmArea(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    name: name ?? this.name,
    sizeInHectares: sizeInHectares.present
        ? sizeInHectares.value
        : this.sizeInHectares,
  );
  FarmArea copyWithCompanion(FarmAreasCompanion data) {
    return FarmArea(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sizeInHectares: data.sizeInHectares.present
          ? data.sizeInHectares.value
          : this.sizeInHectares,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmArea(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sizeInHectares: $sizeInHectares')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    name,
    sizeInHectares,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmArea &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.name == this.name &&
          other.sizeInHectares == this.sizeInHectares);
}

class FarmAreasCompanion extends UpdateCompanion<FarmArea> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<String> name;
  final Value<double?> sizeInHectares;
  const FarmAreasCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sizeInHectares = const Value.absent(),
  });
  FarmAreasCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    this.sizeInHectares = const Value.absent(),
  }) : name = Value(name);
  static Insertable<FarmArea> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? sizeInHectares,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sizeInHectares != null) 'size_in_hectares': sizeInHectares,
    });
  }

  FarmAreasCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<String>? name,
    Value<double?>? sizeInHectares,
  }) {
    return FarmAreasCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      name: name ?? this.name,
      sizeInHectares: sizeInHectares ?? this.sizeInHectares,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sizeInHectares.present) {
      map['size_in_hectares'] = Variable<double>(sizeInHectares.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmAreasCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sizeInHectares: $sizeInHectares')
          ..write(')'))
        .toString();
  }
}

class $FarmProductionsTable extends FarmProductions
    with TableInfo<$FarmProductionsTable, FarmProduction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FarmProductionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => uuidGenerator.v4(),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES farm_products (id)',
    ),
  );
  static const VerificationMeta _productionAreaIdMeta = const VerificationMeta(
    'productionAreaId',
  );
  @override
  late final GeneratedColumn<int> productionAreaId = GeneratedColumn<int>(
    'production_area_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES farm_areas (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceInCentsMeta = const VerificationMeta(
    'unitPriceInCents',
  );
  @override
  late final GeneratedColumn<int> unitPriceInCents = GeneratedColumn<int>(
    'unit_price_in_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productionCostInCentsMeta =
      const VerificationMeta('productionCostInCents');
  @override
  late final GeneratedColumn<int> productionCostInCents = GeneratedColumn<int>(
    'production_cost_in_cents',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _harvestDateMeta = const VerificationMeta(
    'harvestDate',
  );
  @override
  late final GeneratedColumn<DateTime> harvestDate = GeneratedColumn<DateTime>(
    'harvest_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    productId,
    productionAreaId,
    quantity,
    unitPriceInCents,
    productionCostInCents,
    harvestDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'farm_productions';
  @override
  VerificationContext validateIntegrity(
    Insertable<FarmProduction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('production_area_id')) {
      context.handle(
        _productionAreaIdMeta,
        productionAreaId.isAcceptableOrUnknown(
          data['production_area_id']!,
          _productionAreaIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productionAreaIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price_in_cents')) {
      context.handle(
        _unitPriceInCentsMeta,
        unitPriceInCents.isAcceptableOrUnknown(
          data['unit_price_in_cents']!,
          _unitPriceInCentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceInCentsMeta);
    }
    if (data.containsKey('production_cost_in_cents')) {
      context.handle(
        _productionCostInCentsMeta,
        productionCostInCents.isAcceptableOrUnknown(
          data['production_cost_in_cents']!,
          _productionCostInCentsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productionCostInCentsMeta);
    }
    if (data.containsKey('harvest_date')) {
      context.handle(
        _harvestDateMeta,
        harvestDate.isAcceptableOrUnknown(
          data['harvest_date']!,
          _harvestDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_harvestDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FarmProduction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FarmProduction(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      productionAreaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}production_area_id'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      unitPriceInCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_in_cents'],
      )!,
      productionCostInCents: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}production_cost_in_cents'],
      )!,
      harvestDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}harvest_date'],
      )!,
    );
  }

  @override
  $FarmProductionsTable createAlias(String alias) {
    return $FarmProductionsTable(attachedDatabase, alias);
  }
}

class FarmProduction extends DataClass implements Insertable<FarmProduction> {
  final String uuid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDeleted;
  final int id;
  final int productId;
  final int productionAreaId;
  final double quantity;
  final int unitPriceInCents;
  final int productionCostInCents;
  final DateTime harvestDate;
  const FarmProduction({
    required this.uuid,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.id,
    required this.productId,
    required this.productionAreaId,
    required this.quantity,
    required this.unitPriceInCents,
    required this.productionCostInCents,
    required this.harvestDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['production_area_id'] = Variable<int>(productionAreaId);
    map['quantity'] = Variable<double>(quantity);
    map['unit_price_in_cents'] = Variable<int>(unitPriceInCents);
    map['production_cost_in_cents'] = Variable<int>(productionCostInCents);
    map['harvest_date'] = Variable<DateTime>(harvestDate);
    return map;
  }

  FarmProductionsCompanion toCompanion(bool nullToAbsent) {
    return FarmProductionsCompanion(
      uuid: Value(uuid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      id: Value(id),
      productId: Value(productId),
      productionAreaId: Value(productionAreaId),
      quantity: Value(quantity),
      unitPriceInCents: Value(unitPriceInCents),
      productionCostInCents: Value(productionCostInCents),
      harvestDate: Value(harvestDate),
    );
  }

  factory FarmProduction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FarmProduction(
      uuid: serializer.fromJson<String>(json['uuid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      productionAreaId: serializer.fromJson<int>(json['productionAreaId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitPriceInCents: serializer.fromJson<int>(json['unitPriceInCents']),
      productionCostInCents: serializer.fromJson<int>(
        json['productionCostInCents'],
      ),
      harvestDate: serializer.fromJson<DateTime>(json['harvestDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'productionAreaId': serializer.toJson<int>(productionAreaId),
      'quantity': serializer.toJson<double>(quantity),
      'unitPriceInCents': serializer.toJson<int>(unitPriceInCents),
      'productionCostInCents': serializer.toJson<int>(productionCostInCents),
      'harvestDate': serializer.toJson<DateTime>(harvestDate),
    };
  }

  FarmProduction copyWith({
    String? uuid,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isDeleted,
    int? id,
    int? productId,
    int? productionAreaId,
    double? quantity,
    int? unitPriceInCents,
    int? productionCostInCents,
    DateTime? harvestDate,
  }) => FarmProduction(
    uuid: uuid ?? this.uuid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    id: id ?? this.id,
    productId: productId ?? this.productId,
    productionAreaId: productionAreaId ?? this.productionAreaId,
    quantity: quantity ?? this.quantity,
    unitPriceInCents: unitPriceInCents ?? this.unitPriceInCents,
    productionCostInCents: productionCostInCents ?? this.productionCostInCents,
    harvestDate: harvestDate ?? this.harvestDate,
  );
  FarmProduction copyWithCompanion(FarmProductionsCompanion data) {
    return FarmProduction(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      productionAreaId: data.productionAreaId.present
          ? data.productionAreaId.value
          : this.productionAreaId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPriceInCents: data.unitPriceInCents.present
          ? data.unitPriceInCents.value
          : this.unitPriceInCents,
      productionCostInCents: data.productionCostInCents.present
          ? data.productionCostInCents.value
          : this.productionCostInCents,
      harvestDate: data.harvestDate.present
          ? data.harvestDate.value
          : this.harvestDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FarmProduction(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('productionAreaId: $productionAreaId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPriceInCents: $unitPriceInCents, ')
          ..write('productionCostInCents: $productionCostInCents, ')
          ..write('harvestDate: $harvestDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    createdAt,
    updatedAt,
    isDeleted,
    id,
    productId,
    productionAreaId,
    quantity,
    unitPriceInCents,
    productionCostInCents,
    harvestDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FarmProduction &&
          other.uuid == this.uuid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.productionAreaId == this.productionAreaId &&
          other.quantity == this.quantity &&
          other.unitPriceInCents == this.unitPriceInCents &&
          other.productionCostInCents == this.productionCostInCents &&
          other.harvestDate == this.harvestDate);
}

class FarmProductionsCompanion extends UpdateCompanion<FarmProduction> {
  final Value<String> uuid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  final Value<int> id;
  final Value<int> productId;
  final Value<int> productionAreaId;
  final Value<double> quantity;
  final Value<int> unitPriceInCents;
  final Value<int> productionCostInCents;
  final Value<DateTime> harvestDate;
  const FarmProductionsCompanion({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.productionAreaId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPriceInCents = const Value.absent(),
    this.productionCostInCents = const Value.absent(),
    this.harvestDate = const Value.absent(),
  });
  FarmProductionsCompanion.insert({
    this.uuid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.id = const Value.absent(),
    required int productId,
    required int productionAreaId,
    required double quantity,
    required int unitPriceInCents,
    required int productionCostInCents,
    required DateTime harvestDate,
  }) : productId = Value(productId),
       productionAreaId = Value(productionAreaId),
       quantity = Value(quantity),
       unitPriceInCents = Value(unitPriceInCents),
       productionCostInCents = Value(productionCostInCents),
       harvestDate = Value(harvestDate);
  static Insertable<FarmProduction> custom({
    Expression<String>? uuid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? productionAreaId,
    Expression<double>? quantity,
    Expression<int>? unitPriceInCents,
    Expression<int>? productionCostInCents,
    Expression<DateTime>? harvestDate,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (productionAreaId != null) 'production_area_id': productionAreaId,
      if (quantity != null) 'quantity': quantity,
      if (unitPriceInCents != null) 'unit_price_in_cents': unitPriceInCents,
      if (productionCostInCents != null)
        'production_cost_in_cents': productionCostInCents,
      if (harvestDate != null) 'harvest_date': harvestDate,
    });
  }

  FarmProductionsCompanion copyWith({
    Value<String>? uuid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isDeleted,
    Value<int>? id,
    Value<int>? productId,
    Value<int>? productionAreaId,
    Value<double>? quantity,
    Value<int>? unitPriceInCents,
    Value<int>? productionCostInCents,
    Value<DateTime>? harvestDate,
  }) {
    return FarmProductionsCompanion(
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productionAreaId: productionAreaId ?? this.productionAreaId,
      quantity: quantity ?? this.quantity,
      unitPriceInCents: unitPriceInCents ?? this.unitPriceInCents,
      productionCostInCents:
          productionCostInCents ?? this.productionCostInCents,
      harvestDate: harvestDate ?? this.harvestDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productionAreaId.present) {
      map['production_area_id'] = Variable<int>(productionAreaId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitPriceInCents.present) {
      map['unit_price_in_cents'] = Variable<int>(unitPriceInCents.value);
    }
    if (productionCostInCents.present) {
      map['production_cost_in_cents'] = Variable<int>(
        productionCostInCents.value,
      );
    }
    if (harvestDate.present) {
      map['harvest_date'] = Variable<DateTime>(harvestDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FarmProductionsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('productionAreaId: $productionAreaId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPriceInCents: $unitPriceInCents, ')
          ..write('productionCostInCents: $productionCostInCents, ')
          ..write('harvestDate: $harvestDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SimulationsTable simulations = $SimulationsTable(this);
  late final $FarmCategoriesTable farmCategories = $FarmCategoriesTable(this);
  late final $FarmProductsTable farmProducts = $FarmProductsTable(this);
  late final $FarmStockTable farmStock = $FarmStockTable(this);
  late final $FarmStockMovementsTable farmStockMovements =
      $FarmStockMovementsTable(this);
  late final $FarmSuppliersTable farmSuppliers = $FarmSuppliersTable(this);
  late final $FarmPurchasesTable farmPurchases = $FarmPurchasesTable(this);
  late final $FarmPurchaseItemsTable farmPurchaseItems =
      $FarmPurchaseItemsTable(this);
  late final $FarmAreasTable farmAreas = $FarmAreasTable(this);
  late final $FarmProductionsTable farmProductions = $FarmProductionsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    simulations,
    farmCategories,
    farmProducts,
    farmStock,
    farmStockMovements,
    farmSuppliers,
    farmPurchases,
    farmPurchaseItems,
    farmAreas,
    farmProductions,
  ];
}

typedef $$SimulationsTableCreateCompanionBuilder =
    SimulationsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required String producerName,
      required int principalAmountInCents,
      required int interestRateBasisPoints,
      required int periods,
      required int totalAmountInCents,
      Value<bool> isSynced,
    });
typedef $$SimulationsTableUpdateCompanionBuilder =
    SimulationsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<String> producerName,
      Value<int> principalAmountInCents,
      Value<int> interestRateBasisPoints,
      Value<int> periods,
      Value<int> totalAmountInCents,
      Value<bool> isSynced,
    });

class $$SimulationsTableFilterComposer
    extends Composer<_$AppDatabase, $SimulationsTable> {
  $$SimulationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get producerName => $composableBuilder(
    column: $table.producerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get principalAmountInCents => $composableBuilder(
    column: $table.principalAmountInCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get interestRateBasisPoints => $composableBuilder(
    column: $table.interestRateBasisPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get periods => $composableBuilder(
    column: $table.periods,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalAmountInCents => $composableBuilder(
    column: $table.totalAmountInCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SimulationsTableOrderingComposer
    extends Composer<_$AppDatabase, $SimulationsTable> {
  $$SimulationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get producerName => $composableBuilder(
    column: $table.producerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get principalAmountInCents => $composableBuilder(
    column: $table.principalAmountInCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get interestRateBasisPoints => $composableBuilder(
    column: $table.interestRateBasisPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get periods => $composableBuilder(
    column: $table.periods,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalAmountInCents => $composableBuilder(
    column: $table.totalAmountInCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SimulationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SimulationsTable> {
  $$SimulationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get producerName => $composableBuilder(
    column: $table.producerName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get principalAmountInCents => $composableBuilder(
    column: $table.principalAmountInCents,
    builder: (column) => column,
  );

  GeneratedColumn<int> get interestRateBasisPoints => $composableBuilder(
    column: $table.interestRateBasisPoints,
    builder: (column) => column,
  );

  GeneratedColumn<int> get periods =>
      $composableBuilder(column: $table.periods, builder: (column) => column);

  GeneratedColumn<int> get totalAmountInCents => $composableBuilder(
    column: $table.totalAmountInCents,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);
}

class $$SimulationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SimulationsTable,
          Simulation,
          $$SimulationsTableFilterComposer,
          $$SimulationsTableOrderingComposer,
          $$SimulationsTableAnnotationComposer,
          $$SimulationsTableCreateCompanionBuilder,
          $$SimulationsTableUpdateCompanionBuilder,
          (
            Simulation,
            BaseReferences<_$AppDatabase, $SimulationsTable, Simulation>,
          ),
          Simulation,
          PrefetchHooks Function()
        > {
  $$SimulationsTableTableManager(_$AppDatabase db, $SimulationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SimulationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SimulationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SimulationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> producerName = const Value.absent(),
                Value<int> principalAmountInCents = const Value.absent(),
                Value<int> interestRateBasisPoints = const Value.absent(),
                Value<int> periods = const Value.absent(),
                Value<int> totalAmountInCents = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
              }) => SimulationsCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                producerName: producerName,
                principalAmountInCents: principalAmountInCents,
                interestRateBasisPoints: interestRateBasisPoints,
                periods: periods,
                totalAmountInCents: totalAmountInCents,
                isSynced: isSynced,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String producerName,
                required int principalAmountInCents,
                required int interestRateBasisPoints,
                required int periods,
                required int totalAmountInCents,
                Value<bool> isSynced = const Value.absent(),
              }) => SimulationsCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                producerName: producerName,
                principalAmountInCents: principalAmountInCents,
                interestRateBasisPoints: interestRateBasisPoints,
                periods: periods,
                totalAmountInCents: totalAmountInCents,
                isSynced: isSynced,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SimulationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SimulationsTable,
      Simulation,
      $$SimulationsTableFilterComposer,
      $$SimulationsTableOrderingComposer,
      $$SimulationsTableAnnotationComposer,
      $$SimulationsTableCreateCompanionBuilder,
      $$SimulationsTableUpdateCompanionBuilder,
      (
        Simulation,
        BaseReferences<_$AppDatabase, $SimulationsTable, Simulation>,
      ),
      Simulation,
      PrefetchHooks Function()
    >;
typedef $$FarmCategoriesTableCreateCompanionBuilder =
    FarmCategoriesCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required String name,
    });
typedef $$FarmCategoriesTableUpdateCompanionBuilder =
    FarmCategoriesCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<String> name,
    });

final class $$FarmCategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $FarmCategoriesTable, FarmCategory> {
  $$FarmCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$FarmProductsTable, List<FarmProduct>>
  _farmProductsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.farmProducts,
    aliasName: $_aliasNameGenerator(
      db.farmCategories.id,
      db.farmProducts.categoryId,
    ),
  );

  $$FarmProductsTableProcessedTableManager get farmProductsRefs {
    final manager = $$FarmProductsTableTableManager(
      $_db,
      $_db.farmProducts,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_farmProductsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FarmCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $FarmCategoriesTable> {
  $$FarmCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> farmProductsRefs(
    Expression<bool> Function($$FarmProductsTableFilterComposer f) f,
  ) {
    final $$FarmProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableFilterComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmCategoriesTable> {
  $$FarmCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FarmCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmCategoriesTable> {
  $$FarmCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> farmProductsRefs<T extends Object>(
    Expression<T> Function($$FarmProductsTableAnnotationComposer a) f,
  ) {
    final $$FarmProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmCategoriesTable,
          FarmCategory,
          $$FarmCategoriesTableFilterComposer,
          $$FarmCategoriesTableOrderingComposer,
          $$FarmCategoriesTableAnnotationComposer,
          $$FarmCategoriesTableCreateCompanionBuilder,
          $$FarmCategoriesTableUpdateCompanionBuilder,
          (FarmCategory, $$FarmCategoriesTableReferences),
          FarmCategory,
          PrefetchHooks Function({bool farmProductsRefs})
        > {
  $$FarmCategoriesTableTableManager(
    _$AppDatabase db,
    $FarmCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => FarmCategoriesCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
              }) => FarmCategoriesCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({farmProductsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (farmProductsRefs) db.farmProducts],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (farmProductsRefs)
                    await $_getPrefetchedData<
                      FarmCategory,
                      $FarmCategoriesTable,
                      FarmProduct
                    >(
                      currentTable: table,
                      referencedTable: $$FarmCategoriesTableReferences
                          ._farmProductsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FarmCategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).farmProductsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FarmCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmCategoriesTable,
      FarmCategory,
      $$FarmCategoriesTableFilterComposer,
      $$FarmCategoriesTableOrderingComposer,
      $$FarmCategoriesTableAnnotationComposer,
      $$FarmCategoriesTableCreateCompanionBuilder,
      $$FarmCategoriesTableUpdateCompanionBuilder,
      (FarmCategory, $$FarmCategoriesTableReferences),
      FarmCategory,
      PrefetchHooks Function({bool farmProductsRefs})
    >;
typedef $$FarmProductsTableCreateCompanionBuilder =
    FarmProductsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required String name,
      required int categoryId,
      Value<String?> description,
      required String unit,
      required bool isProduction,
    });
typedef $$FarmProductsTableUpdateCompanionBuilder =
    FarmProductsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<String> name,
      Value<int> categoryId,
      Value<String?> description,
      Value<String> unit,
      Value<bool> isProduction,
    });

final class $$FarmProductsTableReferences
    extends BaseReferences<_$AppDatabase, $FarmProductsTable, FarmProduct> {
  $$FarmProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FarmCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.farmCategories.createAlias(
        $_aliasNameGenerator(db.farmProducts.categoryId, db.farmCategories.id),
      );

  $$FarmCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$FarmCategoriesTableTableManager(
      $_db,
      $_db.farmCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FarmStockTable, List<FarmStockData>>
  _farmStockRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.farmStock,
    aliasName: $_aliasNameGenerator(db.farmProducts.id, db.farmStock.productId),
  );

  $$FarmStockTableProcessedTableManager get farmStockRefs {
    final manager = $$FarmStockTableTableManager(
      $_db,
      $_db.farmStock,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_farmStockRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FarmPurchaseItemsTable, List<FarmPurchaseItem>>
  _farmPurchaseItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.farmPurchaseItems,
        aliasName: $_aliasNameGenerator(
          db.farmProducts.id,
          db.farmPurchaseItems.productId,
        ),
      );

  $$FarmPurchaseItemsTableProcessedTableManager get farmPurchaseItemsRefs {
    final manager = $$FarmPurchaseItemsTableTableManager(
      $_db,
      $_db.farmPurchaseItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _farmPurchaseItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FarmProductionsTable, List<FarmProduction>>
  _farmProductionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.farmProductions,
    aliasName: $_aliasNameGenerator(
      db.farmProducts.id,
      db.farmProductions.productId,
    ),
  );

  $$FarmProductionsTableProcessedTableManager get farmProductionsRefs {
    final manager = $$FarmProductionsTableTableManager(
      $_db,
      $_db.farmProductions,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _farmProductionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FarmProductsTableFilterComposer
    extends Composer<_$AppDatabase, $FarmProductsTable> {
  $$FarmProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isProduction => $composableBuilder(
    column: $table.isProduction,
    builder: (column) => ColumnFilters(column),
  );

  $$FarmCategoriesTableFilterComposer get categoryId {
    final $$FarmCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.farmCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.farmCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> farmStockRefs(
    Expression<bool> Function($$FarmStockTableFilterComposer f) f,
  ) {
    final $$FarmStockTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmStock,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmStockTableFilterComposer(
            $db: $db,
            $table: $db.farmStock,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> farmPurchaseItemsRefs(
    Expression<bool> Function($$FarmPurchaseItemsTableFilterComposer f) f,
  ) {
    final $$FarmPurchaseItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmPurchaseItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmPurchaseItemsTableFilterComposer(
            $db: $db,
            $table: $db.farmPurchaseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> farmProductionsRefs(
    Expression<bool> Function($$FarmProductionsTableFilterComposer f) f,
  ) {
    final $$FarmProductionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmProductions,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductionsTableFilterComposer(
            $db: $db,
            $table: $db.farmProductions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmProductsTable> {
  $$FarmProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isProduction => $composableBuilder(
    column: $table.isProduction,
    builder: (column) => ColumnOrderings(column),
  );

  $$FarmCategoriesTableOrderingComposer get categoryId {
    final $$FarmCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.farmCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.farmCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmProductsTable> {
  $$FarmProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<bool> get isProduction => $composableBuilder(
    column: $table.isProduction,
    builder: (column) => column,
  );

  $$FarmCategoriesTableAnnotationComposer get categoryId {
    final $$FarmCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.farmCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.farmCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> farmStockRefs<T extends Object>(
    Expression<T> Function($$FarmStockTableAnnotationComposer a) f,
  ) {
    final $$FarmStockTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmStock,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmStockTableAnnotationComposer(
            $db: $db,
            $table: $db.farmStock,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> farmPurchaseItemsRefs<T extends Object>(
    Expression<T> Function($$FarmPurchaseItemsTableAnnotationComposer a) f,
  ) {
    final $$FarmPurchaseItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.farmPurchaseItems,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FarmPurchaseItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.farmPurchaseItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> farmProductionsRefs<T extends Object>(
    Expression<T> Function($$FarmProductionsTableAnnotationComposer a) f,
  ) {
    final $$FarmProductionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmProductions,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductionsTableAnnotationComposer(
            $db: $db,
            $table: $db.farmProductions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmProductsTable,
          FarmProduct,
          $$FarmProductsTableFilterComposer,
          $$FarmProductsTableOrderingComposer,
          $$FarmProductsTableAnnotationComposer,
          $$FarmProductsTableCreateCompanionBuilder,
          $$FarmProductsTableUpdateCompanionBuilder,
          (FarmProduct, $$FarmProductsTableReferences),
          FarmProduct,
          PrefetchHooks Function({
            bool categoryId,
            bool farmStockRefs,
            bool farmPurchaseItemsRefs,
            bool farmProductionsRefs,
          })
        > {
  $$FarmProductsTableTableManager(_$AppDatabase db, $FarmProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<bool> isProduction = const Value.absent(),
              }) => FarmProductsCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                name: name,
                categoryId: categoryId,
                description: description,
                unit: unit,
                isProduction: isProduction,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                required int categoryId,
                Value<String?> description = const Value.absent(),
                required String unit,
                required bool isProduction,
              }) => FarmProductsCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                name: name,
                categoryId: categoryId,
                description: description,
                unit: unit,
                isProduction: isProduction,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                categoryId = false,
                farmStockRefs = false,
                farmPurchaseItemsRefs = false,
                farmProductionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (farmStockRefs) db.farmStock,
                    if (farmPurchaseItemsRefs) db.farmPurchaseItems,
                    if (farmProductionsRefs) db.farmProductions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable:
                                        $$FarmProductsTableReferences
                                            ._categoryIdTable(db),
                                    referencedColumn:
                                        $$FarmProductsTableReferences
                                            ._categoryIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (farmStockRefs)
                        await $_getPrefetchedData<
                          FarmProduct,
                          $FarmProductsTable,
                          FarmStockData
                        >(
                          currentTable: table,
                          referencedTable: $$FarmProductsTableReferences
                              ._farmStockRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FarmProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).farmStockRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (farmPurchaseItemsRefs)
                        await $_getPrefetchedData<
                          FarmProduct,
                          $FarmProductsTable,
                          FarmPurchaseItem
                        >(
                          currentTable: table,
                          referencedTable: $$FarmProductsTableReferences
                              ._farmPurchaseItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FarmProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).farmPurchaseItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (farmProductionsRefs)
                        await $_getPrefetchedData<
                          FarmProduct,
                          $FarmProductsTable,
                          FarmProduction
                        >(
                          currentTable: table,
                          referencedTable: $$FarmProductsTableReferences
                              ._farmProductionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FarmProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).farmProductionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FarmProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmProductsTable,
      FarmProduct,
      $$FarmProductsTableFilterComposer,
      $$FarmProductsTableOrderingComposer,
      $$FarmProductsTableAnnotationComposer,
      $$FarmProductsTableCreateCompanionBuilder,
      $$FarmProductsTableUpdateCompanionBuilder,
      (FarmProduct, $$FarmProductsTableReferences),
      FarmProduct,
      PrefetchHooks Function({
        bool categoryId,
        bool farmStockRefs,
        bool farmPurchaseItemsRefs,
        bool farmProductionsRefs,
      })
    >;
typedef $$FarmStockTableCreateCompanionBuilder =
    FarmStockCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required int productId,
      required double quantity,
      Value<double?> minimumStock,
      Value<String?> location,
      Value<String?> lotNumber,
      Value<DateTime?> expirationDate,
    });
typedef $$FarmStockTableUpdateCompanionBuilder =
    FarmStockCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<int> productId,
      Value<double> quantity,
      Value<double?> minimumStock,
      Value<String?> location,
      Value<String?> lotNumber,
      Value<DateTime?> expirationDate,
    });

final class $$FarmStockTableReferences
    extends BaseReferences<_$AppDatabase, $FarmStockTable, FarmStockData> {
  $$FarmStockTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FarmProductsTable _productIdTable(_$AppDatabase db) =>
      db.farmProducts.createAlias(
        $_aliasNameGenerator(db.farmStock.productId, db.farmProducts.id),
      );

  $$FarmProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$FarmProductsTableTableManager(
      $_db,
      $_db.farmProducts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FarmStockMovementsTable, List<FarmStockMovement>>
  _farmStockMovementsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.farmStockMovements,
        aliasName: $_aliasNameGenerator(
          db.farmStock.id,
          db.farmStockMovements.stockId,
        ),
      );

  $$FarmStockMovementsTableProcessedTableManager get farmStockMovementsRefs {
    final manager = $$FarmStockMovementsTableTableManager(
      $_db,
      $_db.farmStockMovements,
    ).filter((f) => f.stockId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _farmStockMovementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FarmStockTableFilterComposer
    extends Composer<_$AppDatabase, $FarmStockTable> {
  $$FarmStockTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minimumStock => $composableBuilder(
    column: $table.minimumStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lotNumber => $composableBuilder(
    column: $table.lotNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => ColumnFilters(column),
  );

  $$FarmProductsTableFilterComposer get productId {
    final $$FarmProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableFilterComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> farmStockMovementsRefs(
    Expression<bool> Function($$FarmStockMovementsTableFilterComposer f) f,
  ) {
    final $$FarmStockMovementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmStockMovements,
      getReferencedColumn: (t) => t.stockId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmStockMovementsTableFilterComposer(
            $db: $db,
            $table: $db.farmStockMovements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmStockTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmStockTable> {
  $$FarmStockTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minimumStock => $composableBuilder(
    column: $table.minimumStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lotNumber => $composableBuilder(
    column: $table.lotNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$FarmProductsTableOrderingComposer get productId {
    final $$FarmProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableOrderingComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmStockTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmStockTable> {
  $$FarmStockTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get minimumStock => $composableBuilder(
    column: $table.minimumStock,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get lotNumber =>
      $composableBuilder(column: $table.lotNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => column,
  );

  $$FarmProductsTableAnnotationComposer get productId {
    final $$FarmProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> farmStockMovementsRefs<T extends Object>(
    Expression<T> Function($$FarmStockMovementsTableAnnotationComposer a) f,
  ) {
    final $$FarmStockMovementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.farmStockMovements,
          getReferencedColumn: (t) => t.stockId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FarmStockMovementsTableAnnotationComposer(
                $db: $db,
                $table: $db.farmStockMovements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$FarmStockTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmStockTable,
          FarmStockData,
          $$FarmStockTableFilterComposer,
          $$FarmStockTableOrderingComposer,
          $$FarmStockTableAnnotationComposer,
          $$FarmStockTableCreateCompanionBuilder,
          $$FarmStockTableUpdateCompanionBuilder,
          (FarmStockData, $$FarmStockTableReferences),
          FarmStockData,
          PrefetchHooks Function({bool productId, bool farmStockMovementsRefs})
        > {
  $$FarmStockTableTableManager(_$AppDatabase db, $FarmStockTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmStockTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmStockTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmStockTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double?> minimumStock = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> lotNumber = const Value.absent(),
                Value<DateTime?> expirationDate = const Value.absent(),
              }) => FarmStockCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                productId: productId,
                quantity: quantity,
                minimumStock: minimumStock,
                location: location,
                lotNumber: lotNumber,
                expirationDate: expirationDate,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int productId,
                required double quantity,
                Value<double?> minimumStock = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> lotNumber = const Value.absent(),
                Value<DateTime?> expirationDate = const Value.absent(),
              }) => FarmStockCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                productId: productId,
                quantity: quantity,
                minimumStock: minimumStock,
                location: location,
                lotNumber: lotNumber,
                expirationDate: expirationDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmStockTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productId = false, farmStockMovementsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (farmStockMovementsRefs) db.farmStockMovements,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable: $$FarmStockTableReferences
                                        ._productIdTable(db),
                                    referencedColumn: $$FarmStockTableReferences
                                        ._productIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (farmStockMovementsRefs)
                        await $_getPrefetchedData<
                          FarmStockData,
                          $FarmStockTable,
                          FarmStockMovement
                        >(
                          currentTable: table,
                          referencedTable: $$FarmStockTableReferences
                              ._farmStockMovementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FarmStockTableReferences(
                                db,
                                table,
                                p0,
                              ).farmStockMovementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stockId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FarmStockTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmStockTable,
      FarmStockData,
      $$FarmStockTableFilterComposer,
      $$FarmStockTableOrderingComposer,
      $$FarmStockTableAnnotationComposer,
      $$FarmStockTableCreateCompanionBuilder,
      $$FarmStockTableUpdateCompanionBuilder,
      (FarmStockData, $$FarmStockTableReferences),
      FarmStockData,
      PrefetchHooks Function({bool productId, bool farmStockMovementsRefs})
    >;
typedef $$FarmStockMovementsTableCreateCompanionBuilder =
    FarmStockMovementsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required int stockId,
      required StockMovementType type,
      required double quantity,
      Value<int?> unitCostInCents,
      Value<String?> referenceType,
      Value<String?> referenceId,
    });
typedef $$FarmStockMovementsTableUpdateCompanionBuilder =
    FarmStockMovementsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<int> stockId,
      Value<StockMovementType> type,
      Value<double> quantity,
      Value<int?> unitCostInCents,
      Value<String?> referenceType,
      Value<String?> referenceId,
    });

final class $$FarmStockMovementsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FarmStockMovementsTable,
          FarmStockMovement
        > {
  $$FarmStockMovementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FarmStockTable _stockIdTable(_$AppDatabase db) =>
      db.farmStock.createAlias(
        $_aliasNameGenerator(db.farmStockMovements.stockId, db.farmStock.id),
      );

  $$FarmStockTableProcessedTableManager get stockId {
    final $_column = $_itemColumn<int>('stock_id')!;

    final manager = $$FarmStockTableTableManager(
      $_db,
      $_db.farmStock,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stockIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FarmStockMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $FarmStockMovementsTable> {
  $$FarmStockMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<StockMovementType, StockMovementType, int>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCostInCents => $composableBuilder(
    column: $table.unitCostInCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referenceType => $composableBuilder(
    column: $table.referenceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => ColumnFilters(column),
  );

  $$FarmStockTableFilterComposer get stockId {
    final $$FarmStockTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stockId,
      referencedTable: $db.farmStock,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmStockTableFilterComposer(
            $db: $db,
            $table: $db.farmStock,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmStockMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmStockMovementsTable> {
  $$FarmStockMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCostInCents => $composableBuilder(
    column: $table.unitCostInCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceType => $composableBuilder(
    column: $table.referenceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => ColumnOrderings(column),
  );

  $$FarmStockTableOrderingComposer get stockId {
    final $$FarmStockTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stockId,
      referencedTable: $db.farmStock,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmStockTableOrderingComposer(
            $db: $db,
            $table: $db.farmStock,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmStockMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmStockMovementsTable> {
  $$FarmStockMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<StockMovementType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitCostInCents => $composableBuilder(
    column: $table.unitCostInCents,
    builder: (column) => column,
  );

  GeneratedColumn<String> get referenceType => $composableBuilder(
    column: $table.referenceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => column,
  );

  $$FarmStockTableAnnotationComposer get stockId {
    final $$FarmStockTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stockId,
      referencedTable: $db.farmStock,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmStockTableAnnotationComposer(
            $db: $db,
            $table: $db.farmStock,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmStockMovementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmStockMovementsTable,
          FarmStockMovement,
          $$FarmStockMovementsTableFilterComposer,
          $$FarmStockMovementsTableOrderingComposer,
          $$FarmStockMovementsTableAnnotationComposer,
          $$FarmStockMovementsTableCreateCompanionBuilder,
          $$FarmStockMovementsTableUpdateCompanionBuilder,
          (FarmStockMovement, $$FarmStockMovementsTableReferences),
          FarmStockMovement,
          PrefetchHooks Function({bool stockId})
        > {
  $$FarmStockMovementsTableTableManager(
    _$AppDatabase db,
    $FarmStockMovementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmStockMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmStockMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmStockMovementsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> stockId = const Value.absent(),
                Value<StockMovementType> type = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<int?> unitCostInCents = const Value.absent(),
                Value<String?> referenceType = const Value.absent(),
                Value<String?> referenceId = const Value.absent(),
              }) => FarmStockMovementsCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                stockId: stockId,
                type: type,
                quantity: quantity,
                unitCostInCents: unitCostInCents,
                referenceType: referenceType,
                referenceId: referenceId,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int stockId,
                required StockMovementType type,
                required double quantity,
                Value<int?> unitCostInCents = const Value.absent(),
                Value<String?> referenceType = const Value.absent(),
                Value<String?> referenceId = const Value.absent(),
              }) => FarmStockMovementsCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                stockId: stockId,
                type: type,
                quantity: quantity,
                unitCostInCents: unitCostInCents,
                referenceType: referenceType,
                referenceId: referenceId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmStockMovementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({stockId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (stockId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.stockId,
                                referencedTable:
                                    $$FarmStockMovementsTableReferences
                                        ._stockIdTable(db),
                                referencedColumn:
                                    $$FarmStockMovementsTableReferences
                                        ._stockIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FarmStockMovementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmStockMovementsTable,
      FarmStockMovement,
      $$FarmStockMovementsTableFilterComposer,
      $$FarmStockMovementsTableOrderingComposer,
      $$FarmStockMovementsTableAnnotationComposer,
      $$FarmStockMovementsTableCreateCompanionBuilder,
      $$FarmStockMovementsTableUpdateCompanionBuilder,
      (FarmStockMovement, $$FarmStockMovementsTableReferences),
      FarmStockMovement,
      PrefetchHooks Function({bool stockId})
    >;
typedef $$FarmSuppliersTableCreateCompanionBuilder =
    FarmSuppliersCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required String name,
      Value<String?> contactInfo,
    });
typedef $$FarmSuppliersTableUpdateCompanionBuilder =
    FarmSuppliersCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<String> name,
      Value<String?> contactInfo,
    });

final class $$FarmSuppliersTableReferences
    extends BaseReferences<_$AppDatabase, $FarmSuppliersTable, FarmSupplier> {
  $$FarmSuppliersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$FarmPurchasesTable, List<FarmPurchase>>
  _farmPurchasesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.farmPurchases,
    aliasName: $_aliasNameGenerator(
      db.farmSuppliers.id,
      db.farmPurchases.supplierId,
    ),
  );

  $$FarmPurchasesTableProcessedTableManager get farmPurchasesRefs {
    final manager = $$FarmPurchasesTableTableManager(
      $_db,
      $_db.farmPurchases,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_farmPurchasesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FarmSuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $FarmSuppliersTable> {
  $$FarmSuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> farmPurchasesRefs(
    Expression<bool> Function($$FarmPurchasesTableFilterComposer f) f,
  ) {
    final $$FarmPurchasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmPurchases,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmPurchasesTableFilterComposer(
            $db: $db,
            $table: $db.farmPurchases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmSuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmSuppliersTable> {
  $$FarmSuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FarmSuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmSuppliersTable> {
  $$FarmSuppliersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get contactInfo => $composableBuilder(
    column: $table.contactInfo,
    builder: (column) => column,
  );

  Expression<T> farmPurchasesRefs<T extends Object>(
    Expression<T> Function($$FarmPurchasesTableAnnotationComposer a) f,
  ) {
    final $$FarmPurchasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmPurchases,
      getReferencedColumn: (t) => t.supplierId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmPurchasesTableAnnotationComposer(
            $db: $db,
            $table: $db.farmPurchases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmSuppliersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmSuppliersTable,
          FarmSupplier,
          $$FarmSuppliersTableFilterComposer,
          $$FarmSuppliersTableOrderingComposer,
          $$FarmSuppliersTableAnnotationComposer,
          $$FarmSuppliersTableCreateCompanionBuilder,
          $$FarmSuppliersTableUpdateCompanionBuilder,
          (FarmSupplier, $$FarmSuppliersTableReferences),
          FarmSupplier,
          PrefetchHooks Function({bool farmPurchasesRefs})
        > {
  $$FarmSuppliersTableTableManager(_$AppDatabase db, $FarmSuppliersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmSuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmSuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmSuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> contactInfo = const Value.absent(),
              }) => FarmSuppliersCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                name: name,
                contactInfo: contactInfo,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> contactInfo = const Value.absent(),
              }) => FarmSuppliersCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                name: name,
                contactInfo: contactInfo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmSuppliersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({farmPurchasesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (farmPurchasesRefs) db.farmPurchases,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (farmPurchasesRefs)
                    await $_getPrefetchedData<
                      FarmSupplier,
                      $FarmSuppliersTable,
                      FarmPurchase
                    >(
                      currentTable: table,
                      referencedTable: $$FarmSuppliersTableReferences
                          ._farmPurchasesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FarmSuppliersTableReferences(
                            db,
                            table,
                            p0,
                          ).farmPurchasesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.supplierId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FarmSuppliersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmSuppliersTable,
      FarmSupplier,
      $$FarmSuppliersTableFilterComposer,
      $$FarmSuppliersTableOrderingComposer,
      $$FarmSuppliersTableAnnotationComposer,
      $$FarmSuppliersTableCreateCompanionBuilder,
      $$FarmSuppliersTableUpdateCompanionBuilder,
      (FarmSupplier, $$FarmSuppliersTableReferences),
      FarmSupplier,
      PrefetchHooks Function({bool farmPurchasesRefs})
    >;
typedef $$FarmPurchasesTableCreateCompanionBuilder =
    FarmPurchasesCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required int supplierId,
      required DateTime purchaseDate,
      required int totalValueInCents,
      Value<DateTime?> dueDate,
      Value<bool> isPaid,
      Value<DateTime?> paymentDate,
      Value<String?> description,
    });
typedef $$FarmPurchasesTableUpdateCompanionBuilder =
    FarmPurchasesCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<int> supplierId,
      Value<DateTime> purchaseDate,
      Value<int> totalValueInCents,
      Value<DateTime?> dueDate,
      Value<bool> isPaid,
      Value<DateTime?> paymentDate,
      Value<String?> description,
    });

final class $$FarmPurchasesTableReferences
    extends BaseReferences<_$AppDatabase, $FarmPurchasesTable, FarmPurchase> {
  $$FarmPurchasesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FarmSuppliersTable _supplierIdTable(_$AppDatabase db) =>
      db.farmSuppliers.createAlias(
        $_aliasNameGenerator(db.farmPurchases.supplierId, db.farmSuppliers.id),
      );

  $$FarmSuppliersTableProcessedTableManager get supplierId {
    final $_column = $_itemColumn<int>('supplier_id')!;

    final manager = $$FarmSuppliersTableTableManager(
      $_db,
      $_db.farmSuppliers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$FarmPurchaseItemsTable, List<FarmPurchaseItem>>
  _farmPurchaseItemsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.farmPurchaseItems,
        aliasName: $_aliasNameGenerator(
          db.farmPurchases.id,
          db.farmPurchaseItems.purchaseId,
        ),
      );

  $$FarmPurchaseItemsTableProcessedTableManager get farmPurchaseItemsRefs {
    final manager = $$FarmPurchaseItemsTableTableManager(
      $_db,
      $_db.farmPurchaseItems,
    ).filter((f) => f.purchaseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _farmPurchaseItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FarmPurchasesTableFilterComposer
    extends Composer<_$AppDatabase, $FarmPurchasesTable> {
  $$FarmPurchasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalValueInCents => $composableBuilder(
    column: $table.totalValueInCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPaid => $composableBuilder(
    column: $table.isPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$FarmSuppliersTableFilterComposer get supplierId {
    final $$FarmSuppliersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.farmSuppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmSuppliersTableFilterComposer(
            $db: $db,
            $table: $db.farmSuppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> farmPurchaseItemsRefs(
    Expression<bool> Function($$FarmPurchaseItemsTableFilterComposer f) f,
  ) {
    final $$FarmPurchaseItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmPurchaseItems,
      getReferencedColumn: (t) => t.purchaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmPurchaseItemsTableFilterComposer(
            $db: $db,
            $table: $db.farmPurchaseItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmPurchasesTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmPurchasesTable> {
  $$FarmPurchasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalValueInCents => $composableBuilder(
    column: $table.totalValueInCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPaid => $composableBuilder(
    column: $table.isPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$FarmSuppliersTableOrderingComposer get supplierId {
    final $$FarmSuppliersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.farmSuppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmSuppliersTableOrderingComposer(
            $db: $db,
            $table: $db.farmSuppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmPurchasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmPurchasesTable> {
  $$FarmPurchasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalValueInCents => $composableBuilder(
    column: $table.totalValueInCents,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<bool> get isPaid =>
      $composableBuilder(column: $table.isPaid, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
    column: $table.paymentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$FarmSuppliersTableAnnotationComposer get supplierId {
    final $$FarmSuppliersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.farmSuppliers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmSuppliersTableAnnotationComposer(
            $db: $db,
            $table: $db.farmSuppliers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> farmPurchaseItemsRefs<T extends Object>(
    Expression<T> Function($$FarmPurchaseItemsTableAnnotationComposer a) f,
  ) {
    final $$FarmPurchaseItemsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.farmPurchaseItems,
          getReferencedColumn: (t) => t.purchaseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FarmPurchaseItemsTableAnnotationComposer(
                $db: $db,
                $table: $db.farmPurchaseItems,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$FarmPurchasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmPurchasesTable,
          FarmPurchase,
          $$FarmPurchasesTableFilterComposer,
          $$FarmPurchasesTableOrderingComposer,
          $$FarmPurchasesTableAnnotationComposer,
          $$FarmPurchasesTableCreateCompanionBuilder,
          $$FarmPurchasesTableUpdateCompanionBuilder,
          (FarmPurchase, $$FarmPurchasesTableReferences),
          FarmPurchase,
          PrefetchHooks Function({bool supplierId, bool farmPurchaseItemsRefs})
        > {
  $$FarmPurchasesTableTableManager(_$AppDatabase db, $FarmPurchasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmPurchasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmPurchasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmPurchasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> supplierId = const Value.absent(),
                Value<DateTime> purchaseDate = const Value.absent(),
                Value<int> totalValueInCents = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<bool> isPaid = const Value.absent(),
                Value<DateTime?> paymentDate = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => FarmPurchasesCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                supplierId: supplierId,
                purchaseDate: purchaseDate,
                totalValueInCents: totalValueInCents,
                dueDate: dueDate,
                isPaid: isPaid,
                paymentDate: paymentDate,
                description: description,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int supplierId,
                required DateTime purchaseDate,
                required int totalValueInCents,
                Value<DateTime?> dueDate = const Value.absent(),
                Value<bool> isPaid = const Value.absent(),
                Value<DateTime?> paymentDate = const Value.absent(),
                Value<String?> description = const Value.absent(),
              }) => FarmPurchasesCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                supplierId: supplierId,
                purchaseDate: purchaseDate,
                totalValueInCents: totalValueInCents,
                dueDate: dueDate,
                isPaid: isPaid,
                paymentDate: paymentDate,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmPurchasesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({supplierId = false, farmPurchaseItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (farmPurchaseItemsRefs) db.farmPurchaseItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (supplierId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.supplierId,
                                    referencedTable:
                                        $$FarmPurchasesTableReferences
                                            ._supplierIdTable(db),
                                    referencedColumn:
                                        $$FarmPurchasesTableReferences
                                            ._supplierIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (farmPurchaseItemsRefs)
                        await $_getPrefetchedData<
                          FarmPurchase,
                          $FarmPurchasesTable,
                          FarmPurchaseItem
                        >(
                          currentTable: table,
                          referencedTable: $$FarmPurchasesTableReferences
                              ._farmPurchaseItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FarmPurchasesTableReferences(
                                db,
                                table,
                                p0,
                              ).farmPurchaseItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.purchaseId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FarmPurchasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmPurchasesTable,
      FarmPurchase,
      $$FarmPurchasesTableFilterComposer,
      $$FarmPurchasesTableOrderingComposer,
      $$FarmPurchasesTableAnnotationComposer,
      $$FarmPurchasesTableCreateCompanionBuilder,
      $$FarmPurchasesTableUpdateCompanionBuilder,
      (FarmPurchase, $$FarmPurchasesTableReferences),
      FarmPurchase,
      PrefetchHooks Function({bool supplierId, bool farmPurchaseItemsRefs})
    >;
typedef $$FarmPurchaseItemsTableCreateCompanionBuilder =
    FarmPurchaseItemsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required int purchaseId,
      required int productId,
      required double quantity,
      required int unitCostInCents,
    });
typedef $$FarmPurchaseItemsTableUpdateCompanionBuilder =
    FarmPurchaseItemsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<int> purchaseId,
      Value<int> productId,
      Value<double> quantity,
      Value<int> unitCostInCents,
    });

final class $$FarmPurchaseItemsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FarmPurchaseItemsTable,
          FarmPurchaseItem
        > {
  $$FarmPurchaseItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FarmPurchasesTable _purchaseIdTable(_$AppDatabase db) =>
      db.farmPurchases.createAlias(
        $_aliasNameGenerator(
          db.farmPurchaseItems.purchaseId,
          db.farmPurchases.id,
        ),
      );

  $$FarmPurchasesTableProcessedTableManager get purchaseId {
    final $_column = $_itemColumn<int>('purchase_id')!;

    final manager = $$FarmPurchasesTableTableManager(
      $_db,
      $_db.farmPurchases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_purchaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FarmProductsTable _productIdTable(_$AppDatabase db) =>
      db.farmProducts.createAlias(
        $_aliasNameGenerator(
          db.farmPurchaseItems.productId,
          db.farmProducts.id,
        ),
      );

  $$FarmProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$FarmProductsTableTableManager(
      $_db,
      $_db.farmProducts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FarmPurchaseItemsTableFilterComposer
    extends Composer<_$AppDatabase, $FarmPurchaseItemsTable> {
  $$FarmPurchaseItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitCostInCents => $composableBuilder(
    column: $table.unitCostInCents,
    builder: (column) => ColumnFilters(column),
  );

  $$FarmPurchasesTableFilterComposer get purchaseId {
    final $$FarmPurchasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.purchaseId,
      referencedTable: $db.farmPurchases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmPurchasesTableFilterComposer(
            $db: $db,
            $table: $db.farmPurchases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FarmProductsTableFilterComposer get productId {
    final $$FarmProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableFilterComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmPurchaseItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmPurchaseItemsTable> {
  $$FarmPurchaseItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitCostInCents => $composableBuilder(
    column: $table.unitCostInCents,
    builder: (column) => ColumnOrderings(column),
  );

  $$FarmPurchasesTableOrderingComposer get purchaseId {
    final $$FarmPurchasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.purchaseId,
      referencedTable: $db.farmPurchases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmPurchasesTableOrderingComposer(
            $db: $db,
            $table: $db.farmPurchases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FarmProductsTableOrderingComposer get productId {
    final $$FarmProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableOrderingComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmPurchaseItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmPurchaseItemsTable> {
  $$FarmPurchaseItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitCostInCents => $composableBuilder(
    column: $table.unitCostInCents,
    builder: (column) => column,
  );

  $$FarmPurchasesTableAnnotationComposer get purchaseId {
    final $$FarmPurchasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.purchaseId,
      referencedTable: $db.farmPurchases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmPurchasesTableAnnotationComposer(
            $db: $db,
            $table: $db.farmPurchases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FarmProductsTableAnnotationComposer get productId {
    final $$FarmProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmPurchaseItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmPurchaseItemsTable,
          FarmPurchaseItem,
          $$FarmPurchaseItemsTableFilterComposer,
          $$FarmPurchaseItemsTableOrderingComposer,
          $$FarmPurchaseItemsTableAnnotationComposer,
          $$FarmPurchaseItemsTableCreateCompanionBuilder,
          $$FarmPurchaseItemsTableUpdateCompanionBuilder,
          (FarmPurchaseItem, $$FarmPurchaseItemsTableReferences),
          FarmPurchaseItem,
          PrefetchHooks Function({bool purchaseId, bool productId})
        > {
  $$FarmPurchaseItemsTableTableManager(
    _$AppDatabase db,
    $FarmPurchaseItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmPurchaseItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmPurchaseItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmPurchaseItemsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> purchaseId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<int> unitCostInCents = const Value.absent(),
              }) => FarmPurchaseItemsCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                purchaseId: purchaseId,
                productId: productId,
                quantity: quantity,
                unitCostInCents: unitCostInCents,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int purchaseId,
                required int productId,
                required double quantity,
                required int unitCostInCents,
              }) => FarmPurchaseItemsCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                purchaseId: purchaseId,
                productId: productId,
                quantity: quantity,
                unitCostInCents: unitCostInCents,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmPurchaseItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({purchaseId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (purchaseId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.purchaseId,
                                referencedTable:
                                    $$FarmPurchaseItemsTableReferences
                                        ._purchaseIdTable(db),
                                referencedColumn:
                                    $$FarmPurchaseItemsTableReferences
                                        ._purchaseIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$FarmPurchaseItemsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$FarmPurchaseItemsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FarmPurchaseItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmPurchaseItemsTable,
      FarmPurchaseItem,
      $$FarmPurchaseItemsTableFilterComposer,
      $$FarmPurchaseItemsTableOrderingComposer,
      $$FarmPurchaseItemsTableAnnotationComposer,
      $$FarmPurchaseItemsTableCreateCompanionBuilder,
      $$FarmPurchaseItemsTableUpdateCompanionBuilder,
      (FarmPurchaseItem, $$FarmPurchaseItemsTableReferences),
      FarmPurchaseItem,
      PrefetchHooks Function({bool purchaseId, bool productId})
    >;
typedef $$FarmAreasTableCreateCompanionBuilder =
    FarmAreasCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required String name,
      Value<double?> sizeInHectares,
    });
typedef $$FarmAreasTableUpdateCompanionBuilder =
    FarmAreasCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<String> name,
      Value<double?> sizeInHectares,
    });

final class $$FarmAreasTableReferences
    extends BaseReferences<_$AppDatabase, $FarmAreasTable, FarmArea> {
  $$FarmAreasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FarmProductionsTable, List<FarmProduction>>
  _farmProductionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.farmProductions,
    aliasName: $_aliasNameGenerator(
      db.farmAreas.id,
      db.farmProductions.productionAreaId,
    ),
  );

  $$FarmProductionsTableProcessedTableManager get farmProductionsRefs {
    final manager = $$FarmProductionsTableTableManager(
      $_db,
      $_db.farmProductions,
    ).filter((f) => f.productionAreaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _farmProductionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FarmAreasTableFilterComposer
    extends Composer<_$AppDatabase, $FarmAreasTable> {
  $$FarmAreasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sizeInHectares => $composableBuilder(
    column: $table.sizeInHectares,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> farmProductionsRefs(
    Expression<bool> Function($$FarmProductionsTableFilterComposer f) f,
  ) {
    final $$FarmProductionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmProductions,
      getReferencedColumn: (t) => t.productionAreaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductionsTableFilterComposer(
            $db: $db,
            $table: $db.farmProductions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmAreasTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmAreasTable> {
  $$FarmAreasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sizeInHectares => $composableBuilder(
    column: $table.sizeInHectares,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FarmAreasTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmAreasTable> {
  $$FarmAreasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get sizeInHectares => $composableBuilder(
    column: $table.sizeInHectares,
    builder: (column) => column,
  );

  Expression<T> farmProductionsRefs<T extends Object>(
    Expression<T> Function($$FarmProductionsTableAnnotationComposer a) f,
  ) {
    final $$FarmProductionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.farmProductions,
      getReferencedColumn: (t) => t.productionAreaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductionsTableAnnotationComposer(
            $db: $db,
            $table: $db.farmProductions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FarmAreasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmAreasTable,
          FarmArea,
          $$FarmAreasTableFilterComposer,
          $$FarmAreasTableOrderingComposer,
          $$FarmAreasTableAnnotationComposer,
          $$FarmAreasTableCreateCompanionBuilder,
          $$FarmAreasTableUpdateCompanionBuilder,
          (FarmArea, $$FarmAreasTableReferences),
          FarmArea,
          PrefetchHooks Function({bool farmProductionsRefs})
        > {
  $$FarmAreasTableTableManager(_$AppDatabase db, $FarmAreasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmAreasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmAreasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmAreasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> sizeInHectares = const Value.absent(),
              }) => FarmAreasCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                name: name,
                sizeInHectares: sizeInHectares,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                Value<double?> sizeInHectares = const Value.absent(),
              }) => FarmAreasCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                name: name,
                sizeInHectares: sizeInHectares,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmAreasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({farmProductionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (farmProductionsRefs) db.farmProductions,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (farmProductionsRefs)
                    await $_getPrefetchedData<
                      FarmArea,
                      $FarmAreasTable,
                      FarmProduction
                    >(
                      currentTable: table,
                      referencedTable: $$FarmAreasTableReferences
                          ._farmProductionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FarmAreasTableReferences(
                            db,
                            table,
                            p0,
                          ).farmProductionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.productionAreaId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FarmAreasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmAreasTable,
      FarmArea,
      $$FarmAreasTableFilterComposer,
      $$FarmAreasTableOrderingComposer,
      $$FarmAreasTableAnnotationComposer,
      $$FarmAreasTableCreateCompanionBuilder,
      $$FarmAreasTableUpdateCompanionBuilder,
      (FarmArea, $$FarmAreasTableReferences),
      FarmArea,
      PrefetchHooks Function({bool farmProductionsRefs})
    >;
typedef $$FarmProductionsTableCreateCompanionBuilder =
    FarmProductionsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      required int productId,
      required int productionAreaId,
      required double quantity,
      required int unitPriceInCents,
      required int productionCostInCents,
      required DateTime harvestDate,
    });
typedef $$FarmProductionsTableUpdateCompanionBuilder =
    FarmProductionsCompanion Function({
      Value<String> uuid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isDeleted,
      Value<int> id,
      Value<int> productId,
      Value<int> productionAreaId,
      Value<double> quantity,
      Value<int> unitPriceInCents,
      Value<int> productionCostInCents,
      Value<DateTime> harvestDate,
    });

final class $$FarmProductionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $FarmProductionsTable, FarmProduction> {
  $$FarmProductionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $FarmProductsTable _productIdTable(_$AppDatabase db) =>
      db.farmProducts.createAlias(
        $_aliasNameGenerator(db.farmProductions.productId, db.farmProducts.id),
      );

  $$FarmProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$FarmProductsTableTableManager(
      $_db,
      $_db.farmProducts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FarmAreasTable _productionAreaIdTable(_$AppDatabase db) =>
      db.farmAreas.createAlias(
        $_aliasNameGenerator(
          db.farmProductions.productionAreaId,
          db.farmAreas.id,
        ),
      );

  $$FarmAreasTableProcessedTableManager get productionAreaId {
    final $_column = $_itemColumn<int>('production_area_id')!;

    final manager = $$FarmAreasTableTableManager(
      $_db,
      $_db.farmAreas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productionAreaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FarmProductionsTableFilterComposer
    extends Composer<_$AppDatabase, $FarmProductionsTable> {
  $$FarmProductionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceInCents => $composableBuilder(
    column: $table.unitPriceInCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productionCostInCents => $composableBuilder(
    column: $table.productionCostInCents,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get harvestDate => $composableBuilder(
    column: $table.harvestDate,
    builder: (column) => ColumnFilters(column),
  );

  $$FarmProductsTableFilterComposer get productId {
    final $$FarmProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableFilterComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FarmAreasTableFilterComposer get productionAreaId {
    final $$FarmAreasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productionAreaId,
      referencedTable: $db.farmAreas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmAreasTableFilterComposer(
            $db: $db,
            $table: $db.farmAreas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmProductionsTableOrderingComposer
    extends Composer<_$AppDatabase, $FarmProductionsTable> {
  $$FarmProductionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceInCents => $composableBuilder(
    column: $table.unitPriceInCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productionCostInCents => $composableBuilder(
    column: $table.productionCostInCents,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get harvestDate => $composableBuilder(
    column: $table.harvestDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$FarmProductsTableOrderingComposer get productId {
    final $$FarmProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableOrderingComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FarmAreasTableOrderingComposer get productionAreaId {
    final $$FarmAreasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productionAreaId,
      referencedTable: $db.farmAreas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmAreasTableOrderingComposer(
            $db: $db,
            $table: $db.farmAreas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmProductionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FarmProductionsTable> {
  $$FarmProductionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPriceInCents => $composableBuilder(
    column: $table.unitPriceInCents,
    builder: (column) => column,
  );

  GeneratedColumn<int> get productionCostInCents => $composableBuilder(
    column: $table.productionCostInCents,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get harvestDate => $composableBuilder(
    column: $table.harvestDate,
    builder: (column) => column,
  );

  $$FarmProductsTableAnnotationComposer get productId {
    final $$FarmProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.farmProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.farmProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FarmAreasTableAnnotationComposer get productionAreaId {
    final $$FarmAreasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productionAreaId,
      referencedTable: $db.farmAreas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FarmAreasTableAnnotationComposer(
            $db: $db,
            $table: $db.farmAreas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FarmProductionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FarmProductionsTable,
          FarmProduction,
          $$FarmProductionsTableFilterComposer,
          $$FarmProductionsTableOrderingComposer,
          $$FarmProductionsTableAnnotationComposer,
          $$FarmProductionsTableCreateCompanionBuilder,
          $$FarmProductionsTableUpdateCompanionBuilder,
          (FarmProduction, $$FarmProductionsTableReferences),
          FarmProduction,
          PrefetchHooks Function({bool productId, bool productionAreaId})
        > {
  $$FarmProductionsTableTableManager(
    _$AppDatabase db,
    $FarmProductionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FarmProductionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FarmProductionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FarmProductionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<int> productionAreaId = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<int> unitPriceInCents = const Value.absent(),
                Value<int> productionCostInCents = const Value.absent(),
                Value<DateTime> harvestDate = const Value.absent(),
              }) => FarmProductionsCompanion(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                productId: productId,
                productionAreaId: productionAreaId,
                quantity: quantity,
                unitPriceInCents: unitPriceInCents,
                productionCostInCents: productionCostInCents,
                harvestDate: harvestDate,
              ),
          createCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int productId,
                required int productionAreaId,
                required double quantity,
                required int unitPriceInCents,
                required int productionCostInCents,
                required DateTime harvestDate,
              }) => FarmProductionsCompanion.insert(
                uuid: uuid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                id: id,
                productId: productId,
                productionAreaId: productionAreaId,
                quantity: quantity,
                unitPriceInCents: unitPriceInCents,
                productionCostInCents: productionCostInCents,
                harvestDate: harvestDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FarmProductionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productId = false, productionAreaId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable:
                                        $$FarmProductionsTableReferences
                                            ._productIdTable(db),
                                    referencedColumn:
                                        $$FarmProductionsTableReferences
                                            ._productIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (productionAreaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productionAreaId,
                                    referencedTable:
                                        $$FarmProductionsTableReferences
                                            ._productionAreaIdTable(db),
                                    referencedColumn:
                                        $$FarmProductionsTableReferences
                                            ._productionAreaIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$FarmProductionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FarmProductionsTable,
      FarmProduction,
      $$FarmProductionsTableFilterComposer,
      $$FarmProductionsTableOrderingComposer,
      $$FarmProductionsTableAnnotationComposer,
      $$FarmProductionsTableCreateCompanionBuilder,
      $$FarmProductionsTableUpdateCompanionBuilder,
      (FarmProduction, $$FarmProductionsTableReferences),
      FarmProduction,
      PrefetchHooks Function({bool productId, bool productionAreaId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SimulationsTableTableManager get simulations =>
      $$SimulationsTableTableManager(_db, _db.simulations);
  $$FarmCategoriesTableTableManager get farmCategories =>
      $$FarmCategoriesTableTableManager(_db, _db.farmCategories);
  $$FarmProductsTableTableManager get farmProducts =>
      $$FarmProductsTableTableManager(_db, _db.farmProducts);
  $$FarmStockTableTableManager get farmStock =>
      $$FarmStockTableTableManager(_db, _db.farmStock);
  $$FarmStockMovementsTableTableManager get farmStockMovements =>
      $$FarmStockMovementsTableTableManager(_db, _db.farmStockMovements);
  $$FarmSuppliersTableTableManager get farmSuppliers =>
      $$FarmSuppliersTableTableManager(_db, _db.farmSuppliers);
  $$FarmPurchasesTableTableManager get farmPurchases =>
      $$FarmPurchasesTableTableManager(_db, _db.farmPurchases);
  $$FarmPurchaseItemsTableTableManager get farmPurchaseItems =>
      $$FarmPurchaseItemsTableTableManager(_db, _db.farmPurchaseItems);
  $$FarmAreasTableTableManager get farmAreas =>
      $$FarmAreasTableTableManager(_db, _db.farmAreas);
  $$FarmProductionsTableTableManager get farmProductions =>
      $$FarmProductionsTableTableManager(_db, _db.farmProductions);
}
