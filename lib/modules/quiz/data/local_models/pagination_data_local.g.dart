// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_data_local.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PaginationDataLocalSchema = Schema(
  name: r'PaginationDataLocal',
  id: -7354959042386232390,
  properties: {
    r'currentPage': PropertySchema(
      id: 0,
      name: r'currentPage',
      type: IsarType.long,
    ),
    r'size': PropertySchema(id: 1, name: r'size', type: IsarType.long),
    r'totalCount': PropertySchema(
      id: 2,
      name: r'totalCount',
      type: IsarType.long,
    ),
    r'totalPages': PropertySchema(
      id: 3,
      name: r'totalPages',
      type: IsarType.long,
    ),
  },

  estimateSize: _paginationDataLocalEstimateSize,
  serialize: _paginationDataLocalSerialize,
  deserialize: _paginationDataLocalDeserialize,
  deserializeProp: _paginationDataLocalDeserializeProp,
);

int _paginationDataLocalEstimateSize(
  PaginationDataLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _paginationDataLocalSerialize(
  PaginationDataLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentPage);
  writer.writeLong(offsets[1], object.size);
  writer.writeLong(offsets[2], object.totalCount);
  writer.writeLong(offsets[3], object.totalPages);
}

PaginationDataLocal _paginationDataLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PaginationDataLocal();
  object.currentPage = reader.readLong(offsets[0]);
  object.size = reader.readLong(offsets[1]);
  object.totalCount = reader.readLong(offsets[2]);
  object.totalPages = reader.readLong(offsets[3]);
  return object;
}

P _paginationDataLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PaginationDataLocalQueryFilter
    on
        QueryBuilder<
          PaginationDataLocal,
          PaginationDataLocal,
          QFilterCondition
        > {
  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  currentPageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentPage', value: value),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  currentPageGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentPage',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  currentPageLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentPage',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  currentPageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentPage',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  sizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'size', value: value),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  sizeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'size',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  sizeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'size',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  sizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'size',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  totalCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalCount', value: value),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  totalCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  totalCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  totalCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  totalPagesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalPages', value: value),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  totalPagesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalPages',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  totalPagesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalPages',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PaginationDataLocal, PaginationDataLocal, QAfterFilterCondition>
  totalPagesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalPages',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PaginationDataLocalQueryObject
    on
        QueryBuilder<
          PaginationDataLocal,
          PaginationDataLocal,
          QFilterCondition
        > {}
