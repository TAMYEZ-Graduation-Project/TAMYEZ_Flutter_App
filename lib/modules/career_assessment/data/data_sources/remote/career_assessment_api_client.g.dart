// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_assessment_api_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _CareerAssessmentApiClient implements CareerAssessmentApiClient {
  _CareerAssessmentApiClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<GetQuizQuestionsResponseDto> getCareerAssessmentQuestions(
      bool discardActiveAttempt,) async {
    final _extra = <String, dynamic>{'requiresAuth': true};
    final queryParameters = <String, dynamic>{
      r'discardActiveAttempt': discardActiveAttempt,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<GetQuizQuestionsResponseDto>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
        _dio.options,
        'quiz/questions/CareerAssessment',
        queryParameters: queryParameters,
        data: _data,
      )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GetQuizQuestionsResponseDto _value;
    try {
      _value = GetQuizQuestionsResponseDto.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<CheckCareerAssessmentAnswersResponse> checkCareerAssessmentAnswers(
      String quizAttemptId,
      CheckQuestionAnswersRequest request,) async {
    final _extra = <String, dynamic>{'requiresAuth': true};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<CheckCareerAssessmentAnswersResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
        _dio.options,
        'career/${quizAttemptId}/check-assessment',
        queryParameters: queryParameters,
        data: _data,
      )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<dynamic>(_options);
    late CheckCareerAssessmentAnswersResponse _value;
    try {
      _value = CheckCareerAssessmentAnswersResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ChooseSuggestedCareerResponse> chooseSuggestedCareer(
      String suggestedCareerId,) async {
    final _extra = <String, dynamic>{'requiresAuth': true};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ChooseSuggestedCareerResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
        _dio.options,
        'career/${suggestedCareerId}/choose-suggested-career',
        queryParameters: queryParameters,
        data: _data,
      )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ChooseSuggestedCareerResponse _value;
    try {
      _value = ChooseSuggestedCareerResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<CareerDetailsResponse> getCareerDetails(String careerId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<CareerDetailsResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
        _dio.options,
        'career/${careerId}',
        queryParameters: queryParameters,
        data: _data,
      )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<dynamic>(_options);
    late CareerDetailsResponse _value;
    try {
      _value = CareerDetailsResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl
        .trim()
        .isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
