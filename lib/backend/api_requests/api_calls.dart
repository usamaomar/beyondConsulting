import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginApiCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{ "email" :"$email" , "password" :"$password" }''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/Auth/Login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic tokenJsonModel(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetMyDataApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMyDataApi',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/User/GetMy',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic userJsonModel(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetPersonalsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? startDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetPersonalsApi',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/Teams/GetPersonals',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'StartDate': startDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetStatisticsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetStatisticsApi',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/Dashboard/GetStatistics',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic statisticsJsonModel(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetMyPrioritiesApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMyPrioritiesApi',
      apiUrl:
          'https://beyond.api.matterhr.com/api/v1/Dashboard/GetMyPriorities',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic proioritesJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetMyProjectsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMyProjectsApi',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/Dashboard/GetMyProjects',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetProjectStatisticsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetProjectStatisticsApi',
      apiUrl:
          'https://beyond.api.matterhr.com/api/v1/Dashboard/GetProjectStatistics',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic projectStatisticsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetMyProjectsCreationApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMyProjectsCreationApi',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/Projects/GetMyProjects',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetAllClientsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllClientsApi',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/Clients/GetAllClients',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class UploadFileCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UploadFile',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/Uploud/Create',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateClintCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? phoneNumber = '',
    String? address = '',
    String? contactName = '',
    String? alternativePhoneNumber = '',
    String? logoImageUrl = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "$name",
  "email": "$email",
  "phoneNumber": "$phoneNumber",
  "address": "$address",
  "contactName": "$contactName",
  "alternativePhoneNumber": "$alternativePhoneNumber",
  "logoImageUrl": "$logoImageUrl"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateClint',
      apiUrl: 'https://beyond.api.matterhr.com/api/v1/Clients/Post',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
