// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MilestoneModelStruct extends FFFirebaseStruct {
  MilestoneModelStruct({
    int? id,
    String? title,
    String? description,
    double? amount,
    int? reminderOffset,
    String? startDate,
    String? endDate,
    int? status,
    int? milestoneType,
    double? progress,
    String? invoiceUrl,
    int? invoiceStatus,
    MileStoneStateModelStruct? mileStoneStateModel,
    ReminderModelStruct? reminderModel,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _description = description,
        _amount = amount,
        _reminderOffset = reminderOffset,
        _startDate = startDate,
        _endDate = endDate,
        _status = status,
        _milestoneType = milestoneType,
        _progress = progress,
        _invoiceUrl = invoiceUrl,
        _invoiceStatus = invoiceStatus,
        _mileStoneStateModel = mileStoneStateModel,
        _reminderModel = reminderModel,
        super(firestoreUtilData);

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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;
  void incrementAmount(double amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "reminderOffset" field.
  int? _reminderOffset;
  int get reminderOffset => _reminderOffset ?? 0;
  set reminderOffset(int? val) => _reminderOffset = val;
  void incrementReminderOffset(int amount) =>
      _reminderOffset = reminderOffset + amount;
  bool hasReminderOffset() => _reminderOffset != null;

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

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;
  void incrementStatus(int amount) => _status = status + amount;
  bool hasStatus() => _status != null;

  // "milestoneType" field.
  int? _milestoneType;
  int get milestoneType => _milestoneType ?? 0;
  set milestoneType(int? val) => _milestoneType = val;
  void incrementMilestoneType(int amount) =>
      _milestoneType = milestoneType + amount;
  bool hasMilestoneType() => _milestoneType != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  set progress(double? val) => _progress = val;
  void incrementProgress(double amount) => _progress = progress + amount;
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

  // "mileStoneStateModel" field.
  MileStoneStateModelStruct? _mileStoneStateModel;
  MileStoneStateModelStruct get mileStoneStateModel =>
      _mileStoneStateModel ?? MileStoneStateModelStruct();
  set mileStoneStateModel(MileStoneStateModelStruct? val) =>
      _mileStoneStateModel = val;
  void updateMileStoneStateModel(
          Function(MileStoneStateModelStruct) updateFn) =>
      updateFn(_mileStoneStateModel ??= MileStoneStateModelStruct());
  bool hasMileStoneStateModel() => _mileStoneStateModel != null;

  // "reminderModel" field.
  ReminderModelStruct? _reminderModel;
  ReminderModelStruct get reminderModel =>
      _reminderModel ?? ReminderModelStruct();
  set reminderModel(ReminderModelStruct? val) => _reminderModel = val;
  void updateReminderModel(Function(ReminderModelStruct) updateFn) =>
      updateFn(_reminderModel ??= ReminderModelStruct());
  bool hasReminderModel() => _reminderModel != null;

  static MilestoneModelStruct fromMap(Map<String, dynamic> data) =>
      MilestoneModelStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        description: data['description'] as String?,
        amount: castToType<double>(data['amount']),
        reminderOffset: castToType<int>(data['reminderOffset']),
        startDate: data['startDate'] as String?,
        endDate: data['endDate'] as String?,
        status: castToType<int>(data['status']),
        milestoneType: castToType<int>(data['milestoneType']),
        progress: castToType<double>(data['progress']),
        invoiceUrl: data['invoiceUrl'] as String?,
        invoiceStatus: castToType<int>(data['invoiceStatus']),
        mileStoneStateModel:
            MileStoneStateModelStruct.maybeFromMap(data['mileStoneStateModel']),
        reminderModel: ReminderModelStruct.maybeFromMap(data['reminderModel']),
      );

  static MilestoneModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MilestoneModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'description': _description,
        'amount': _amount,
        'reminderOffset': _reminderOffset,
        'startDate': _startDate,
        'endDate': _endDate,
        'status': _status,
        'milestoneType': _milestoneType,
        'progress': _progress,
        'invoiceUrl': _invoiceUrl,
        'invoiceStatus': _invoiceStatus,
        'mileStoneStateModel': _mileStoneStateModel?.toMap(),
        'reminderModel': _reminderModel?.toMap(),
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'reminderOffset': serializeParam(
          _reminderOffset,
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
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'milestoneType': serializeParam(
          _milestoneType,
          ParamType.int,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.double,
        ),
        'invoiceUrl': serializeParam(
          _invoiceUrl,
          ParamType.String,
        ),
        'invoiceStatus': serializeParam(
          _invoiceStatus,
          ParamType.int,
        ),
        'mileStoneStateModel': serializeParam(
          _mileStoneStateModel,
          ParamType.DataStruct,
        ),
        'reminderModel': serializeParam(
          _reminderModel,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MilestoneModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MilestoneModelStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        reminderOffset: deserializeParam(
          data['reminderOffset'],
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
        status: deserializeParam(
          data['status'],
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
          ParamType.double,
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
        mileStoneStateModel: deserializeStructParam(
          data['mileStoneStateModel'],
          ParamType.DataStruct,
          false,
          structBuilder: MileStoneStateModelStruct.fromSerializableMap,
        ),
        reminderModel: deserializeStructParam(
          data['reminderModel'],
          ParamType.DataStruct,
          false,
          structBuilder: ReminderModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MilestoneModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MilestoneModelStruct &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        amount == other.amount &&
        reminderOffset == other.reminderOffset &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        status == other.status &&
        milestoneType == other.milestoneType &&
        progress == other.progress &&
        invoiceUrl == other.invoiceUrl &&
        invoiceStatus == other.invoiceStatus &&
        mileStoneStateModel == other.mileStoneStateModel &&
        reminderModel == other.reminderModel;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        description,
        amount,
        reminderOffset,
        startDate,
        endDate,
        status,
        milestoneType,
        progress,
        invoiceUrl,
        invoiceStatus,
        mileStoneStateModel,
        reminderModel
      ]);
}

MilestoneModelStruct createMilestoneModelStruct({
  int? id,
  String? title,
  String? description,
  double? amount,
  int? reminderOffset,
  String? startDate,
  String? endDate,
  int? status,
  int? milestoneType,
  double? progress,
  String? invoiceUrl,
  int? invoiceStatus,
  MileStoneStateModelStruct? mileStoneStateModel,
  ReminderModelStruct? reminderModel,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MilestoneModelStruct(
      id: id,
      title: title,
      description: description,
      amount: amount,
      reminderOffset: reminderOffset,
      startDate: startDate,
      endDate: endDate,
      status: status,
      milestoneType: milestoneType,
      progress: progress,
      invoiceUrl: invoiceUrl,
      invoiceStatus: invoiceStatus,
      mileStoneStateModel: mileStoneStateModel ??
          (clearUnsetFields ? MileStoneStateModelStruct() : null),
      reminderModel:
          reminderModel ?? (clearUnsetFields ? ReminderModelStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MilestoneModelStruct? updateMilestoneModelStruct(
  MilestoneModelStruct? milestoneModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    milestoneModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMilestoneModelStructData(
  Map<String, dynamic> firestoreData,
  MilestoneModelStruct? milestoneModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (milestoneModel == null) {
    return;
  }
  if (milestoneModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && milestoneModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final milestoneModelData =
      getMilestoneModelFirestoreData(milestoneModel, forFieldValue);
  final nestedData =
      milestoneModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = milestoneModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMilestoneModelFirestoreData(
  MilestoneModelStruct? milestoneModel, [
  bool forFieldValue = false,
]) {
  if (milestoneModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(milestoneModel.toMap());

  // Handle nested data for "mileStoneStateModel" field.
  addMileStoneStateModelStructData(
    firestoreData,
    milestoneModel.hasMileStoneStateModel()
        ? milestoneModel.mileStoneStateModel
        : null,
    'mileStoneStateModel',
    forFieldValue,
  );

  // Handle nested data for "reminderModel" field.
  addReminderModelStructData(
    firestoreData,
    milestoneModel.hasReminderModel() ? milestoneModel.reminderModel : null,
    'reminderModel',
    forFieldValue,
  );

  // Add any Firestore field values
  milestoneModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMilestoneModelListFirestoreData(
  List<MilestoneModelStruct>? milestoneModels,
) =>
    milestoneModels
        ?.map((e) => getMilestoneModelFirestoreData(e, true))
        .toList() ??
    [];
