// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectModelStruct extends BaseStruct {
  ProjectModelStruct({
    int? id,
    String? name,
    int? type,
    double? progress,
    double? costBudget,
    String? countryCode,
    String? description,
    int? clientSatisfaction,
    String? startDate,
    String? endDate,
    String? client,
    int? clientId,
    String? team,
    int? teamId,
    String? senior,
    String? seniorId,
    String? seniorPicture,
    bool? seniorStatus,
    String? clientLogo,
  })  : _id = id,
        _name = name,
        _type = type,
        _progress = progress,
        _costBudget = costBudget,
        _countryCode = countryCode,
        _description = description,
        _clientSatisfaction = clientSatisfaction,
        _startDate = startDate,
        _endDate = endDate,
        _client = client,
        _clientId = clientId,
        _team = team,
        _teamId = teamId,
        _senior = senior,
        _seniorId = seniorId,
        _seniorPicture = seniorPicture,
        _seniorStatus = seniorStatus,
        _clientLogo = clientLogo;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;
  void incrementType(int amount) => _type = type + amount;
  bool hasType() => _type != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  set progress(double? val) => _progress = val;
  void incrementProgress(double amount) => _progress = progress + amount;
  bool hasProgress() => _progress != null;

  // "costBudget" field.
  double? _costBudget;
  double get costBudget => _costBudget ?? 0.0;
  set costBudget(double? val) => _costBudget = val;
  void incrementCostBudget(double amount) => _costBudget = costBudget + amount;
  bool hasCostBudget() => _costBudget != null;

  // "countryCode" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  set countryCode(String? val) => _countryCode = val;
  bool hasCountryCode() => _countryCode != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "clientSatisfaction" field.
  int? _clientSatisfaction;
  int get clientSatisfaction => _clientSatisfaction ?? 0;
  set clientSatisfaction(int? val) => _clientSatisfaction = val;
  void incrementClientSatisfaction(int amount) =>
      _clientSatisfaction = clientSatisfaction + amount;
  bool hasClientSatisfaction() => _clientSatisfaction != null;

  // "startDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  set endDate(String? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "client" field.
  String? _client;
  String get client => _client ?? '';
  set client(String? val) => _client = val;
  bool hasClient() => _client != null;

  // "clientId" field.
  int? _clientId;
  int get clientId => _clientId ?? 0;
  set clientId(int? val) => _clientId = val;
  void incrementClientId(int amount) => _clientId = clientId + amount;
  bool hasClientId() => _clientId != null;

  // "team" field.
  String? _team;
  String get team => _team ?? '';
  set team(String? val) => _team = val;
  bool hasTeam() => _team != null;

  // "teamId" field.
  int? _teamId;
  int get teamId => _teamId ?? 0;
  set teamId(int? val) => _teamId = val;
  void incrementTeamId(int amount) => _teamId = teamId + amount;
  bool hasTeamId() => _teamId != null;

  // "senior" field.
  String? _senior;
  String get senior => _senior ?? '';
  set senior(String? val) => _senior = val;
  bool hasSenior() => _senior != null;

  // "seniorId" field.
  String? _seniorId;
  String get seniorId => _seniorId ?? '';
  set seniorId(String? val) => _seniorId = val;
  bool hasSeniorId() => _seniorId != null;

  // "seniorPicture" field.
  String? _seniorPicture;
  String get seniorPicture => _seniorPicture ?? '';
  set seniorPicture(String? val) => _seniorPicture = val;
  bool hasSeniorPicture() => _seniorPicture != null;

  // "seniorStatus" field.
  bool? _seniorStatus;
  bool get seniorStatus => _seniorStatus ?? false;
  set seniorStatus(bool? val) => _seniorStatus = val;
  bool hasSeniorStatus() => _seniorStatus != null;

  // "clientLogo" field.
  String? _clientLogo;
  String get clientLogo => _clientLogo ?? '';
  set clientLogo(String? val) => _clientLogo = val;
  bool hasClientLogo() => _clientLogo != null;

  static ProjectModelStruct fromMap(Map<String, dynamic> data) =>
      ProjectModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        type: castToType<int>(data['type']),
        progress: castToType<double>(data['progress']),
        costBudget: castToType<double>(data['costBudget']),
        countryCode: data['countryCode'] as String?,
        description: data['description'] as String?,
        clientSatisfaction: castToType<int>(data['clientSatisfaction']),
        startDate: data['startDate'] as String?,
        endDate: data['endDate'] as String?,
        client: data['client'] as String?,
        clientId: castToType<int>(data['clientId']),
        team: data['team'] as String?,
        teamId: castToType<int>(data['teamId']),
        senior: data['senior'] as String?,
        seniorId: data['seniorId'] as String?,
        seniorPicture: data['seniorPicture'] as String?,
        seniorStatus: data['seniorStatus'] as bool?,
        clientLogo: data['clientLogo'] as String?,
      );

  static ProjectModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProjectModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'type': _type,
        'progress': _progress,
        'costBudget': _costBudget,
        'countryCode': _countryCode,
        'description': _description,
        'clientSatisfaction': _clientSatisfaction,
        'startDate': _startDate,
        'endDate': _endDate,
        'client': _client,
        'clientId': _clientId,
        'team': _team,
        'teamId': _teamId,
        'senior': _senior,
        'seniorId': _seniorId,
        'seniorPicture': _seniorPicture,
        'seniorStatus': _seniorStatus,
        'clientLogo': _clientLogo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.double,
        ),
        'costBudget': serializeParam(
          _costBudget,
          ParamType.double,
        ),
        'countryCode': serializeParam(
          _countryCode,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'clientSatisfaction': serializeParam(
          _clientSatisfaction,
          ParamType.int,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.String,
        ),
        'client': serializeParam(
          _client,
          ParamType.String,
        ),
        'clientId': serializeParam(
          _clientId,
          ParamType.int,
        ),
        'team': serializeParam(
          _team,
          ParamType.String,
        ),
        'teamId': serializeParam(
          _teamId,
          ParamType.int,
        ),
        'senior': serializeParam(
          _senior,
          ParamType.String,
        ),
        'seniorId': serializeParam(
          _seniorId,
          ParamType.String,
        ),
        'seniorPicture': serializeParam(
          _seniorPicture,
          ParamType.String,
        ),
        'seniorStatus': serializeParam(
          _seniorStatus,
          ParamType.bool,
        ),
        'clientLogo': serializeParam(
          _clientLogo,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProjectModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        progress: deserializeParam(
          data['progress'],
          ParamType.double,
          false,
        ),
        costBudget: deserializeParam(
          data['costBudget'],
          ParamType.double,
          false,
        ),
        countryCode: deserializeParam(
          data['countryCode'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        clientSatisfaction: deserializeParam(
          data['clientSatisfaction'],
          ParamType.int,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['endDate'],
          ParamType.String,
          false,
        ),
        client: deserializeParam(
          data['client'],
          ParamType.String,
          false,
        ),
        clientId: deserializeParam(
          data['clientId'],
          ParamType.int,
          false,
        ),
        team: deserializeParam(
          data['team'],
          ParamType.String,
          false,
        ),
        teamId: deserializeParam(
          data['teamId'],
          ParamType.int,
          false,
        ),
        senior: deserializeParam(
          data['senior'],
          ParamType.String,
          false,
        ),
        seniorId: deserializeParam(
          data['seniorId'],
          ParamType.String,
          false,
        ),
        seniorPicture: deserializeParam(
          data['seniorPicture'],
          ParamType.String,
          false,
        ),
        seniorStatus: deserializeParam(
          data['seniorStatus'],
          ParamType.bool,
          false,
        ),
        clientLogo: deserializeParam(
          data['clientLogo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProjectModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectModelStruct &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        progress == other.progress &&
        costBudget == other.costBudget &&
        countryCode == other.countryCode &&
        description == other.description &&
        clientSatisfaction == other.clientSatisfaction &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        client == other.client &&
        clientId == other.clientId &&
        team == other.team &&
        teamId == other.teamId &&
        senior == other.senior &&
        seniorId == other.seniorId &&
        seniorPicture == other.seniorPicture &&
        seniorStatus == other.seniorStatus &&
        clientLogo == other.clientLogo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        type,
        progress,
        costBudget,
        countryCode,
        description,
        clientSatisfaction,
        startDate,
        endDate,
        client,
        clientId,
        team,
        teamId,
        senior,
        seniorId,
        seniorPicture,
        seniorStatus,
        clientLogo
      ]);
}

ProjectModelStruct createProjectModelStruct({
  int? id,
  String? name,
  int? type,
  double? progress,
  double? costBudget,
  String? countryCode,
  String? description,
  int? clientSatisfaction,
  String? startDate,
  String? endDate,
  String? client,
  int? clientId,
  String? team,
  int? teamId,
  String? senior,
  String? seniorId,
  String? seniorPicture,
  bool? seniorStatus,
  String? clientLogo,
}) =>
    ProjectModelStruct(
      id: id,
      name: name,
      type: type,
      progress: progress,
      costBudget: costBudget,
      countryCode: countryCode,
      description: description,
      clientSatisfaction: clientSatisfaction,
      startDate: startDate,
      endDate: endDate,
      client: client,
      clientId: clientId,
      team: team,
      teamId: teamId,
      senior: senior,
      seniorId: seniorId,
      seniorPicture: seniorPicture,
      seniorStatus: seniorStatus,
      clientLogo: clientLogo,
    );
