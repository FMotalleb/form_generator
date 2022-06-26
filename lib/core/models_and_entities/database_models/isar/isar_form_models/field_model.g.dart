// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetIsarFormFieldCollection on Isar {
  IsarCollection<IsarFormField> get isarFormFields => getCollection();
}

const IsarFormFieldSchema = CollectionSchema(
  name: r'IsarFormField',
  schema:
      r'{"name":"IsarFormField","idName":"id","properties":[{"name":"error","type":"String"},{"name":"hashCode","type":"Long"},{"name":"hint","type":"String"},{"name":"index","type":"Long"},{"name":"isValid","type":"String"},{"name":"key","type":"String"},{"name":"label","type":"String"},{"name":"stringify","type":"Bool"},{"name":"type","type":"Long"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {
    r'error': 0,
    r'hashCode': 1,
    r'hint': 2,
    r'index': 3,
    r'isValid': 4,
    r'key': 5,
    r'label': 6,
    r'stringify': 7,
    r'type': 8
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarFormFieldGetId,
  setId: _isarFormFieldSetId,
  getLinks: _isarFormFieldGetLinks,
  attachLinks: _isarFormFieldAttachLinks,
  serializeNative: _isarFormFieldSerializeNative,
  deserializeNative: _isarFormFieldDeserializeNative,
  deserializePropNative: _isarFormFieldDeserializePropNative,
  serializeWeb: _isarFormFieldSerializeWeb,
  deserializeWeb: _isarFormFieldDeserializeWeb,
  deserializePropWeb: _isarFormFieldDeserializePropWeb,
  version: 4,
);

int? _isarFormFieldGetId(IsarFormField object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarFormFieldSetId(IsarFormField object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _isarFormFieldGetLinks(IsarFormField object) {
  return [];
}

const _isarFormFieldFieldTypeConverter = FieldTypeConverter();

void _isarFormFieldSerializeNative(
    IsarCollection<IsarFormField> collection,
    IsarCObject cObj,
    IsarFormField object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final error$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.error);
  final hint$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.hint);
  final isValid$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.isValid);
  final key$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.key);
  final label$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.label);
  final type$Converted = _isarFormFieldFieldTypeConverter.toIsar(object.type);
  final size = (staticSize +
      (error$Bytes.length) +
      (hint$Bytes.length) +
      (isValid$Bytes.length) +
      (key$Bytes.length) +
      (label$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeBytes(offsets[0], error$Bytes);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeBytes(offsets[2], hint$Bytes);
  writer.writeLong(offsets[3], object.index);
  writer.writeBytes(offsets[4], isValid$Bytes);
  writer.writeBytes(offsets[5], key$Bytes);
  writer.writeBytes(offsets[6], label$Bytes);
  writer.writeBool(offsets[7], object.stringify);
  writer.writeLong(offsets[8], type$Converted);
}

IsarFormField _isarFormFieldDeserializeNative(
    IsarCollection<IsarFormField> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarFormField(
    error: reader.readString(offsets[0]),
    hint: reader.readString(offsets[2]),
    id: id,
    index: reader.readLong(offsets[3]),
    isValid: reader.readString(offsets[4]),
    key: reader.readString(offsets[5]),
    label: reader.readString(offsets[6]),
    type:
        _isarFormFieldFieldTypeConverter.fromIsar(reader.readLong(offsets[8])),
  );
  return object;
}

P _isarFormFieldDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (_isarFormFieldFieldTypeConverter
          .fromIsar(reader.readLong(offset))) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _isarFormFieldSerializeWeb(
    IsarCollection<IsarFormField> collection, IsarFormField object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'error', object.error);
  IsarNative.jsObjectSet(jsObj, r'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, r'hint', object.hint);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'index', object.index);
  IsarNative.jsObjectSet(jsObj, r'isValid', object.isValid);
  IsarNative.jsObjectSet(jsObj, r'key', object.key);
  IsarNative.jsObjectSet(jsObj, r'label', object.label);
  IsarNative.jsObjectSet(jsObj, r'stringify', object.stringify);
  IsarNative.jsObjectSet(
      jsObj, r'type', _isarFormFieldFieldTypeConverter.toIsar(object.type));
  return jsObj;
}

IsarFormField _isarFormFieldDeserializeWeb(
    IsarCollection<IsarFormField> collection, Object jsObj) {
  final object = IsarFormField(
    error: IsarNative.jsObjectGet(jsObj, r'error') ?? '',
    hint: IsarNative.jsObjectGet(jsObj, r'hint') ?? '',
    id: IsarNative.jsObjectGet(jsObj, r'id') ??
        (double.negativeInfinity as int),
    index: IsarNative.jsObjectGet(jsObj, r'index') ??
        (double.negativeInfinity as int),
    isValid: IsarNative.jsObjectGet(jsObj, r'isValid') ?? '',
    key: IsarNative.jsObjectGet(jsObj, r'key') ?? '',
    label: IsarNative.jsObjectGet(jsObj, r'label') ?? '',
    type: _isarFormFieldFieldTypeConverter.fromIsar(
        IsarNative.jsObjectGet(jsObj, r'type') ??
            (double.negativeInfinity as int)),
  );
  return object;
}

P _isarFormFieldDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'error':
      return (IsarNative.jsObjectGet(jsObj, r'error') ?? '') as P;
    case r'hashCode':
      return (IsarNative.jsObjectGet(jsObj, r'hashCode') ??
          (double.negativeInfinity as int)) as P;
    case r'hint':
      return (IsarNative.jsObjectGet(jsObj, r'hint') ?? '') as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'index':
      return (IsarNative.jsObjectGet(jsObj, r'index') ??
          (double.negativeInfinity as int)) as P;
    case r'isValid':
      return (IsarNative.jsObjectGet(jsObj, r'isValid') ?? '') as P;
    case r'key':
      return (IsarNative.jsObjectGet(jsObj, r'key') ?? '') as P;
    case r'label':
      return (IsarNative.jsObjectGet(jsObj, r'label') ?? '') as P;
    case r'stringify':
      return (IsarNative.jsObjectGet(jsObj, r'stringify')) as P;
    case r'type':
      return (_isarFormFieldFieldTypeConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, r'type') ??
              (double.negativeInfinity as int))) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _isarFormFieldAttachLinks(
    IsarCollection<dynamic> col, int id, IsarFormField object) {}

extension IsarFormFieldQueryWhereSort
    on QueryBuilder<IsarFormField, IsarFormField, QWhere> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarFormFieldQueryWhere
    on QueryBuilder<IsarFormField, IsarFormField, QWhereClause> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idEqualTo(
      int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idNotEqualTo(
      int id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarFormFieldQueryFilter
    on QueryBuilder<IsarFormField, IsarFormField, QFilterCondition> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'error',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'error',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> hintEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> hintBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> hintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      indexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      indexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      indexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      indexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isValid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isValid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isValid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      keyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'key',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'key',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      stringifyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      stringifyEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringify',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> typeEqualTo(
      FieldType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: _isarFormFieldFieldTypeConverter.toIsar(value),
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      typeGreaterThan(
    FieldType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: _isarFormFieldFieldTypeConverter.toIsar(value),
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      typeLessThan(
    FieldType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: _isarFormFieldFieldTypeConverter.toIsar(value),
      ));
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> typeBetween(
    FieldType lower,
    FieldType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: _isarFormFieldFieldTypeConverter.toIsar(lower),
        includeLower: includeLower,
        upper: _isarFormFieldFieldTypeConverter.toIsar(upper),
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarFormFieldQueryLinks
    on QueryBuilder<IsarFormField, IsarFormField, QFilterCondition> {}

extension IsarFormFieldQueryWhereSortBy
    on QueryBuilder<IsarFormField, IsarFormField, QSortBy> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByHint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByHintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy>
      sortByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension IsarFormFieldQueryWhereSortThenBy
    on QueryBuilder<IsarFormField, IsarFormField, QSortThenBy> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByHint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByHintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByIsValid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByIsValidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isValid', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy>
      thenByStringifyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stringify', Sort.desc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension IsarFormFieldQueryWhereDistinct
    on QueryBuilder<IsarFormField, IsarFormField, QDistinct> {
  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByError(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'error', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByHint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'index');
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByIsValid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isValid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'key', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByStringify() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stringify');
    });
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension IsarFormFieldQueryProperty
    on QueryBuilder<IsarFormField, IsarFormField, QQueryProperty> {
  QueryBuilder<IsarFormField, String, QQueryOperations> errorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'error');
    });
  }

  QueryBuilder<IsarFormField, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<IsarFormField, String, QQueryOperations> hintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hint');
    });
  }

  QueryBuilder<IsarFormField, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarFormField, int, QQueryOperations> indexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'index');
    });
  }

  QueryBuilder<IsarFormField, String, QQueryOperations> isValidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isValid');
    });
  }

  QueryBuilder<IsarFormField, String, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<IsarFormField, String, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<IsarFormField, bool?, QQueryOperations> stringifyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stringify');
    });
  }

  QueryBuilder<IsarFormField, FieldType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
