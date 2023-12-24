// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatisticsModelStruct extends FFFirebaseStruct {
  StatisticsModelStruct({
    int? beyonders,
    int? teams,
    int? projects,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _beyonders = beyonders,
        _teams = teams,
        _projects = projects,
        super(firestoreUtilData);

  // "beyonders" field.
  int? _beyonders;
  int get beyonders => _beyonders ?? 0;
  set beyonders(int? val) => _beyonders = val;
  void incrementBeyonders(int amount) => _beyonders = beyonders + amount;
  bool hasBeyonders() => _beyonders != null;

  // "teams" field.
  int? _teams;
  int get teams => _teams ?? 0;
  set teams(int? val) => _teams = val;
  void incrementTeams(int amount) => _teams = teams + amount;
  bool hasTeams() => _teams != null;

  // "projects" field.
  int? _projects;
  int get projects => _projects ?? 0;
  set projects(int? val) => _projects = val;
  void incrementProjects(int amount) => _projects = projects + amount;
  bool hasProjects() => _projects != null;

  static StatisticsModelStruct fromMap(Map<String, dynamic> data) =>
      StatisticsModelStruct(
        beyonders: castToType<int>(data['beyonders']),
        teams: castToType<int>(data['teams']),
        projects: castToType<int>(data['projects']),
      );

  static StatisticsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? StatisticsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'beyonders': _beyonders,
        'teams': _teams,
        'projects': _projects,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'beyonders': serializeParam(
          _beyonders,
          ParamType.int,
        ),
        'teams': serializeParam(
          _teams,
          ParamType.int,
        ),
        'projects': serializeParam(
          _projects,
          ParamType.int,
        ),
      }.withoutNulls;

  static StatisticsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatisticsModelStruct(
        beyonders: deserializeParam(
          data['beyonders'],
          ParamType.int,
          false,
        ),
        teams: deserializeParam(
          data['teams'],
          ParamType.int,
          false,
        ),
        projects: deserializeParam(
          data['projects'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StatisticsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatisticsModelStruct &&
        beyonders == other.beyonders &&
        teams == other.teams &&
        projects == other.projects;
  }

  @override
  int get hashCode => const ListEquality().hash([beyonders, teams, projects]);
}

StatisticsModelStruct createStatisticsModelStruct({
  int? beyonders,
  int? teams,
  int? projects,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatisticsModelStruct(
      beyonders: beyonders,
      teams: teams,
      projects: projects,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatisticsModelStruct? updateStatisticsModelStruct(
  StatisticsModelStruct? statisticsModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    statisticsModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatisticsModelStructData(
  Map<String, dynamic> firestoreData,
  StatisticsModelStruct? statisticsModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statisticsModel == null) {
    return;
  }
  if (statisticsModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && statisticsModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statisticsModelData =
      getStatisticsModelFirestoreData(statisticsModel, forFieldValue);
  final nestedData =
      statisticsModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = statisticsModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatisticsModelFirestoreData(
  StatisticsModelStruct? statisticsModel, [
  bool forFieldValue = false,
]) {
  if (statisticsModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(statisticsModel.toMap());

  // Add any Firestore field values
  statisticsModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatisticsModelListFirestoreData(
  List<StatisticsModelStruct>? statisticsModels,
) =>
    statisticsModels
        ?.map((e) => getStatisticsModelFirestoreData(e, true))
        .toList() ??
    [];
