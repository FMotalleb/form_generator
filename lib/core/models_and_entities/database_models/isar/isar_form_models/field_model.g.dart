// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarFormFieldCollection on Isar {
  IsarCollection<IsarFormField> get isarFormFields => getCollection();
}

const IsarFormFieldSchema = CollectionSchema(
  name: 'IsarFormField',
  schema:
      '{"name":"IsarFormField","idName":"id","properties":[{"name":"error","type":"String"},{"name":"hashCode","type":"Long"},{"name":"hint","type":"String"},{"name":"isValid","type":"String"},{"name":"key","type":"String"},{"name":"label","type":"String"},{"name":"stringify","type":"Bool"},{"name":"type","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'error': 0,
    'hashCode': 1,
    'hint': 2,
    'isValid': 3,
    'key': 4,
    'label': 5,
    'stringify': 6,
    'type': 7
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
  version: 3,
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

List<IsarLinkBase> _isarFormFieldGetLinks(IsarFormField object) {
  return [];
}

const _isarFormFieldFieldTypeConverter = FieldTypeConverter();

void _isarFormFieldSerializeNative(
    IsarCollection<IsarFormField> collection,
    IsarRawObject rawObj,
    IsarFormField object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.error;
  final _error = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_error.length) as int;
  final value1 = object.hashCode;
  final _hashCode = value1;
  final value2 = object.hint;
  final _hint = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_hint.length) as int;
  final value3 = object.isValid;
  final _isValid = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_isValid.length) as int;
  final value4 = object.key;
  final _key = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_key.length) as int;
  final value5 = object.label;
  final _label = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_label.length) as int;
  final value6 = object.stringify;
  final _stringify = value6;
  final value7 = _isarFormFieldFieldTypeConverter.toIsar(object.type);
  final _type = value7;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _error);
  writer.writeLong(offsets[1], _hashCode);
  writer.writeBytes(offsets[2], _hint);
  writer.writeBytes(offsets[3], _isValid);
  writer.writeBytes(offsets[4], _key);
  writer.writeBytes(offsets[5], _label);
  writer.writeBool(offsets[6], _stringify);
  writer.writeLong(offsets[7], _type);
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
    isValid: reader.readString(offsets[3]),
    key: reader.readString(offsets[4]),
    label: reader.readString(offsets[5]),
    type:
        _isarFormFieldFieldTypeConverter.fromIsar(reader.readLong(offsets[7])),
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (_isarFormFieldFieldTypeConverter
          .fromIsar(reader.readLong(offset))) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarFormFieldSerializeWeb(
    IsarCollection<IsarFormField> collection, IsarFormField object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'error', object.error);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'hint', object.hint);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isValid', object.isValid);
  IsarNative.jsObjectSet(jsObj, 'key', object.key);
  IsarNative.jsObjectSet(jsObj, 'label', object.label);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  IsarNative.jsObjectSet(
      jsObj, 'type', _isarFormFieldFieldTypeConverter.toIsar(object.type));
  return jsObj;
}

IsarFormField _isarFormFieldDeserializeWeb(
    IsarCollection<IsarFormField> collection, dynamic jsObj) {
  final object = IsarFormField(
    error: IsarNative.jsObjectGet(jsObj, 'error') ?? '',
    hint: IsarNative.jsObjectGet(jsObj, 'hint') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    isValid: IsarNative.jsObjectGet(jsObj, 'isValid') ?? '',
    key: IsarNative.jsObjectGet(jsObj, 'key') ?? '',
    label: IsarNative.jsObjectGet(jsObj, 'label') ?? '',
    type: _isarFormFieldFieldTypeConverter.fromIsar(
        IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity),
  );
  return object;
}

P _isarFormFieldDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'error':
      return (IsarNative.jsObjectGet(jsObj, 'error') ?? '') as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'hint':
      return (IsarNative.jsObjectGet(jsObj, 'hint') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'isValid':
      return (IsarNative.jsObjectGet(jsObj, 'isValid') ?? '') as P;
    case 'key':
      return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
    case 'label':
      return (IsarNative.jsObjectGet(jsObj, 'label') ?? '') as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    case 'type':
      return (_isarFormFieldFieldTypeConverter.fromIsar(
              IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity))
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarFormFieldAttachLinks(
    IsarCollection col, int id, IsarFormField object) {}

extension IsarFormFieldQueryWhereSort
    on QueryBuilder<IsarFormField, IsarFormField, QWhere> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarFormFieldQueryWhere
    on QueryBuilder<IsarFormField, IsarFormField, QWhereClause> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension IsarFormFieldQueryFilter
    on QueryBuilder<IsarFormField, IsarFormField, QFilterCondition> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'error',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'error',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'error',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'error',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'error',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'error',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'error',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      errorMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'error',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> hintEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> hintBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hint',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      hintContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> hintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'hint',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isValid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'isValid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'isValid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'isValid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'isValid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'isValid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'isValid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      isValidMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'isValid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      keyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'key',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> keyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'label',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      labelMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'label',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      stringifyEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> typeEqualTo(
      FieldType value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: _isarFormFieldFieldTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      typeGreaterThan(
    FieldType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: _isarFormFieldFieldTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition>
      typeLessThan(
    FieldType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: _isarFormFieldFieldTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterFilterCondition> typeBetween(
    FieldType lower,
    FieldType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'type',
      lower: _isarFormFieldFieldTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _isarFormFieldFieldTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }
}

extension IsarFormFieldQueryLinks
    on QueryBuilder<IsarFormField, IsarFormField, QFilterCondition> {}

extension IsarFormFieldQueryWhereSortBy
    on QueryBuilder<IsarFormField, IsarFormField, QSortBy> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByError() {
    return addSortByInternal('error', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByErrorDesc() {
    return addSortByInternal('error', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy>
      sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByHint() {
    return addSortByInternal('hint', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByHintDesc() {
    return addSortByInternal('hint', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByIsValid() {
    return addSortByInternal('isValid', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByIsValidDesc() {
    return addSortByInternal('isValid', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByLabel() {
    return addSortByInternal('label', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByLabelDesc() {
    return addSortByInternal('label', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy>
      sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension IsarFormFieldQueryWhereSortThenBy
    on QueryBuilder<IsarFormField, IsarFormField, QSortThenBy> {
  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByError() {
    return addSortByInternal('error', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByErrorDesc() {
    return addSortByInternal('error', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy>
      thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByHint() {
    return addSortByInternal('hint', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByHintDesc() {
    return addSortByInternal('hint', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByIsValid() {
    return addSortByInternal('isValid', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByIsValidDesc() {
    return addSortByInternal('isValid', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByLabel() {
    return addSortByInternal('label', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByLabelDesc() {
    return addSortByInternal('label', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy>
      thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<IsarFormField, IsarFormField, QAfterSortBy> thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension IsarFormFieldQueryWhereDistinct
    on QueryBuilder<IsarFormField, IsarFormField, QDistinct> {
  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByError(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('error', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByHint(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('hint', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByIsValid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('isValid', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('label', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<IsarFormField, IsarFormField, QDistinct> distinctByType() {
    return addDistinctByInternal('type');
  }
}

extension IsarFormFieldQueryProperty
    on QueryBuilder<IsarFormField, IsarFormField, QQueryProperty> {
  QueryBuilder<IsarFormField, String, QQueryOperations> errorProperty() {
    return addPropertyNameInternal('error');
  }

  QueryBuilder<IsarFormField, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<IsarFormField, String, QQueryOperations> hintProperty() {
    return addPropertyNameInternal('hint');
  }

  QueryBuilder<IsarFormField, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarFormField, String, QQueryOperations> isValidProperty() {
    return addPropertyNameInternal('isValid');
  }

  QueryBuilder<IsarFormField, String, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }

  QueryBuilder<IsarFormField, String, QQueryOperations> labelProperty() {
    return addPropertyNameInternal('label');
  }

  QueryBuilder<IsarFormField, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<IsarFormField, FieldType, QQueryOperations> typeProperty() {
    return addPropertyNameInternal('type');
  }
}
