// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_quizzes_pagination_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavedQuizzesPaginationLocalCollection on Isar {
  IsarCollection<SavedQuizzesPaginationLocal>
  get savedQuizzesPaginationLocals => this.collection();
}

const SavedQuizzesPaginationLocalSchema = CollectionSchema(
  name: r'SavedQuizzesPaginationLocal',
  id: -4634599179429847645,
  properties: {
    r'paginationData': PropertySchema(
      id: 0,
      name: r'paginationData',
      type: IsarType.object,

      target: r'PaginationDataLocal',
    ),
    r'savedAt': PropertySchema(id: 1, name: r'savedAt', type: IsarType.long),
    r'userId': PropertySchema(id: 2, name: r'userId', type: IsarType.string),
  },

  estimateSize: _savedQuizzesPaginationLocalEstimateSize,
  serialize: _savedQuizzesPaginationLocalSerialize,
  deserialize: _savedQuizzesPaginationLocalDeserialize,
  deserializeProp: _savedQuizzesPaginationLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {r'PaginationDataLocal': PaginationDataLocalSchema},

  getId: _savedQuizzesPaginationLocalGetId,
  getLinks: _savedQuizzesPaginationLocalGetLinks,
  attach: _savedQuizzesPaginationLocalAttach,
  version: '3.3.2',
);

int _savedQuizzesPaginationLocalEstimateSize(
  SavedQuizzesPaginationLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 +
      PaginationDataLocalSchema.estimateSize(
        object.paginationData,
        allOffsets[PaginationDataLocal]!,
        allOffsets,
      );
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _savedQuizzesPaginationLocalSerialize(
  SavedQuizzesPaginationLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<PaginationDataLocal>(
    offsets[0],
    allOffsets,
    PaginationDataLocalSchema.serialize,
    object.paginationData,
  );
  writer.writeLong(offsets[1], object.savedAt);
  writer.writeString(offsets[2], object.userId);
}

SavedQuizzesPaginationLocal _savedQuizzesPaginationLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedQuizzesPaginationLocal();
  object.id = id;
  object.paginationData =
      reader.readObjectOrNull<PaginationDataLocal>(
        offsets[0],
        PaginationDataLocalSchema.deserialize,
        allOffsets,
      ) ??
      PaginationDataLocal();
  object.savedAt = reader.readLong(offsets[1]);
  object.userId = reader.readString(offsets[2]);
  return object;
}

P _savedQuizzesPaginationLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<PaginationDataLocal>(
                offset,
                PaginationDataLocalSchema.deserialize,
                allOffsets,
              ) ??
              PaginationDataLocal())
          as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedQuizzesPaginationLocalGetId(SavedQuizzesPaginationLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedQuizzesPaginationLocalGetLinks(
  SavedQuizzesPaginationLocal object,
) {
  return [];
}

void _savedQuizzesPaginationLocalAttach(
  IsarCollection<dynamic> col,
  Id id,
  SavedQuizzesPaginationLocal object,
) {
  object.id = id;
}

extension SavedQuizzesPaginationLocalByIndex
    on IsarCollection<SavedQuizzesPaginationLocal> {
  Future<SavedQuizzesPaginationLocal?> getByUserId(String userId) {
    return getByIndex(r'userId', [userId]);
  }

  SavedQuizzesPaginationLocal? getByUserIdSync(String userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<SavedQuizzesPaginationLocal?>> getAllByUserId(
    List<String> userIdValues,
  ) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<SavedQuizzesPaginationLocal?> getAllByUserIdSync(
    List<String> userIdValues,
  ) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(SavedQuizzesPaginationLocal object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(
    SavedQuizzesPaginationLocal object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<SavedQuizzesPaginationLocal> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(
    List<SavedQuizzesPaginationLocal> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension SavedQuizzesPaginationLocalQueryWhereSort
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QWhere
        > {
  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhere
  >
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhere
  >
  anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }
}

extension SavedQuizzesPaginationLocalQueryWhere
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QWhereClause
        > {
  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  idNotEqualTo(Id id) {
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

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  idBetween(
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

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  userIdGreaterThan(String userId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userId',
          lower: [userId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  userIdLessThan(String userId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userId',
          lower: [],
          upper: [userId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  userIdBetween(
    String lowerUserId,
    String upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userId',
          lower: [lowerUserId],
          includeLower: includeLower,
          upper: [upperUserId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  userIdStartsWith(String UserIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userId',
          lower: [UserIdPrefix],
          upper: ['$UserIdPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: ['']),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterWhereClause
  >
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'userId', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'userId', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'userId', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'userId', upper: ['']),
            );
      }
    });
  }
}

extension SavedQuizzesPaginationLocalQueryFilter
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QFilterCondition
        > {
  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
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

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
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

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  idBetween(
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

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  savedAtEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'savedAt', value: value),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  savedAtLessThan(int value, {bool include = false}) {
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

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  savedAtBetween(
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

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension SavedQuizzesPaginationLocalQueryObject
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QFilterCondition
        > {
  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterFilterCondition
  >
  paginationData(FilterQuery<PaginationDataLocal> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'paginationData');
    });
  }
}

extension SavedQuizzesPaginationLocalQueryLinks
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QFilterCondition
        > {}

extension SavedQuizzesPaginationLocalQuerySortBy
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QSortBy
        > {
  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  sortBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.asc);
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  sortBySavedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.desc);
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SavedQuizzesPaginationLocalQuerySortThenBy
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QSortThenBy
        > {
  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  thenBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.asc);
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  thenBySavedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAt', Sort.desc);
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QAfterSortBy
  >
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SavedQuizzesPaginationLocalQueryWhereDistinct
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QDistinct
        > {
  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QDistinct
  >
  distinctBySavedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedAt');
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    SavedQuizzesPaginationLocal,
    QDistinct
  >
  distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension SavedQuizzesPaginationLocalQueryProperty
    on
        QueryBuilder<
          SavedQuizzesPaginationLocal,
          SavedQuizzesPaginationLocal,
          QQueryProperty
        > {
  QueryBuilder<SavedQuizzesPaginationLocal, int, QQueryOperations>
  idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<
    SavedQuizzesPaginationLocal,
    PaginationDataLocal,
    QQueryOperations
  >
  paginationDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paginationData');
    });
  }

  QueryBuilder<SavedQuizzesPaginationLocal, int, QQueryOperations>
  savedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedAt');
    });
  }

  QueryBuilder<SavedQuizzesPaginationLocal, String, QQueryOperations>
  userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
