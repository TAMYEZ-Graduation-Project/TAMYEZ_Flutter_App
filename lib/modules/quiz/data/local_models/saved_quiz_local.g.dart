// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_quiz_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavedQuizLocalCollection on Isar {
  IsarCollection<SavedQuizLocal> get savedQuizLocals => this.collection();
}

const SavedQuizLocalSchema = CollectionSchema(
  name: r'SavedQuizLocal',
  id: 7628560135041338844,
  properties: {
    r'quizId': PropertySchema(
      id: 0,
      name: r'quizId',
      type: IsarType.object,

      target: r'QuizLocal',
    ),
    r'savedQuizId': PropertySchema(
      id: 1,
      name: r'savedQuizId',
      type: IsarType.string,
    ),
    r'score': PropertySchema(id: 2, name: r'score', type: IsarType.string),
    r'takenAt': PropertySchema(id: 3, name: r'takenAt', type: IsarType.string),
    r'userId': PropertySchema(id: 4, name: r'userId', type: IsarType.string),
  },

  estimateSize: _savedQuizLocalEstimateSize,
  serialize: _savedQuizLocalSerialize,
  deserialize: _savedQuizLocalDeserialize,
  deserializeProp: _savedQuizLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'savedQuizId': IndexSchema(
      id: 145155159037327559,
      name: r'savedQuizId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'savedQuizId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {r'QuizLocal': QuizLocalSchema},

  getId: _savedQuizLocalGetId,
  getLinks: _savedQuizLocalGetLinks,
  attach: _savedQuizLocalAttach,
  version: '3.3.2',
);

int _savedQuizLocalEstimateSize(
  SavedQuizLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 +
      QuizLocalSchema.estimateSize(
        object.quizId,
        allOffsets[QuizLocal]!,
        allOffsets,
      );
  bytesCount += 3 + object.savedQuizId.length * 3;
  bytesCount += 3 + object.score.length * 3;
  bytesCount += 3 + object.takenAt.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _savedQuizLocalSerialize(
  SavedQuizLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<QuizLocal>(
    offsets[0],
    allOffsets,
    QuizLocalSchema.serialize,
    object.quizId,
  );
  writer.writeString(offsets[1], object.savedQuizId);
  writer.writeString(offsets[2], object.score);
  writer.writeString(offsets[3], object.takenAt);
  writer.writeString(offsets[4], object.userId);
}

SavedQuizLocal _savedQuizLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedQuizLocal();
  object.id = id;
  object.quizId =
      reader.readObjectOrNull<QuizLocal>(
        offsets[0],
        QuizLocalSchema.deserialize,
        allOffsets,
      ) ??
      QuizLocal();
  object.savedQuizId = reader.readString(offsets[1]);
  object.score = reader.readString(offsets[2]);
  object.takenAt = reader.readString(offsets[3]);
  object.userId = reader.readString(offsets[4]);
  return object;
}

P _savedQuizLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<QuizLocal>(
                offset,
                QuizLocalSchema.deserialize,
                allOffsets,
              ) ??
              QuizLocal())
          as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedQuizLocalGetId(SavedQuizLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedQuizLocalGetLinks(SavedQuizLocal object) {
  return [];
}

void _savedQuizLocalAttach(
  IsarCollection<dynamic> col,
  Id id,
  SavedQuizLocal object,
) {
  object.id = id;
}

extension SavedQuizLocalQueryWhereSort
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QWhere> {
  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SavedQuizLocalQueryWhere
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QWhereClause> {
  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause>
  savedQuizIdEqualTo(String savedQuizId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'savedQuizId',
          value: [savedQuizId],
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause>
  savedQuizIdNotEqualTo(String savedQuizId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'savedQuizId',
                lower: [],
                upper: [savedQuizId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'savedQuizId',
                lower: [savedQuizId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'savedQuizId',
                lower: [savedQuizId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'savedQuizId',
                lower: [],
                upper: [savedQuizId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause> userIdEqualTo(
    String userId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterWhereClause>
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
}

extension SavedQuizLocalQueryFilter
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QFilterCondition> {
  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'savedQuizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'savedQuizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'savedQuizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'savedQuizId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'savedQuizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'savedQuizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'savedQuizId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'savedQuizId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'savedQuizId', value: ''),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  savedQuizIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'savedQuizId', value: ''),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'score',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'score',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'score',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'score',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'score',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'score',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'score',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'score',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'score', value: ''),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  scoreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'score', value: ''),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'takenAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'takenAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'takenAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'takenAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'takenAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'takenAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'takenAt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'takenAt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'takenAt', value: ''),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  takenAtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'takenAt', value: ''),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
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

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }
}

extension SavedQuizLocalQueryObject
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QFilterCondition> {
  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterFilterCondition> quizId(
    FilterQuery<QuizLocal> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'quizId');
    });
  }
}

extension SavedQuizLocalQueryLinks
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QFilterCondition> {}

extension SavedQuizLocalQuerySortBy
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QSortBy> {
  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy>
  sortBySavedQuizId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedQuizId', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy>
  sortBySavedQuizIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedQuizId', Sort.desc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> sortByTakenAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'takenAt', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy>
  sortByTakenAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'takenAt', Sort.desc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SavedQuizLocalQuerySortThenBy
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QSortThenBy> {
  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy>
  thenBySavedQuizId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedQuizId', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy>
  thenBySavedQuizIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedQuizId', Sort.desc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> thenByTakenAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'takenAt', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy>
  thenByTakenAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'takenAt', Sort.desc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension SavedQuizLocalQueryWhereDistinct
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QDistinct> {
  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QDistinct>
  distinctBySavedQuizId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedQuizId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QDistinct> distinctByScore({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QDistinct> distinctByTakenAt({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'takenAt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavedQuizLocal, SavedQuizLocal, QDistinct> distinctByUserId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension SavedQuizLocalQueryProperty
    on QueryBuilder<SavedQuizLocal, SavedQuizLocal, QQueryProperty> {
  QueryBuilder<SavedQuizLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedQuizLocal, QuizLocal, QQueryOperations> quizIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quizId');
    });
  }

  QueryBuilder<SavedQuizLocal, String, QQueryOperations> savedQuizIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedQuizId');
    });
  }

  QueryBuilder<SavedQuizLocal, String, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<SavedQuizLocal, String, QQueryOperations> takenAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'takenAt');
    });
  }

  QueryBuilder<SavedQuizLocal, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
