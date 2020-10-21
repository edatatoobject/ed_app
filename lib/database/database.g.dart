// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String name;
  final int size;
  CategoryData({@required this.id, @required this.name, @required this.size});
  factory CategoryData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CategoryData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      size: intType.mapFromDatabaseResponse(data['${effectivePrefix}size']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || size != null) {
      map['size'] = Variable<int>(size);
    }
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      size: size == null && nullToAbsent ? const Value.absent() : Value(size),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      size: serializer.fromJson<int>(json['size']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'size': serializer.toJson<int>(size),
    };
  }

  CategoryData copyWith({int id, String name, int size}) => CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        size: size ?? this.size,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('size: $size')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, size.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.size == this.size);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> size;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.size = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int size,
  })  : name = Value(name),
        size = Value(size);
  static Insertable<CategoryData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> size,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (size != null) 'size': size,
    });
  }

  CategoryCompanion copyWith(
      {Value<int> id, Value<String> name, Value<int> size}) {
    return CategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('size: $size')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoryTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  GeneratedIntColumn _size;
  @override
  GeneratedIntColumn get size => _size ??= _constructSize();
  GeneratedIntColumn _constructSize() {
    return GeneratedIntColumn(
      'size',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, size];
  @override
  $CategoryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'category';
  @override
  final String actualTableName = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size'], _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CategoryData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(_db, alias);
  }
}

class SubcategoryData extends DataClass implements Insertable<SubcategoryData> {
  final int id;
  final String name;
  final int categoryId;
  SubcategoryData({@required this.id, @required this.name, this.categoryId});
  factory SubcategoryData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SubcategoryData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      categoryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}category_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    return map;
  }

  SubcategoryCompanion toCompanion(bool nullToAbsent) {
    return SubcategoryCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
    );
  }

  factory SubcategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SubcategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'categoryId': serializer.toJson<int>(categoryId),
    };
  }

  SubcategoryData copyWith({int id, String name, int categoryId}) =>
      SubcategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryId: categoryId ?? this.categoryId,
      );
  @override
  String toString() {
    return (StringBuffer('SubcategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, categoryId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SubcategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.categoryId == this.categoryId);
}

class SubcategoryCompanion extends UpdateCompanion<SubcategoryData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> categoryId;
  const SubcategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  SubcategoryCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.categoryId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<SubcategoryData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  SubcategoryCompanion copyWith(
      {Value<int> id, Value<String> name, Value<int> categoryId}) {
    return SubcategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubcategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

class $SubcategoryTable extends Subcategory
    with TableInfo<$SubcategoryTable, SubcategoryData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SubcategoryTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  GeneratedIntColumn _categoryId;
  @override
  GeneratedIntColumn get categoryId => _categoryId ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn('category_id', $tableName, true,
        $customConstraints: 'NULLABLE REFERENCES categories(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, categoryId];
  @override
  $SubcategoryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'subcategory';
  @override
  final String actualTableName = 'subcategory';
  @override
  VerificationContext validateIntegrity(Insertable<SubcategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id'], _categoryIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubcategoryData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SubcategoryData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SubcategoryTable createAlias(String alias) {
    return $SubcategoryTable(_db, alias);
  }
}

class TaskData extends DataClass implements Insertable<TaskData> {
  final int id;
  final String value;
  final int status;
  final int subcategoryId;
  TaskData(
      {@required this.id,
      @required this.value,
      @required this.status,
      this.subcategoryId});
  factory TaskData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TaskData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      subcategoryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}subcategory_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || subcategoryId != null) {
      map['subcategory_id'] = Variable<int>(subcategoryId);
    }
    return map;
  }

  TaskCompanion toCompanion(bool nullToAbsent) {
    return TaskCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      subcategoryId: subcategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(subcategoryId),
    );
  }

  factory TaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TaskData(
      id: serializer.fromJson<int>(json['id']),
      value: serializer.fromJson<String>(json['value']),
      status: serializer.fromJson<int>(json['status']),
      subcategoryId: serializer.fromJson<int>(json['subcategoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value': serializer.toJson<String>(value),
      'status': serializer.toJson<int>(status),
      'subcategoryId': serializer.toJson<int>(subcategoryId),
    };
  }

  TaskData copyWith({int id, String value, int status, int subcategoryId}) =>
      TaskData(
        id: id ?? this.id,
        value: value ?? this.value,
        status: status ?? this.status,
        subcategoryId: subcategoryId ?? this.subcategoryId,
      );
  @override
  String toString() {
    return (StringBuffer('TaskData(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('status: $status, ')
          ..write('subcategoryId: $subcategoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(value.hashCode, $mrjc(status.hashCode, subcategoryId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TaskData &&
          other.id == this.id &&
          other.value == this.value &&
          other.status == this.status &&
          other.subcategoryId == this.subcategoryId);
}

class TaskCompanion extends UpdateCompanion<TaskData> {
  final Value<int> id;
  final Value<String> value;
  final Value<int> status;
  final Value<int> subcategoryId;
  const TaskCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.status = const Value.absent(),
    this.subcategoryId = const Value.absent(),
  });
  TaskCompanion.insert({
    this.id = const Value.absent(),
    @required String value,
    @required int status,
    this.subcategoryId = const Value.absent(),
  })  : value = Value(value),
        status = Value(status);
  static Insertable<TaskData> custom({
    Expression<int> id,
    Expression<String> value,
    Expression<int> status,
    Expression<int> subcategoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
      if (status != null) 'status': status,
      if (subcategoryId != null) 'subcategory_id': subcategoryId,
    });
  }

  TaskCompanion copyWith(
      {Value<int> id,
      Value<String> value,
      Value<int> status,
      Value<int> subcategoryId}) {
    return TaskCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      status: status ?? this.status,
      subcategoryId: subcategoryId ?? this.subcategoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (subcategoryId.present) {
      map['subcategory_id'] = Variable<int>(subcategoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskCompanion(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('status: $status, ')
          ..write('subcategoryId: $subcategoryId')
          ..write(')'))
        .toString();
  }
}

class $TaskTable extends Task with TableInfo<$TaskTable, TaskData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TaskTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn('value', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subcategoryIdMeta =
      const VerificationMeta('subcategoryId');
  GeneratedIntColumn _subcategoryId;
  @override
  GeneratedIntColumn get subcategoryId =>
      _subcategoryId ??= _constructSubcategoryId();
  GeneratedIntColumn _constructSubcategoryId() {
    return GeneratedIntColumn('subcategory_id', $tableName, true,
        $customConstraints: 'NULLABLE REFERENCES subcategories(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, value, status, subcategoryId];
  @override
  $TaskTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'task';
  @override
  final String actualTableName = 'task';
  @override
  VerificationContext validateIntegrity(Insertable<TaskData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('subcategory_id')) {
      context.handle(
          _subcategoryIdMeta,
          subcategoryId.isAcceptableOrUnknown(
              data['subcategory_id'], _subcategoryIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TaskData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TaskTable createAlias(String alias) {
    return $TaskTable(_db, alias);
  }
}

class SprintData extends DataClass implements Insertable<SprintData> {
  final int id;
  final int number;
  final int duration;
  final DateTime startDate;
  final DateTime finishDate;
  SprintData(
      {@required this.id,
      @required this.number,
      @required this.duration,
      @required this.startDate,
      @required this.finishDate});
  factory SprintData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return SprintData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      number: intType.mapFromDatabaseResponse(data['${effectivePrefix}number']),
      duration:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}duration']),
      startDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      finishDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}finish_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<int>(number);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || finishDate != null) {
      map['finish_date'] = Variable<DateTime>(finishDate);
    }
    return map;
  }

  SprintCompanion toCompanion(bool nullToAbsent) {
    return SprintCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      finishDate: finishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(finishDate),
    );
  }

  factory SprintData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SprintData(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<int>(json['number']),
      duration: serializer.fromJson<int>(json['duration']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      finishDate: serializer.fromJson<DateTime>(json['finishDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<int>(number),
      'duration': serializer.toJson<int>(duration),
      'startDate': serializer.toJson<DateTime>(startDate),
      'finishDate': serializer.toJson<DateTime>(finishDate),
    };
  }

  SprintData copyWith(
          {int id,
          int number,
          int duration,
          DateTime startDate,
          DateTime finishDate}) =>
      SprintData(
        id: id ?? this.id,
        number: number ?? this.number,
        duration: duration ?? this.duration,
        startDate: startDate ?? this.startDate,
        finishDate: finishDate ?? this.finishDate,
      );
  @override
  String toString() {
    return (StringBuffer('SprintData(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('duration: $duration, ')
          ..write('startDate: $startDate, ')
          ..write('finishDate: $finishDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          number.hashCode,
          $mrjc(duration.hashCode,
              $mrjc(startDate.hashCode, finishDate.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SprintData &&
          other.id == this.id &&
          other.number == this.number &&
          other.duration == this.duration &&
          other.startDate == this.startDate &&
          other.finishDate == this.finishDate);
}

class SprintCompanion extends UpdateCompanion<SprintData> {
  final Value<int> id;
  final Value<int> number;
  final Value<int> duration;
  final Value<DateTime> startDate;
  final Value<DateTime> finishDate;
  const SprintCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.duration = const Value.absent(),
    this.startDate = const Value.absent(),
    this.finishDate = const Value.absent(),
  });
  SprintCompanion.insert({
    this.id = const Value.absent(),
    @required int number,
    @required int duration,
    @required DateTime startDate,
    @required DateTime finishDate,
  })  : number = Value(number),
        duration = Value(duration),
        startDate = Value(startDate),
        finishDate = Value(finishDate);
  static Insertable<SprintData> custom({
    Expression<int> id,
    Expression<int> number,
    Expression<int> duration,
    Expression<DateTime> startDate,
    Expression<DateTime> finishDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (duration != null) 'duration': duration,
      if (startDate != null) 'start_date': startDate,
      if (finishDate != null) 'finish_date': finishDate,
    });
  }

  SprintCompanion copyWith(
      {Value<int> id,
      Value<int> number,
      Value<int> duration,
      Value<DateTime> startDate,
      Value<DateTime> finishDate}) {
    return SprintCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      duration: duration ?? this.duration,
      startDate: startDate ?? this.startDate,
      finishDate: finishDate ?? this.finishDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (finishDate.present) {
      map['finish_date'] = Variable<DateTime>(finishDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SprintCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('duration: $duration, ')
          ..write('startDate: $startDate, ')
          ..write('finishDate: $finishDate')
          ..write(')'))
        .toString();
  }
}

class $SprintTable extends Sprint with TableInfo<$SprintTable, SprintData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SprintTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  GeneratedIntColumn _number;
  @override
  GeneratedIntColumn get number => _number ??= _constructNumber();
  GeneratedIntColumn _constructNumber() {
    return GeneratedIntColumn(
      'number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  GeneratedIntColumn _duration;
  @override
  GeneratedIntColumn get duration => _duration ??= _constructDuration();
  GeneratedIntColumn _constructDuration() {
    return GeneratedIntColumn(
      'duration',
      $tableName,
      false,
    );
  }

  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  GeneratedDateTimeColumn _startDate;
  @override
  GeneratedDateTimeColumn get startDate => _startDate ??= _constructStartDate();
  GeneratedDateTimeColumn _constructStartDate() {
    return GeneratedDateTimeColumn(
      'start_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _finishDateMeta = const VerificationMeta('finishDate');
  GeneratedDateTimeColumn _finishDate;
  @override
  GeneratedDateTimeColumn get finishDate =>
      _finishDate ??= _constructFinishDate();
  GeneratedDateTimeColumn _constructFinishDate() {
    return GeneratedDateTimeColumn(
      'finish_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, number, duration, startDate, finishDate];
  @override
  $SprintTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sprint';
  @override
  final String actualTableName = 'sprint';
  @override
  VerificationContext validateIntegrity(Insertable<SprintData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number'], _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration'], _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date'], _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('finish_date')) {
      context.handle(
          _finishDateMeta,
          finishDate.isAcceptableOrUnknown(
              data['finish_date'], _finishDateMeta));
    } else if (isInserting) {
      context.missing(_finishDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SprintData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SprintData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SprintTable createAlias(String alias) {
    return $SprintTable(_db, alias);
  }
}

class TaskInSprintData extends DataClass
    implements Insertable<TaskInSprintData> {
  final int id;
  final String value;
  final int status;
  final int subcategoryId;
  TaskInSprintData(
      {@required this.id,
      @required this.value,
      @required this.status,
      this.subcategoryId});
  factory TaskInSprintData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TaskInSprintData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      subcategoryId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}subcategory_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || subcategoryId != null) {
      map['subcategory_id'] = Variable<int>(subcategoryId);
    }
    return map;
  }

  TaskInSprintCompanion toCompanion(bool nullToAbsent) {
    return TaskInSprintCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      subcategoryId: subcategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(subcategoryId),
    );
  }

  factory TaskInSprintData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TaskInSprintData(
      id: serializer.fromJson<int>(json['id']),
      value: serializer.fromJson<String>(json['value']),
      status: serializer.fromJson<int>(json['status']),
      subcategoryId: serializer.fromJson<int>(json['subcategoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value': serializer.toJson<String>(value),
      'status': serializer.toJson<int>(status),
      'subcategoryId': serializer.toJson<int>(subcategoryId),
    };
  }

  TaskInSprintData copyWith(
          {int id, String value, int status, int subcategoryId}) =>
      TaskInSprintData(
        id: id ?? this.id,
        value: value ?? this.value,
        status: status ?? this.status,
        subcategoryId: subcategoryId ?? this.subcategoryId,
      );
  @override
  String toString() {
    return (StringBuffer('TaskInSprintData(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('status: $status, ')
          ..write('subcategoryId: $subcategoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(value.hashCode, $mrjc(status.hashCode, subcategoryId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TaskInSprintData &&
          other.id == this.id &&
          other.value == this.value &&
          other.status == this.status &&
          other.subcategoryId == this.subcategoryId);
}

class TaskInSprintCompanion extends UpdateCompanion<TaskInSprintData> {
  final Value<int> id;
  final Value<String> value;
  final Value<int> status;
  final Value<int> subcategoryId;
  const TaskInSprintCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
    this.status = const Value.absent(),
    this.subcategoryId = const Value.absent(),
  });
  TaskInSprintCompanion.insert({
    this.id = const Value.absent(),
    @required String value,
    @required int status,
    this.subcategoryId = const Value.absent(),
  })  : value = Value(value),
        status = Value(status);
  static Insertable<TaskInSprintData> custom({
    Expression<int> id,
    Expression<String> value,
    Expression<int> status,
    Expression<int> subcategoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
      if (status != null) 'status': status,
      if (subcategoryId != null) 'subcategory_id': subcategoryId,
    });
  }

  TaskInSprintCompanion copyWith(
      {Value<int> id,
      Value<String> value,
      Value<int> status,
      Value<int> subcategoryId}) {
    return TaskInSprintCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
      status: status ?? this.status,
      subcategoryId: subcategoryId ?? this.subcategoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (subcategoryId.present) {
      map['subcategory_id'] = Variable<int>(subcategoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskInSprintCompanion(')
          ..write('id: $id, ')
          ..write('value: $value, ')
          ..write('status: $status, ')
          ..write('subcategoryId: $subcategoryId')
          ..write(')'))
        .toString();
  }
}

class $TaskInSprintTable extends TaskInSprint
    with TableInfo<$TaskInSprintTable, TaskInSprintData> {
  final GeneratedDatabase _db;
  final String _alias;
  $TaskInSprintTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn('value', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subcategoryIdMeta =
      const VerificationMeta('subcategoryId');
  GeneratedIntColumn _subcategoryId;
  @override
  GeneratedIntColumn get subcategoryId =>
      _subcategoryId ??= _constructSubcategoryId();
  GeneratedIntColumn _constructSubcategoryId() {
    return GeneratedIntColumn('subcategory_id', $tableName, true,
        $customConstraints: 'NULLABLE REFERENCES subcategories(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, value, status, subcategoryId];
  @override
  $TaskInSprintTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'task_in_sprint';
  @override
  final String actualTableName = 'task_in_sprint';
  @override
  VerificationContext validateIntegrity(Insertable<TaskInSprintData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('subcategory_id')) {
      context.handle(
          _subcategoryIdMeta,
          subcategoryId.isAcceptableOrUnknown(
              data['subcategory_id'], _subcategoryIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskInSprintData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TaskInSprintData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TaskInSprintTable createAlias(String alias) {
    return $TaskInSprintTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CategoryTable _category;
  $CategoryTable get category => _category ??= $CategoryTable(this);
  $SubcategoryTable _subcategory;
  $SubcategoryTable get subcategory => _subcategory ??= $SubcategoryTable(this);
  $TaskTable _task;
  $TaskTable get task => _task ??= $TaskTable(this);
  $SprintTable _sprint;
  $SprintTable get sprint => _sprint ??= $SprintTable(this);
  $TaskInSprintTable _taskInSprint;
  $TaskInSprintTable get taskInSprint =>
      _taskInSprint ??= $TaskInSprintTable(this);
  CategoryDao _categoryDao;
  CategoryDao get categoryDao => _categoryDao ??= CategoryDao(this as Database);
  SubcategoryDao _subcategoryDao;
  SubcategoryDao get subcategoryDao =>
      _subcategoryDao ??= SubcategoryDao(this as Database);
  TaskDao _taskDao;
  TaskDao get taskDao => _taskDao ??= TaskDao(this as Database);
  SprintDao _sprintDao;
  SprintDao get sprintDao => _sprintDao ??= SprintDao(this as Database);
  TaskInSprintDao _taskInSprintDao;
  TaskInSprintDao get taskInSprintDao =>
      _taskInSprintDao ??= TaskInSprintDao(this as Database);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [category, subcategory, task, sprint, taskInSprint];
}
