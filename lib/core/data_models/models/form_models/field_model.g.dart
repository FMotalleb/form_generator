// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetFormFieldCollection on Isar {
  IsarCollection<FormField> get formFields => getCollection();
}

const FormFieldSchema = CollectionSchema(
  name: 'FormField',
  schema:
      '{"name":"FormField","idName":"id","properties":[{"name":"error","type":"String"},{"name":"hashCode","type":"Long"},{"name":"hint","type":"String"},{"name":"isValid","type":"String"},{"name":"key","type":"String"},{"name":"label","type":"String"},{"name":"stringify","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'error': 0,
    'hashCode': 1,
    'hint': 2,
    'isValid': 3,
    'key': 4,
    'label': 5,
    'stringify': 6
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _formFieldGetId,
  setId: _formFieldSetId,
  getLinks: _formFieldGetLinks,
  attachLinks: _formFieldAttachLinks,
  serializeNative: _formFieldSerializeNative,
  deserializeNative: _formFieldDeserializeNative,
  deserializePropNative: _formFieldDeserializePropNative,
  serializeWeb: _formFieldSerializeWeb,
  deserializeWeb: _formFieldDeserializeWeb,
  deserializePropWeb: _formFieldDeserializePropWeb,
  version: 3,
);

int? _formFieldGetId(FormField object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _formFieldSetId(FormField object, int id) {
  object.id = id;
}

List<IsarLinkBase> _formFieldGetLinks(FormField object) {
  return [];
}

void _formFieldSerializeNative(
    IsarCollection<FormField> collection,
    IsarRawObject rawObj,
    FormField object,
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
}

FormField _formFieldDeserializeNative(IsarCollection<FormField> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = FormField(
    error: reader.readString(offsets[0]),
    hint: reader.readString(offsets[2]),
    id: id,
    isValid: reader.readString(offsets[3]),
    key: reader.readString(offsets[4]),
    label: reader.readString(offsets[5]),
  );
  return object;
}

P _formFieldDeserializePropNative<P>(
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
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _formFieldSerializeWeb(
    IsarCollection<FormField> collection, FormField object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'error', object.error);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'hint', object.hint);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isValid', object.isValid);
  IsarNative.jsObjectSet(jsObj, 'key', object.key);
  IsarNative.jsObjectSet(jsObj, 'label', object.label);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  return jsObj;
}

FormField _formFieldDeserializeWeb(
    IsarCollection<FormField> collection, dynamic jsObj) {
  final object = FormField(
    error: IsarNative.jsObjectGet(jsObj, 'error') ?? '',
    hint: IsarNative.jsObjectGet(jsObj, 'hint') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id'),
    isValid: IsarNative.jsObjectGet(jsObj, 'isValid') ?? '',
    key: IsarNative.jsObjectGet(jsObj, 'key') ?? '',
    label: IsarNative.jsObjectGet(jsObj, 'label') ?? '',
  );
  return object;
}

P _formFieldDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'error':
      return (IsarNative.jsObjectGet(jsObj, 'error') ?? '') as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'hint':
      return (IsarNative.jsObjectGet(jsObj, 'hint') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'isValid':
      return (IsarNative.jsObjectGet(jsObj, 'isValid') ?? '') as P;
    case 'key':
      return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
    case 'label':
      return (IsarNative.jsObjectGet(jsObj, 'label') ?? '') as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _formFieldAttachLinks(IsarCollection col, int id, FormField object) {}

extension FormFieldQueryWhereSort
    on QueryBuilder<FormField, FormField, QWhere> {
  QueryBuilder<FormField, FormField, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension FormFieldQueryWhere
    on QueryBuilder<FormField, FormField, QWhereClause> {
  QueryBuilder<FormField, FormField, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<FormField, FormField, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<FormField, FormField, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<FormField, FormField, QAfterWhereClause> idBetween(
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

extension FormFieldQueryFilter
    on QueryBuilder<FormField, FormField, QFilterCondition> {
  QueryBuilder<FormField, FormField, QAfterFilterCondition> errorEqualTo(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> errorGreaterThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> errorLessThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> errorBetween(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> errorStartsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> errorEndsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> errorContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'error',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> errorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'error',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hintEqualTo(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hintGreaterThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hintLessThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hintBetween(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hintStartsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hintEndsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hintContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> hintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'hint',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> isValidEqualTo(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> isValidGreaterThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> isValidLessThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> isValidBetween(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> isValidStartsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> isValidEndsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> isValidContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'isValid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> isValidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'isValid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> keyEqualTo(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> keyGreaterThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> keyLessThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> keyBetween(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> keyStartsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> keyEndsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> keyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> keyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> labelEqualTo(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> labelGreaterThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> labelLessThan(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> labelBetween(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> labelStartsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> labelEndsWith(
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

  QueryBuilder<FormField, FormField, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'label',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'label',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<FormField, FormField, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }
}

extension FormFieldQueryLinks
    on QueryBuilder<FormField, FormField, QFilterCondition> {}

extension FormFieldQueryWhereSortBy
    on QueryBuilder<FormField, FormField, QSortBy> {
  QueryBuilder<FormField, FormField, QAfterSortBy> sortByError() {
    return addSortByInternal('error', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByErrorDesc() {
    return addSortByInternal('error', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByHint() {
    return addSortByInternal('hint', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByHintDesc() {
    return addSortByInternal('hint', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByIsValid() {
    return addSortByInternal('isValid', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByIsValidDesc() {
    return addSortByInternal('isValid', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByLabel() {
    return addSortByInternal('label', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByLabelDesc() {
    return addSortByInternal('label', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension FormFieldQueryWhereSortThenBy
    on QueryBuilder<FormField, FormField, QSortThenBy> {
  QueryBuilder<FormField, FormField, QAfterSortBy> thenByError() {
    return addSortByInternal('error', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByErrorDesc() {
    return addSortByInternal('error', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByHint() {
    return addSortByInternal('hint', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByHintDesc() {
    return addSortByInternal('hint', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByIsValid() {
    return addSortByInternal('isValid', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByIsValidDesc() {
    return addSortByInternal('isValid', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByLabel() {
    return addSortByInternal('label', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByLabelDesc() {
    return addSortByInternal('label', Sort.desc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<FormField, FormField, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }
}

extension FormFieldQueryWhereDistinct
    on QueryBuilder<FormField, FormField, QDistinct> {
  QueryBuilder<FormField, FormField, QDistinct> distinctByError(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('error', caseSensitive: caseSensitive);
  }

  QueryBuilder<FormField, FormField, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<FormField, FormField, QDistinct> distinctByHint(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('hint', caseSensitive: caseSensitive);
  }

  QueryBuilder<FormField, FormField, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<FormField, FormField, QDistinct> distinctByIsValid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('isValid', caseSensitive: caseSensitive);
  }

  QueryBuilder<FormField, FormField, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }

  QueryBuilder<FormField, FormField, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('label', caseSensitive: caseSensitive);
  }

  QueryBuilder<FormField, FormField, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }
}

extension FormFieldQueryProperty
    on QueryBuilder<FormField, FormField, QQueryProperty> {
  QueryBuilder<FormField, String, QQueryOperations> errorProperty() {
    return addPropertyNameInternal('error');
  }

  QueryBuilder<FormField, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<FormField, String, QQueryOperations> hintProperty() {
    return addPropertyNameInternal('hint');
  }

  QueryBuilder<FormField, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<FormField, String, QQueryOperations> isValidProperty() {
    return addPropertyNameInternal('isValid');
  }

  QueryBuilder<FormField, String, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }

  QueryBuilder<FormField, String, QQueryOperations> labelProperty() {
    return addPropertyNameInternal('label');
  }

  QueryBuilder<FormField, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }
}
