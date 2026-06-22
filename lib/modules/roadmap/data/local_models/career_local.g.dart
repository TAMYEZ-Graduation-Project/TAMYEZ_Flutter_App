// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCareerLocalCollection on Isar {
  IsarCollection<CareerLocal> get careerLocals => this.collection();
}

const CareerLocalSchema = CollectionSchema(
  name: r'CareerLocal',
  id: 6491476672072581020,
  properties: {
    r'careerId': PropertySchema(
      id: 0,
      name: r'careerId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(id: 3, name: r'isActive', type: IsarType.bool),
    r'percentageCompleted': PropertySchema(
      id: 4,
      name: r'percentageCompleted',
      type: IsarType.long,
    ),
    r'pictureUrl': PropertySchema(
      id: 5,
      name: r'pictureUrl',
      type: IsarType.string,
    ),
    r'savedAt': PropertySchema(id: 6, name: r'savedAt', type: IsarType.long),
    r'slug': PropertySchema(id: 7, name: r'slug', type: IsarType.string),
    r'stepsCount': PropertySchema(
      id: 8,
      name: r'stepsCount',
      type: IsarType.long,
    ),
    r'title': PropertySchema(id: 9, name: r'title', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.string,
    ),
    r'v': PropertySchema(id: 11, name: r'v', type: IsarType.long),
  },

  estimateSize: _careerLocalEstimateSize,
  serialize: _careerLocalSerialize,
  deserialize: _careerLocalDeserialize,
  deserializeProp: _careerLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'careerId': IndexSchema(
      id: 8511896529238945231,
      name: r'careerId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'careerId',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _careerLocalGetId,
  getLinks: _careerLocalGetLinks,
  attach: _careerLocalAttach,
  version: '3.3.2',
);

int _careerLocalEstimateSize(
  CareerLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.careerId.length * 3;
  bytesCount += 3 + object.createdAt.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.pictureUrl.length * 3;
  bytesCount += 3 + object.slug.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.updatedAt.length * 3;
  return bytesCount;
}

void _careerLocalSerialize(
  CareerLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.careerId);
  writer.writeString(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeBool(offsets[3], object.isActive);
  writer.writeLong(offsets[4], object.percentageCompleted);
  writer.writeString(offsets[5], object.pictureUrl);
  writer.writeLong(offsets[6], object.savedAt);
  writer.writeString(offsets[7], object.slug);
  writer.writeLong(offsets[8], object.stepsCount);
  writer.writeString(offsets[9], object.title);
  writer.writeString(offsets[10], object.updatedAt);
  writer.writeLong(offsets[11], object.v);
}

CareerLocal _careerLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CareerLocal();
  object.careerId = reader.readString(offsets[0]);
  object.createdAt = reader.readString(offsets[1]);
  object.description = reader.readString(offsets[2]);
  object.id = id;
  object.isActive = reader.readBool(offsets[3]);
  object.percentageCompleted = reader.readLong(offsets[4]);
  object.pictureUrl = reader.readString(offsets[5]);
  object.savedAt = reader.readLong(offsets[6]);
  object.slug = reader.readString(offsets[7]);
  object.stepsCount = reader.readLong(offsets[8]);
  object.title = reader.readString(offsets[9]);
  object.updatedAt = reader.readString(offsets[10]);
  object.v = reader.readLong(offsets[11]);
  return object;
}

P _careerLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _careerLocalGetId(CareerLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _careerLocalGetLinks(CareerLocal object) {
  return [];
}

void _careerLocalAttach(
  IsarCollection<dynamic> col,
  Id id,
  CareerLocal object,
) {
  object.id = id;
}

extension CareerLocalByIndex on IsarCollection<CareerLocal> {
  Future<CareerLocal?> getByCareerId(String careerId) {
    return getByIndex(r'careerId', [careerId]);
  }

  CareerLocal? getByCareerIdSync(String careerId) {
    return getByIndexSync(r'careerId', [careerId]);
  }

  Future<bool> deleteByCareerId(String careerId) {
    return deleteByIndex(r'careerId', [careerId]);
  }

  bool deleteByCareerIdSync(String careerId) {
    return deleteByIndexSync(r'careerId', [careerId]);
  }

  Future<List<CareerLocal?>> getAllByCareerId(List<String> careerIdValues) {
    final values = careerIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'careerId', values);
  }

  List<CareerLocal?> getAllByCareerIdSync(List<String> careerIdValues) {
    final values = careerIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'careerId', values);
  }

  Future<int> deleteAllByCareerId(List<String> careerIdValues) {
    final values = careerIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'careerId', values);
  }

  int deleteAllByCareerIdSync(List<String> careerIdValues) {
    final values = careerIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'careerId', values);
  }

  Future<Id> putByCareerId(CareerLocal object) {
    return putByIndex(r'careerId', object);
  }

  Id putByCareerIdSync(CareerLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'careerId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCareerId(List<CareerLocal> objects) {
    return putAllByIndex(r'careerId', objects);
  }

  List<Id> putAllByCareerIdSync(
    List<CareerLocal> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'careerId', objects, saveLinks: saveLinks);
  }

  Future<CareerLocal?> getByTitle(String title) {
    return getByIndex(r'title', [title]);
  }

  CareerLocal? getByTitleSync(String title) {
    return getByIndexSync(r'title', [title]);
  }

  Future<bool> deleteByTitle(String title) {
    return deleteByIndex(r'title', [title]);
  }

  bool deleteByTitleSync(String title) {
    return deleteByIndexSync(r'title', [title]);
  }

  Future<List<CareerLocal?>> getAllByTitle(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return getAllByIndex(r'title', values);
  }

  List<CareerLocal?> getAllByTitleSync(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'title', values);
  }

  Future<int> deleteAllByTitle(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'title', values);
  }

  int deleteAllByTitleSync(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'title', values);
  }

  Future<Id> putByTitle(CareerLocal object) {
    return putByIndex(r'title', object);
  }

  Id putByTitleSync(CareerLocal object, {bool saveLinks = true}) {
    return putByIndexSync(r'title', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTitle(List<CareerLocal> objects) {
    return putAllByIndex(r'title', objects);
  }

  List<Id> putAllByTitleSync(
    List<CareerLocal> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'title', objects, saveLinks: saveLinks);
  }
}

extension CareerLocalQueryWhereSort
    on QueryBuilder<CareerLocal, CareerLocal, QWhere> {
  QueryBuilder<CareerLocal, CareerLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhere> anyCareerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'careerId'),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhere> anyTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'title'),
      );
    });
  }
}

extension CareerLocalQueryWhere
    on QueryBuilder<CareerLocal, CareerLocal, QWhereClause> {
  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> careerIdEqualTo(
    String careerId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'careerId', value: [careerId]),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> careerIdNotEqualTo(
    String careerId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'careerId',
                lower: [],
                upper: [careerId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'careerId',
                lower: [careerId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'careerId',
                lower: [careerId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'careerId',
                lower: [],
                upper: [careerId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> careerIdGreaterThan(
    String careerId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'careerId',
          lower: [careerId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> careerIdLessThan(
    String careerId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'careerId',
          lower: [],
          upper: [careerId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> careerIdBetween(
    String lowerCareerId,
    String upperCareerId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'careerId',
          lower: [lowerCareerId],
          includeLower: includeLower,
          upper: [upperCareerId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> careerIdStartsWith(
    String CareerIdPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'careerId',
          lower: [CareerIdPrefix],
          upper: ['$CareerIdPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> careerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'careerId', value: ['']),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause>
  careerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'careerId', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'careerId', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'careerId', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'careerId', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> titleEqualTo(
    String title,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: [title]),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> titleNotEqualTo(
    String title,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> titleGreaterThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [title],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> titleLessThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [],
          upper: [title],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> titleBetween(
    String lowerTitle,
    String upperTitle, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [lowerTitle],
          includeLower: includeLower,
          upper: [upperTitle],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> titleStartsWith(
    String TitlePrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [TitlePrefix],
          upper: ['$TitlePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: ['']),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterWhereClause> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            );
      }
    });
  }
}

extension CareerLocalQueryFilter
    on QueryBuilder<CareerLocal, CareerLocal, QFilterCondition> {
  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> careerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'careerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  careerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'careerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  careerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'careerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> careerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'careerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  careerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'careerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  careerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'careerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  careerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'careerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> careerIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'careerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  careerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'careerId', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  careerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'careerId', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'createdAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'createdAt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  createdAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'createdAt', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> isActiveEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  percentageCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'percentageCompleted', value: value),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  percentageCompletedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'percentageCompleted',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  percentageCompletedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'percentageCompleted',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  percentageCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'percentageCompleted',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pictureUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pictureUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pictureUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pictureUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'pictureUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'pictureUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'pictureUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'pictureUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'pictureUrl', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  pictureUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'pictureUrl', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> savedAtEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'savedAt', value: value),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  savedAtGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'savedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> savedAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'savedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> savedAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'savedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'slug',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'slug',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'slug',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'slug',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'slug',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'slug',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'slug',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'slug',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> slugIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'slug', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  slugIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'slug', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  stepsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stepsCount', value: value),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  stepsCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stepsCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  stepsCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stepsCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  stepsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stepsCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'updatedAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'updatedAt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition>
  updatedAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'updatedAt', value: ''),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> vEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'v', value: value),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> vGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'v',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> vLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'v',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterFilterCondition> vBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'v',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CareerLocalQueryObject
    on QueryBuilder<CareerLocal, CareerLocal, QFilterCondition> {}

extension CareerLocalQueryLinks
    on QueryBuilder<CareerLocal, CareerLocal, QFilterCondition> {}

extension CareerLocalQuerySortBy
    on QueryBuilder<CareerLocal, CareerLocal, QSortBy> {
  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByCareerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'careerId', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByCareerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'careerId', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy>
  sortByPercentageCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percentageCompleted', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy>
  sortByPercentageCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percentageCompleted', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByPictureUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureUrl', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByPictureUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureUrl', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortBySavedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortBySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortBySlugDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByStepsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepsCount', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByStepsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepsCount', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> sortByVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v', Sort.desc);
    });
  }
}

extension CareerLocalQuerySortThenBy
    on QueryBuilder<CareerLocal, CareerLocal, QSortThenBy> {
  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByCareerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'careerId', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByCareerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'careerId', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy>
  thenByPercentageCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percentageCompleted', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy>
  thenByPercentageCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'percentageCompleted', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByPictureUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureUrl', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByPictureUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureUrl', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenBySavedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenBySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenBySlugDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByStepsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepsCount', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByStepsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepsCount', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v', Sort.asc);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QAfterSortBy> thenByVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v', Sort.desc);
    });
  }
}

extension CareerLocalQueryWhereDistinct
    on QueryBuilder<CareerLocal, CareerLocal, QDistinct> {
  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByCareerId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'careerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByCreatedAt({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct>
  distinctByPercentageCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'percentageCompleted');
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByPictureUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pictureUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedAt');
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctBySlug({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'slug', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByStepsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stepsCount');
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByUpdatedAt({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CareerLocal, CareerLocal, QDistinct> distinctByV() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'v');
    });
  }
}

extension CareerLocalQueryProperty
    on QueryBuilder<CareerLocal, CareerLocal, QQueryProperty> {
  QueryBuilder<CareerLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CareerLocal, String, QQueryOperations> careerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'careerId');
    });
  }

  QueryBuilder<CareerLocal, String, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<CareerLocal, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<CareerLocal, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<CareerLocal, int, QQueryOperations>
  percentageCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'percentageCompleted');
    });
  }

  QueryBuilder<CareerLocal, String, QQueryOperations> pictureUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pictureUrl');
    });
  }

  QueryBuilder<CareerLocal, int, QQueryOperations> savedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedAt');
    });
  }

  QueryBuilder<CareerLocal, String, QQueryOperations> slugProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'slug');
    });
  }

  QueryBuilder<CareerLocal, int, QQueryOperations> stepsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stepsCount');
    });
  }

  QueryBuilder<CareerLocal, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<CareerLocal, String, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<CareerLocal, int, QQueryOperations> vProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'v');
    });
  }
}
