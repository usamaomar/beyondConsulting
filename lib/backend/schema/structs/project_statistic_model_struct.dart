// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectStatisticModelStruct extends FFFirebaseStruct {
  ProjectStatisticModelStruct({
    double? approvedPricing,
    double? approvedCost,
    double? profit,
    double? profitPercentage,
    bool? seniorStatus,
    String? lastUpdated,
    int? averageClientSatisfaction,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _approvedPricing = approvedPricing,
        _approvedCost = approvedCost,
        _profit = profit,
        _profitPercentage = profitPercentage,
        _seniorStatus = seniorStatus,
        _lastUpdated = lastUpdated,
        _averageClientSatisfaction = averageClientSatisfaction,
        super(firestoreUtilData);

  // "approvedPricing" field.
  double? _approvedPricing;
  double get approvedPricing => _approvedPricing ?? 0.0;
  set approvedPricing(double? val) => _approvedPricing = val;
  void incrementApprovedPricing(double amount) =>
      _approvedPricing = approvedPricing + amount;
  bool hasApprovedPricing() => _approvedPricing != null;

  // "approvedCost" field.
  double? _approvedCost;
  double get approvedCost => _approvedCost ?? 0.0;
  set approvedCost(double? val) => _approvedCost = val;
  void incrementApprovedCost(double amount) =>
      _approvedCost = approvedCost + amount;
  bool hasApprovedCost() => _approvedCost != null;

  // "profit" field.
  double? _profit;
  double get profit => _profit ?? 0.0;
  set profit(double? val) => _profit = val;
  void incrementProfit(double amount) => _profit = profit + amount;
  bool hasProfit() => _profit != null;

  // "profitPercentage" field.
  double? _profitPercentage;
  double get profitPercentage => _profitPercentage ?? 0.0;
  set profitPercentage(double? val) => _profitPercentage = val;
  void incrementProfitPercentage(double amount) =>
      _profitPercentage = profitPercentage + amount;
  bool hasProfitPercentage() => _profitPercentage != null;

  // "seniorStatus" field.
  bool? _seniorStatus;
  bool get seniorStatus => _seniorStatus ?? false;
  set seniorStatus(bool? val) => _seniorStatus = val;
  bool hasSeniorStatus() => _seniorStatus != null;

  // "lastUpdated" field.
  String? _lastUpdated;
  String get lastUpdated => _lastUpdated ?? '';
  set lastUpdated(String? val) => _lastUpdated = val;
  bool hasLastUpdated() => _lastUpdated != null;

  // "averageClientSatisfaction" field.
  int? _averageClientSatisfaction;
  int get averageClientSatisfaction => _averageClientSatisfaction ?? 0;
  set averageClientSatisfaction(int? val) => _averageClientSatisfaction = val;
  void incrementAverageClientSatisfaction(int amount) =>
      _averageClientSatisfaction = averageClientSatisfaction + amount;
  bool hasAverageClientSatisfaction() => _averageClientSatisfaction != null;

  static ProjectStatisticModelStruct fromMap(Map<String, dynamic> data) =>
      ProjectStatisticModelStruct(
        approvedPricing: castToType<double>(data['approvedPricing']),
        approvedCost: castToType<double>(data['approvedCost']),
        profit: castToType<double>(data['profit']),
        profitPercentage: castToType<double>(data['profitPercentage']),
        seniorStatus: data['seniorStatus'] as bool?,
        lastUpdated: data['lastUpdated'] as String?,
        averageClientSatisfaction:
            castToType<int>(data['averageClientSatisfaction']),
      );

  static ProjectStatisticModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectStatisticModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'approvedPricing': _approvedPricing,
        'approvedCost': _approvedCost,
        'profit': _profit,
        'profitPercentage': _profitPercentage,
        'seniorStatus': _seniorStatus,
        'lastUpdated': _lastUpdated,
        'averageClientSatisfaction': _averageClientSatisfaction,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'approvedPricing': serializeParam(
          _approvedPricing,
          ParamType.double,
        ),
        'approvedCost': serializeParam(
          _approvedCost,
          ParamType.double,
        ),
        'profit': serializeParam(
          _profit,
          ParamType.double,
        ),
        'profitPercentage': serializeParam(
          _profitPercentage,
          ParamType.double,
        ),
        'seniorStatus': serializeParam(
          _seniorStatus,
          ParamType.bool,
        ),
        'lastUpdated': serializeParam(
          _lastUpdated,
          ParamType.String,
        ),
        'averageClientSatisfaction': serializeParam(
          _averageClientSatisfaction,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProjectStatisticModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProjectStatisticModelStruct(
        approvedPricing: deserializeParam(
          data['approvedPricing'],
          ParamType.double,
          false,
        ),
        approvedCost: deserializeParam(
          data['approvedCost'],
          ParamType.double,
          false,
        ),
        profit: deserializeParam(
          data['profit'],
          ParamType.double,
          false,
        ),
        profitPercentage: deserializeParam(
          data['profitPercentage'],
          ParamType.double,
          false,
        ),
        seniorStatus: deserializeParam(
          data['seniorStatus'],
          ParamType.bool,
          false,
        ),
        lastUpdated: deserializeParam(
          data['lastUpdated'],
          ParamType.String,
          false,
        ),
        averageClientSatisfaction: deserializeParam(
          data['averageClientSatisfaction'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProjectStatisticModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectStatisticModelStruct &&
        approvedPricing == other.approvedPricing &&
        approvedCost == other.approvedCost &&
        profit == other.profit &&
        profitPercentage == other.profitPercentage &&
        seniorStatus == other.seniorStatus &&
        lastUpdated == other.lastUpdated &&
        averageClientSatisfaction == other.averageClientSatisfaction;
  }

  @override
  int get hashCode => const ListEquality().hash([
        approvedPricing,
        approvedCost,
        profit,
        profitPercentage,
        seniorStatus,
        lastUpdated,
        averageClientSatisfaction
      ]);
}

ProjectStatisticModelStruct createProjectStatisticModelStruct({
  double? approvedPricing,
  double? approvedCost,
  double? profit,
  double? profitPercentage,
  bool? seniorStatus,
  String? lastUpdated,
  int? averageClientSatisfaction,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectStatisticModelStruct(
      approvedPricing: approvedPricing,
      approvedCost: approvedCost,
      profit: profit,
      profitPercentage: profitPercentage,
      seniorStatus: seniorStatus,
      lastUpdated: lastUpdated,
      averageClientSatisfaction: averageClientSatisfaction,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectStatisticModelStruct? updateProjectStatisticModelStruct(
  ProjectStatisticModelStruct? projectStatisticModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectStatisticModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectStatisticModelStructData(
  Map<String, dynamic> firestoreData,
  ProjectStatisticModelStruct? projectStatisticModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectStatisticModel == null) {
    return;
  }
  if (projectStatisticModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      projectStatisticModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectStatisticModelData = getProjectStatisticModelFirestoreData(
      projectStatisticModel, forFieldValue);
  final nestedData =
      projectStatisticModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      projectStatisticModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectStatisticModelFirestoreData(
  ProjectStatisticModelStruct? projectStatisticModel, [
  bool forFieldValue = false,
]) {
  if (projectStatisticModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectStatisticModel.toMap());

  // Add any Firestore field values
  projectStatisticModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectStatisticModelListFirestoreData(
  List<ProjectStatisticModelStruct>? projectStatisticModels,
) =>
    projectStatisticModels
        ?.map((e) => getProjectStatisticModelFirestoreData(e, true))
        .toList() ??
    [];
