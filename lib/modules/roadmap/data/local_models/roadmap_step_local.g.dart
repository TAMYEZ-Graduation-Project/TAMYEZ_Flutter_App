// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadmap_step_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRoadmapStepLocalCollection on Isar {
  IsarCollection<RoadmapStepLocal> get roadmapStepLocals => this.collection();
}

const RoadmapStepLocalSchema = CollectionSchema(
  name: r'RoadmapStepLocal',
  id: -1497353694413675374,
  properties: {
    r'careerId': PropertySchema(
      id: 0,
      name: r'careerId',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'order': PropertySchema(id: 2, name: r'order', type: IsarType.long),
    r'progressStatus': PropertySchema(
      id: 3,
      name: r'progressStatus',
      type: IsarType.byte,
      enumMap: _RoadmapStepLocalprogressStatusEnumValueMap,
    ),
    r'stepId': PropertySchema(id: 4, name: r'stepId', type: IsarType.string),
    r'title': PropertySchema(id: 5, name: r'title', type: IsarType.string),
    r'userId': PropertySchema(id: 6, name: r'userId', type: IsarType.string),
    r'v': PropertySchema(id: 7, name: r'v', type: IsarType.long),
  },

  estimateSize: _roadmapStepLocalEstimateSize,
  serialize: _roadmapStepLocalSerialize,
  deserialize: _roadmapStepLocalDeserialize,
  deserializeProp: _roadmapStepLocalDeserializeProp,
  idName: r'id',
  indexes: {
    r'stepId': IndexSchema(
      id: 8514370192842249260,
      name: r'stepId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'stepId',
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
    r'careerId': IndexSchema(
      id: 8511896529238945231,
      name: r'careerId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'careerId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'order': IndexSchema(
      id: 5897270977454184057,
      name: r'order',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'order',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _roadmapStepLocalGetId,
  getLinks: _roadmapStepLocalGetLinks,
  attach: _roadmapStepLocalAttach,
  version: '3.3.2',
);

int _roadmapStepLocalEstimateSize(
  RoadmapStepLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.careerId.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.stepId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _roadmapStepLocalSerialize(
  RoadmapStepLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.careerId);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.order);
  writer.writeByte(offsets[3], object.progressStatus.index);
  writer.writeString(offsets[4], object.stepId);
  writer.writeString(offsets[5], object.title);
  writer.writeString(offsets[6], object.userId);
  writer.writeLong(offsets[7], object.v);
}

RoadmapStepLocal _roadmapStepLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RoadmapStepLocal();
  object.careerId = reader.readString(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.id = id;
  object.order = reader.readLong(offsets[2]);
  object.progressStatus =
      _RoadmapStepLocalprogressStatusValueEnumMap[reader.readByteOrNull(
        offsets[3],
      )] ??
      RoadmapStepProgressStatusEnum.completed;
  object.stepId = reader.readString(offsets[4]);
  object.title = reader.readString(offsets[5]);
  object.userId = reader.readString(offsets[6]);
  object.v = reader.readLong(offsets[7]);
  return object;
}

P _roadmapStepLocalDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 3:
      return (_RoadmapStepLocalprogressStatusValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              RoadmapStepProgressStatusEnum.completed)
          as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RoadmapStepLocalprogressStatusEnumValueMap = {
  'completed': 0,
  'inProgress': 1,
  'available': 2,
  'lockedPrereq': 3,
  'disabledFrozen': 4,
};
const _RoadmapStepLocalprogressStatusValueEnumMap = {
  0: RoadmapStepProgressStatusEnum.completed,
  1: RoadmapStepProgressStatusEnum.inProgress,
  2: RoadmapStepProgressStatusEnum.available,
  3: RoadmapStepProgressStatusEnum.lockedPrereq,
  4: RoadmapStepProgressStatusEnum.disabledFrozen,
};

Id _roadmapStepLocalGetId(RoadmapStepLocal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _roadmapStepLocalGetLinks(RoadmapStepLocal object) {
  return [];
}

void _roadmapStepLocalAttach(
  IsarCollection<dynamic> col,
  Id id,
  RoadmapStepLocal object,
) {
  object.id = id;
}

extension RoadmapStepLocalQueryWhereSort
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QWhere> {
  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhere> anyOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'order'),
      );
    });
  }
}

extension RoadmapStepLocalQueryWhere
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QWhereClause> {
  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause> idBetween(
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  stepIdEqualTo(String stepId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'stepId', value: [stepId]),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  stepIdNotEqualTo(String stepId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stepId',
                lower: [],
                upper: [stepId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stepId',
                lower: [stepId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stepId',
                lower: [stepId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stepId',
                lower: [],
                upper: [stepId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  careerIdEqualTo(String careerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'careerId', value: [careerId]),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  careerIdNotEqualTo(String careerId) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  orderEqualTo(int order) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'order', value: [order]),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  orderNotEqualTo(int order) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'order',
                lower: [],
                upper: [order],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'order',
                lower: [order],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'order',
                lower: [order],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'order',
                lower: [],
                upper: [order],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  orderGreaterThan(int order, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'order',
          lower: [order],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  orderLessThan(int order, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'order',
          lower: [],
          upper: [order],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterWhereClause>
  orderBetween(
    int lowerOrder,
    int upperOrder, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'order',
          lower: [lowerOrder],
          includeLower: includeLower,
          upper: [upperOrder],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RoadmapStepLocalQueryFilter
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QFilterCondition> {
  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  careerIdEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  careerIdBetween(
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  careerIdMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  careerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'careerId', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  careerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'careerId', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  orderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'order', value: value),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  orderGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'order',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  orderLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'order',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  orderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'order',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  progressStatusEqualTo(RoadmapStepProgressStatusEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'progressStatus', value: value),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  progressStatusGreaterThan(
    RoadmapStepProgressStatusEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'progressStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  progressStatusLessThan(
    RoadmapStepProgressStatusEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'progressStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  progressStatusBetween(
    RoadmapStepProgressStatusEnum lower,
    RoadmapStepProgressStatusEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'progressStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stepId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stepId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stepId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stepId', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  stepIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stepId', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleLessThan(
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleBetween(
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  vEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'v', value: value),
      );
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  vGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  vLessThan(int value, {bool include = false}) {
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

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterFilterCondition>
  vBetween(
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

extension RoadmapStepLocalQueryObject
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QFilterCondition> {}

extension RoadmapStepLocalQueryLinks
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QFilterCondition> {}

extension RoadmapStepLocalQuerySortBy
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QSortBy> {
  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByCareerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'careerId', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByCareerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'careerId', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByProgressStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressStatus', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByProgressStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressStatus', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByStepId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepId', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByStepIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepId', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> sortByV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> sortByVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v', Sort.desc);
    });
  }
}

extension RoadmapStepLocalQuerySortThenBy
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QSortThenBy> {
  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByCareerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'careerId', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByCareerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'careerId', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByProgressStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressStatus', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByProgressStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progressStatus', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByStepId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepId', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByStepIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stepId', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> thenByV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v', Sort.asc);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QAfterSortBy> thenByVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'v', Sort.desc);
    });
  }
}

extension RoadmapStepLocalQueryWhereDistinct
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct> {
  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct>
  distinctByCareerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'careerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct>
  distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct>
  distinctByProgressStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progressStatus');
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct> distinctByStepId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stepId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct> distinctByUserId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QDistinct> distinctByV() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'v');
    });
  }
}

extension RoadmapStepLocalQueryProperty
    on QueryBuilder<RoadmapStepLocal, RoadmapStepLocal, QQueryProperty> {
  QueryBuilder<RoadmapStepLocal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RoadmapStepLocal, String, QQueryOperations> careerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'careerId');
    });
  }

  QueryBuilder<RoadmapStepLocal, String, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<RoadmapStepLocal, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<
    RoadmapStepLocal,
    RoadmapStepProgressStatusEnum,
    QQueryOperations
  >
  progressStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progressStatus');
    });
  }

  QueryBuilder<RoadmapStepLocal, String, QQueryOperations> stepIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stepId');
    });
  }

  QueryBuilder<RoadmapStepLocal, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<RoadmapStepLocal, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<RoadmapStepLocal, int, QQueryOperations> vProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'v');
    });
  }
}
