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
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Auth/Login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
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
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/User/GetMy',
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
      alwaysAllowBody: false,
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
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Teams/GetPersonals',
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
      alwaysAllowBody: false,
    );
  }
}

class GetStatisticsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetStatisticsApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Dashboard/GetStatistics',
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
      alwaysAllowBody: false,
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
          'https://api.beyond.matterhr.com/api/v1/Dashboard/GetMyPriorities',
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
      alwaysAllowBody: false,
    );
  }

  static List? proioritesJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetMyTeamApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMyTeamApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Teams/GetMyTeam',
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
      alwaysAllowBody: false,
    );
  }

  static List? proioritesJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetMyProjectsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMyProjectsApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Dashboard/GetMyProjects',
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
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetProjectStatisticsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetProjectStatisticsApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Dashboard/GetProjectStatistics',
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
      alwaysAllowBody: false,
    );
  }

  static List? projectStatisticsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetMyProjectsCreationApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMyProjectsCreationApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Projects/GetMyProjects',
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
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAllClientsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllClientsApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Clients/GetAllClients',
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
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAllTeamsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllTeamsApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Teams/GetAllTeams',
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
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetTeamByIdApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTeamByIdApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Teams/GetTeamById',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAllProjectsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllProjectsApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Projects/GetAllProjects',
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
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetFinancialBudgetReportApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFinancialBudgetReportApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetFinancialBudgetReport',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'Year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetFinancialBudgetExcelApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFinancialBudgetExcelApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetFinancialBudget',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'Year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetFinancialProjectSummaryReportApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFinancialProjectSummaryReportApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetFinancialProjectSummaryReport',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'Year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetFinancialProjectSummaryExcelApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFinancialProjectSummaryExcelApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetFinancialProjectSummary',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'Year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetCostManagementActualIncomeReportApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCostManagementActualIncomeReportApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetCostManagementActualIncomeReport',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'Year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetCostManagementActualIncomeExcelApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCostManagementActualIncomeExcelApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetCostManagementActualIncome',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'Year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetFinancialResultsReportApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFinancialResultsReportApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetFinancialResultsReport',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'Year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetFinancialResultsExcelApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFinancialResultsExcelApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetFinancialResults',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'Year': year,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetAllCostsApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllCostsApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Projects/GetAllCosts?PageSize=1000',
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
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetMyProjectTrackersApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? fromDate = '',
    String? toDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetMyProjectTrackersApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Dashboard/GetMyProjectTrackers',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'FromDate': fromDate,
        'ToDate': toDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetFinancialBudgetTemplateApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? query = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFinancialBudgetTemplateApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Reports/GetFinancialBudgetTemplate',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? projectsJsonArray(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class UploadFileCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UploadFile',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Uploud/Create',
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
      alwaysAllowBody: false,
    );
  }
}

class UpdateYearBudgetApiCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? token = '',
    String? year = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateYearBudgetApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Reports/UpdateYearBudget',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      params: {
        'file': file,
        'year': year,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
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
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Clients/Post',
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
      alwaysAllowBody: false,
    );
  }
}

class AskForHelpApiCall {
  static Future<ApiCallResponse> call({
    String? message = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": "$message"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AskForHelpApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Teams/AskForHelp',
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
      alwaysAllowBody: false,
    );
  }
}

class ImAvailableApiCall {
  static Future<ApiCallResponse> call({
    String? message = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": "$message"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ImAvailableApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Teams/ImAvailable',
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
      alwaysAllowBody: false,
    );
  }
}

class SetNotificationTokenApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? notificationToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "notificationToken": "$notificationToken"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SetNotificationTokenApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Account/SetNotificationToken',
      callType: ApiCallType.PUT,
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
      alwaysAllowBody: false,
    );
  }
}

class CreateProjectApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? name = '',
    int? type,
    int? costBudget,
    String? countryCode = '',
    String? description = '',
    int? clientSatisfaction,
    String? startDate = '',
    String? endDate = '',
    int? clientId,
    int? teamId,
    String? seniorId = '',
    bool? seniorStatus,
    dynamic midManagersJson,
    dynamic associatesJson,
    dynamic milestonesJson,
    dynamic costsJson,
  }) async {
    final midManagers = _serializeJson(midManagersJson, true);
    final associates = _serializeJson(associatesJson, true);
    final milestones = _serializeJson(milestonesJson, true);
    final costs = _serializeJson(costsJson, true);
    final ffApiRequestBody = '''
{
  "name": "$name",
  "type": $type,
  "costBudget": $costBudget,
  "countryCode": "$countryCode",
  "description": "$description",
  "clientSatisfaction": $clientSatisfaction,
  "startDate": "$startDate",
  "endDate": "$endDate",
  "clientId": $clientId,
  "teamId": $teamId,
  "seniorId": "$seniorId",
  "seniorStatus": $seniorStatus,
  "midManagers": $midManagers,
  "associates": $associates,
  "milestones": $milestones,
  "costs": $costs
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateProjectApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Projects/Post',
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
      alwaysAllowBody: false,
    );
  }
}

class UpdateProjectApiCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? name = '',
    int? type,
    int? costBudget,
    String? countryCode = '',
    String? description = '',
    int? clientSatisfaction,
    String? startDate = '',
    String? endDate = '',
    int? clientId,
    int? teamId,
    String? seniorId = '',
    bool? seniorStatus,
    dynamic midManagersJson,
    dynamic associatesJson,
    dynamic milestonesJson,
    dynamic costsJson,
    int? id,
  }) async {
    final midManagers = _serializeJson(midManagersJson, true);
    final associates = _serializeJson(associatesJson, true);
    final milestones = _serializeJson(milestonesJson, true);
    final costs = _serializeJson(costsJson, true);
    final ffApiRequestBody = '''
{
  "id":$id,
  "name": "$name",
  "type": $type,
  "costBudget": $costBudget,
  "countryCode": "$countryCode",
  "description": "$description",
  "clientSatisfaction": $clientSatisfaction,
  "startDate": "$startDate",
  "endDate": "$endDate",
  "clientId": $clientId,
  "teamId": $teamId,
  "seniorId": "$seniorId",
  "seniorStatus": $seniorStatus,
  "midManagers": $midManagers,
  "associates": $associates,
  "milestones": $milestones,
  "costs": $costs
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateProjectApi',
      apiUrl: 'https://api.beyond.matterhr.com/api/v1/Projects/Put',
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
      alwaysAllowBody: false,
    );
  }
}

class UpdateCostStatusApiCall {
  static Future<ApiCallResponse> call({
    int? costId,
    bool? isApproved,
    String? token = '',
    String? notes = '',
    String? attachmentUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "costId": $costId,
  "isApproved": $isApproved,
  "notes": "$notes",
  "attachmentUrl": "$attachmentUrl"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateCostStatusApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Projects/UpdateCostStatus',
      callType: ApiCallType.PUT,
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
      alwaysAllowBody: false,
    );
  }
}

class UpdateAdminCostStatusApiCall {
  static Future<ApiCallResponse> call({
    int? costId,
    bool? isApproved,
    String? token = '',
    String? notes = '',
    String? attachmentUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "costId": $costId,
  "isApproved": $isApproved,
  "notes": "$notes",
  "attachmentUrl": "$attachmentUrl"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateAdminCostStatusApi',
      apiUrl:
          'https://api.beyond.matterhr.com/api/v1/Projects/UpdateAdminCostStatus',
      callType: ApiCallType.PUT,
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
      alwaysAllowBody: false,
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
