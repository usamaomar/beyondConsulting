// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrioritieModelStruct extends BaseStruct {
  PrioritieModelStruct({
    int? mileStoneId,
    int? projectId,
    String? projectName,
    String? client,
    int? clientId,
    String? clientLogo,
    String? description,
    int? status,
    String? title,
    int? amount,
    int? reminderOffset,
    int? milestoneType,
    int? progress,
    String? invoiceUrl,
    int? invoiceStatus,
    List<MemberModelStruct>? members,
    String? startDate,
    String? endDate,
  })  : _mileStoneId = mileStoneId,
        _projectId = projectId,
        _projectName = projectName,
        _client = client,
        _clientId = clientId,
        _clientLogo = clientLogo,
        _description = description,
        _status = status,
        _title = title,
        _amount = amount,
        _reminderOffset = reminderOffset,
        _milestoneType = milestoneType,
        _progress = progress,
        _invoiceUrl = invoiceUrl,
        _invoiceStatus = invoiceStatus,
        _members = members,
        _startDate = startDate,
        _endDate = endDate;

  // "mileStoneId" field.
  int? _mileStoneId;
  int get mileStoneId => _mileStoneId ?? 0;
  set mileStoneId(int? val) => _mileStoneId = val;
  void incrementMileStoneId(int amount) => _mileStoneId = mileStoneId + amount;
  bool hasMileStoneId() => _mileStoneId != null;

  // "projectId" field.
  int? _projectId;
  int get projectId => _projectId ?? 0;
  set projectId(int? val) => _projectId = val;
  void incrementProjectId(int amount) => _projectId = projectId + amount;
  bool hasProjectId() => _projectId != null;

  // "projectName" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;
  bool hasProjectName() => _projectName != null;

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

  // "clientLogo" field.
  String? _clientLogo;
  String get clientLogo => _clientLogo ?? '';
  set clientLogo(String? val) => _clientLogo = val;
  bool hasClientLogo() => _clientLogo != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;
  void incrementAmount(int amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "reminderOffset" field.
  int? _reminderOffset;
  int get reminderOffset => _reminderOffset ?? 0;
  set reminderOffset(int? val) => _reminderOffset = val;
  void incrementReminderOffset(int amount) =>
      _reminderOffset = reminderOffset + amount;
  bool hasReminderOffset() => _reminderOffset != null;

  // "milestoneType" field.
  int? _milestoneType;
  int get milestoneType => _milestoneType ?? 0;
  set milestoneType(int? val) => _milestoneType = val;
  void incrementMilestoneType(int amount) =>
      _milestoneType = milestoneType + amount;
  bool hasMilestoneType() => _milestoneType != null;

  // "progress" field.
  int? _progress;
  int get progress => _progress ?? 0;
  set progress(int? val) => _progress = val;
  void incrementProgress(int amount) => _progress = progress + amount;
  bool hasProgress() => _progress != null;

  // "invoiceUrl" field.
  String? _invoiceUrl;
  String get invoiceUrl => _invoiceUrl ?? '';
  set invoiceUrl(String? val) => _invoiceUrl = val;
  bool hasInvoiceUrl() => _invoiceUrl != null;

  // "invoiceStatus" field.
  int? _invoiceStatus;
  int get invoiceStatus => _invoiceStatus ?? 0;
  set invoiceStatus(int? val) => _invoiceStatus = val;
  void incrementInvoiceStatus(int amount) =>
      _invoiceStatus = invoiceStatus + amount;
  bool hasInvoiceStatus() => _invoiceStatus != null;

  // "members" field.
  List<MemberModelStruct>? _members;
  List<MemberModelStruct> get members => _members ?? const [];
  set members(List<MemberModelStruct>? val) => _members = val;
  void updateMembers(Function(List<MemberModelStruct>) updateFn) =>
      updateFn(_members ??= []);
  bool hasMembers() => _members != null;

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

  static PrioritieModelStruct fromMap(Map<String, dynamic> data) =>
      PrioritieModelStruct(
        mileStoneId: castToType<int>(data['mileStoneId']),
        projectId: castToType<int>(data['projectId']),
        projectName: data['projectName'] as String?,
        client: data['client'] as String?,
        clientId: castToType<int>(data['clientId']),
        clientLogo: data['clientLogo'] as String?,
        description: data['description'] as String?,
        status: castToType<int>(data['status']),
        title: data['title'] as String?,
        amount: castToType<int>(data['amount']),
        reminderOffset: castToType<int>(data['reminderOffset']),
        milestoneType: castToType<int>(data['milestoneType']),
        progress: castToType<int>(data['progress']),
        invoiceUrl: data['invoiceUrl'] as String?,
        invoiceStatus: castToType<int>(data['invoiceStatus']),
        members: getStructList(
          data['members'],
          MemberModelStruct.fromMap,
        ),
        startDate: data['startDate'] as String?,
        endDate: data['endDate'] as String?,
      );

  static PrioritieModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PrioritieModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'mileStoneId': _mileStoneId,
        'projectId': _projectId,
        'projectName': _projectName,
        'client': _client,
        'clientId': _clientId,
        'clientLogo': _clientLogo,
        'description': _description,
        'status': _status,
        'title': _title,
        'amount': _amount,
        'reminderOffset': _reminderOffset,
        'milestoneType': _milestoneType,
        'progress': _progress,
        'invoiceUrl': _invoiceUrl,
        'invoiceStatus': _invoiceStatus,
        'members': _members?.map((e) => e.toMap()).toList(),
        'startDate': _startDate,
        'endDate': _endDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mileStoneId': serializeParam(
          _mileStoneId,
          ParamType.int,
        ),
        'projectId': serializeParam(
          _projectId,
          ParamType.int,
        ),
        'projectName': serializeParam(
          _projectName,
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
        'clientLogo': serializeParam(
          _clientLogo,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'reminderOffset': serializeParam(
          _reminderOffset,
          ParamType.int,
        ),
        'milestoneType': serializeParam(
          _milestoneType,
          ParamType.int,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.int,
        ),
        'invoiceUrl': serializeParam(
          _invoiceUrl,
          ParamType.String,
        ),
        'invoiceStatus': serializeParam(
          _invoiceStatus,
          ParamType.int,
        ),
        'members': serializeParam(
          _members,
          ParamType.DataStruct,
          true,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static PrioritieModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrioritieModelStruct(
        mileStoneId: deserializeParam(
          data['mileStoneId'],
          ParamType.int,
          false,
        ),
        projectId: deserializeParam(
          data['projectId'],
          ParamType.int,
          false,
        ),
        projectName: deserializeParam(
          data['projectName'],
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
        clientLogo: deserializeParam(
          data['clientLogo'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        reminderOffset: deserializeParam(
          data['reminderOffset'],
          ParamType.int,
          false,
        ),
        milestoneType: deserializeParam(
          data['milestoneType'],
          ParamType.int,
          false,
        ),
        progress: deserializeParam(
          data['progress'],
          ParamType.int,
          false,
        ),
        invoiceUrl: deserializeParam(
          data['invoiceUrl'],
          ParamType.String,
          false,
        ),
        invoiceStatus: deserializeParam(
          data['invoiceStatus'],
          ParamType.int,
          false,
        ),
        members: deserializeStructParam<MemberModelStruct>(
          data['members'],
          ParamType.DataStruct,
          true,
          structBuilder: MemberModelStruct.fromSerializableMap,
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
      );

  @override
  String toString() => 'PrioritieModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PrioritieModelStruct &&
        mileStoneId == other.mileStoneId &&
        projectId == other.projectId &&
        projectName == other.projectName &&
        client == other.client &&
        clientId == other.clientId &&
        clientLogo == other.clientLogo &&
        description == other.description &&
        status == other.status &&
        title == other.title &&
        amount == other.amount &&
        reminderOffset == other.reminderOffset &&
        milestoneType == other.milestoneType &&
        progress == other.progress &&
        invoiceUrl == other.invoiceUrl &&
        invoiceStatus == other.invoiceStatus &&
        listEquality.equals(members, other.members) &&
        startDate == other.startDate &&
        endDate == other.endDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        mileStoneId,
        projectId,
        projectName,
        client,
        clientId,
        clientLogo,
        description,
        status,
        title,
        amount,
        reminderOffset,
        milestoneType,
        progress,
        invoiceUrl,
        invoiceStatus,
        members,
        startDate,
        endDate
      ]);
}

PrioritieModelStruct createPrioritieModelStruct({
  int? mileStoneId,
  int? projectId,
  String? projectName,
  String? client,
  int? clientId,
  String? clientLogo,
  String? description,
  int? status,
  String? title,
  int? amount,
  int? reminderOffset,
  int? milestoneType,
  int? progress,
  String? invoiceUrl,
  int? invoiceStatus,
  String? startDate,
  String? endDate,
}) =>
    PrioritieModelStruct(
      mileStoneId: mileStoneId,
      projectId: projectId,
      projectName: projectName,
      client: client,
      clientId: clientId,
      clientLogo: clientLogo,
      description: description,
      status: status,
      title: title,
      amount: amount,
      reminderOffset: reminderOffset,
      milestoneType: milestoneType,
      progress: progress,
      invoiceUrl: invoiceUrl,
      invoiceStatus: invoiceStatus,
      startDate: startDate,
      endDate: endDate,
    );
