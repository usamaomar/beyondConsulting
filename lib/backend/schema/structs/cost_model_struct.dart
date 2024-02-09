// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CostModelStruct extends BaseStruct {
  CostModelStruct({
    int? id,
    String? title,
    String? date,
    String? category,
    String? notes,
    double? unitCost,
    String? unit,
    double? duration,
    String? durationUnit,
    double? total,
    int? costStatus,
    int? costType,
    String? approvalNotes,
    String? attachmentUrl,
    int? adminCostStatus,
    String? adminApprovalNotes,
    String? adminAttachmentUrl,
    String? project,
    int? projectId,
    bool? isNew,
    bool? isUpdated,
  })  : _id = id,
        _title = title,
        _date = date,
        _category = category,
        _notes = notes,
        _unitCost = unitCost,
        _unit = unit,
        _duration = duration,
        _durationUnit = durationUnit,
        _total = total,
        _costStatus = costStatus,
        _costType = costType,
        _approvalNotes = approvalNotes,
        _attachmentUrl = attachmentUrl,
        _adminCostStatus = adminCostStatus,
        _adminApprovalNotes = adminApprovalNotes,
        _adminAttachmentUrl = adminAttachmentUrl,
        _project = project,
        _projectId = projectId,
        _isNew = isNew,
        _isUpdated = isUpdated;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "date" field.
  String? _date;
  String get date => _date?.addPlus() ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;
  bool hasNotes() => _notes != null;

  // "unitCost" field.
  double? _unitCost;
  double get unitCost => _unitCost ?? 0.0;
  set unitCost(double? val) => _unitCost = val;
  void incrementUnitCost(double amount) => _unitCost = unitCost + amount;
  bool hasUnitCost() => _unitCost != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  set duration(double? val) => _duration = val;
  void incrementDuration(double amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "durationUnit" field.
  String? _durationUnit;
  String get durationUnit => _durationUnit ?? '';
  set durationUnit(String? val) => _durationUnit = val;
  bool hasDurationUnit() => _durationUnit != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;
  void incrementTotal(double amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "costStatus" field.
  int? _costStatus;
  int get costStatus => _costStatus ?? 0;
  set costStatus(int? val) => _costStatus = val;
  void incrementCostStatus(int amount) => _costStatus = costStatus + amount;
  bool hasCostStatus() => _costStatus != null;

  // "costType" field.
  int? _costType;
  int get costType => _costType ?? 0;
  set costType(int? val) => _costType = val;
  void incrementCostType(int amount) => _costType = costType + amount;
  bool hasCostType() => _costType != null;

  // "approvalNotes" field.
  String? _approvalNotes;
  String get approvalNotes => _approvalNotes ?? '';
  set approvalNotes(String? val) => _approvalNotes = val;
  bool hasApprovalNotes() => _approvalNotes != null;

  // "attachmentUrl" field.
  String? _attachmentUrl;
  String get attachmentUrl => _attachmentUrl ?? '';
  set attachmentUrl(String? val) => _attachmentUrl = val;
  bool hasAttachmentUrl() => _attachmentUrl != null;

  // "adminCostStatus" field.
  int? _adminCostStatus;
  int get adminCostStatus => _adminCostStatus ?? 0;
  set adminCostStatus(int? val) => _adminCostStatus = val;
  void incrementAdminCostStatus(int amount) =>
      _adminCostStatus = adminCostStatus + amount;
  bool hasAdminCostStatus() => _adminCostStatus != null;

  // "adminApprovalNotes" field.
  String? _adminApprovalNotes;
  String get adminApprovalNotes => _adminApprovalNotes ?? '';
  set adminApprovalNotes(String? val) => _adminApprovalNotes = val;
  bool hasAdminApprovalNotes() => _adminApprovalNotes != null;

  // "adminAttachmentUrl" field.
  String? _adminAttachmentUrl;
  String get adminAttachmentUrl => _adminAttachmentUrl ?? '';
  set adminAttachmentUrl(String? val) => _adminAttachmentUrl = val;
  bool hasAdminAttachmentUrl() => _adminAttachmentUrl != null;

  // "project" field.
  String? _project;
  String get project => _project ?? '';
  set project(String? val) => _project = val;
  bool hasProject() => _project != null;

  // "projectId" field.
  int? _projectId;
  int get projectId => _projectId ?? 0;
  set projectId(int? val) => _projectId = val;
  void incrementProjectId(int amount) => _projectId = projectId + amount;
  bool hasProjectId() => _projectId != null;

  // "isNew" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  set isNew(bool? val) => _isNew = val;
  bool hasIsNew() => _isNew != null;

  // "isUpdated" field.
  bool? _isUpdated;
  bool get isUpdated => _isUpdated ?? false;
  set isUpdated(bool? val) => _isUpdated = val;
  bool hasIsUpdated() => _isUpdated != null;

  static CostModelStruct fromMap(Map<String, dynamic> data) => CostModelStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        date: data['date'] as String?,
        category: data['category'] as String?,
        notes: data['notes'] as String?,
        unitCost: castToType<double>(data['unitCost']),
        unit: data['unit'] as String?,
        duration: castToType<double>(data['duration']),
        durationUnit: data['durationUnit'] as String?,
        total: castToType<double>(data['total']),
        costStatus: castToType<int>(data['costStatus']),
        costType: castToType<int>(data['costType']),
        approvalNotes: data['approvalNotes'] as String?,
        attachmentUrl: data['attachmentUrl'] as String?,
        adminCostStatus: castToType<int>(data['adminCostStatus']),
        adminApprovalNotes: data['adminApprovalNotes'] as String?,
        adminAttachmentUrl: data['adminAttachmentUrl'] as String?,
        project: data['project'] as String?,
        projectId: castToType<int>(data['projectId']),
        isNew: data['isNew'] as bool?,
        isUpdated: data['isUpdated'] as bool?,
      );

  static CostModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CostModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'date': _date,
        'category': _category,
        'notes': _notes,
        'unitCost': _unitCost,
        'unit': _unit,
        'duration': _duration,
        'durationUnit': _durationUnit,
        'total': _total,
        'costStatus': _costStatus,
        'costType': _costType,
        'approvalNotes': _approvalNotes,
        'attachmentUrl': _attachmentUrl,
        'adminCostStatus': _adminCostStatus,
        'adminApprovalNotes': _adminApprovalNotes,
        'adminAttachmentUrl': _adminAttachmentUrl,
        'project': _project,
        'projectId': _projectId,
        'isNew': _isNew,
        'isUpdated': _isUpdated,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'unitCost': serializeParam(
          _unitCost,
          ParamType.double,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.double,
        ),
        'durationUnit': serializeParam(
          _durationUnit,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'costStatus': serializeParam(
          _costStatus,
          ParamType.int,
        ),
        'costType': serializeParam(
          _costType,
          ParamType.int,
        ),
        'approvalNotes': serializeParam(
          _approvalNotes,
          ParamType.String,
        ),
        'attachmentUrl': serializeParam(
          _attachmentUrl,
          ParamType.String,
        ),
        'adminCostStatus': serializeParam(
          _adminCostStatus,
          ParamType.int,
        ),
        'adminApprovalNotes': serializeParam(
          _adminApprovalNotes,
          ParamType.String,
        ),
        'adminAttachmentUrl': serializeParam(
          _adminAttachmentUrl,
          ParamType.String,
        ),
        'project': serializeParam(
          _project,
          ParamType.String,
        ),
        'projectId': serializeParam(
          _projectId,
          ParamType.int,
        ),
        'isNew': serializeParam(
          _isNew,
          ParamType.bool,
        ),
        'isUpdated': serializeParam(
          _isUpdated,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CostModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CostModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        unitCost: deserializeParam(
          data['unitCost'],
          ParamType.double,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.double,
          false,
        ),
        durationUnit: deserializeParam(
          data['durationUnit'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        costStatus: deserializeParam(
          data['costStatus'],
          ParamType.int,
          false,
        ),
        costType: deserializeParam(
          data['costType'],
          ParamType.int,
          false,
        ),
        approvalNotes: deserializeParam(
          data['approvalNotes'],
          ParamType.String,
          false,
        ),
        attachmentUrl: deserializeParam(
          data['attachmentUrl'],
          ParamType.String,
          false,
        ),
        adminCostStatus: deserializeParam(
          data['adminCostStatus'],
          ParamType.int,
          false,
        ),
        adminApprovalNotes: deserializeParam(
          data['adminApprovalNotes'],
          ParamType.String,
          false,
        ),
        adminAttachmentUrl: deserializeParam(
          data['adminAttachmentUrl'],
          ParamType.String,
          false,
        ),
        project: deserializeParam(
          data['project'],
          ParamType.String,
          false,
        ),
        projectId: deserializeParam(
          data['projectId'],
          ParamType.int,
          false,
        ),
        isNew: deserializeParam(
          data['isNew'],
          ParamType.bool,
          false,
        ),
        isUpdated: deserializeParam(
          data['isUpdated'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CostModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CostModelStruct &&
        id == other.id &&
        title == other.title &&
        date == other.date &&
        category == other.category &&
        notes == other.notes &&
        unitCost == other.unitCost &&
        unit == other.unit &&
        duration == other.duration &&
        durationUnit == other.durationUnit &&
        total == other.total &&
        costStatus == other.costStatus &&
        costType == other.costType &&
        approvalNotes == other.approvalNotes &&
        attachmentUrl == other.attachmentUrl &&
        adminCostStatus == other.adminCostStatus &&
        adminApprovalNotes == other.adminApprovalNotes &&
        adminAttachmentUrl == other.adminAttachmentUrl &&
        project == other.project &&
        projectId == other.projectId &&
        isNew == other.isNew &&
        isUpdated == other.isUpdated;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        date,
        category,
        notes,
        unitCost,
        unit,
        duration,
        durationUnit,
        total,
        costStatus,
        costType,
        approvalNotes,
        attachmentUrl,
        adminCostStatus,
        adminApprovalNotes,
        adminAttachmentUrl,
        project,
        projectId,
        isNew,
        isUpdated
      ]);
}

CostModelStruct createCostModelStruct({
  int? id,
  String? title,
  String? date,
  String? category,
  String? notes,
  double? unitCost,
  String? unit,
  double? duration,
  String? durationUnit,
  double? total,
  int? costStatus,
  int? costType,
  String? approvalNotes,
  String? attachmentUrl,
  int? adminCostStatus,
  String? adminApprovalNotes,
  String? adminAttachmentUrl,
  String? project,
  int? projectId,
  bool? isNew,
  bool? isUpdated,
}) =>
    CostModelStruct(
      id: id,
      title: title,
      date: date,
      category: category,
      notes: notes,
      unitCost: unitCost,
      unit: unit,
      duration: duration,
      durationUnit: durationUnit,
      total: total,
      costStatus: costStatus,
      costType: costType,
      approvalNotes: approvalNotes,
      attachmentUrl: attachmentUrl,
      adminCostStatus: adminCostStatus,
      adminApprovalNotes: adminApprovalNotes,
      adminAttachmentUrl: adminAttachmentUrl,
      project: project,
      projectId: projectId,
      isNew: isNew,
      isUpdated: isUpdated,
    );
