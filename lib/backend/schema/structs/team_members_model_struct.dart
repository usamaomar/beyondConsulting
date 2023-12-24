// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamMembersModelStruct extends FFFirebaseStruct {
  TeamMembersModelStruct({
    int? id,
    String? name,
    int? membersCount,
    List<MemberModelStruct>? seniors,
    List<MemberModelStruct>? members,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _membersCount = membersCount,
        _seniors = seniors,
        _members = members,
        super(firestoreUtilData);

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

  // "membersCount" field.
  int? _membersCount;
  int get membersCount => _membersCount ?? 0;
  set membersCount(int? val) => _membersCount = val;
  void incrementMembersCount(int amount) =>
      _membersCount = membersCount + amount;
  bool hasMembersCount() => _membersCount != null;

  // "seniors" field.
  List<MemberModelStruct>? _seniors;
  List<MemberModelStruct> get seniors => _seniors ?? const [];
  set seniors(List<MemberModelStruct>? val) => _seniors = val;
  void updateSeniors(Function(List<MemberModelStruct>) updateFn) =>
      updateFn(_seniors ??= []);
  bool hasSeniors() => _seniors != null;

  // "members" field.
  List<MemberModelStruct>? _members;
  List<MemberModelStruct> get members => _members ?? const [];
  set members(List<MemberModelStruct>? val) => _members = val;
  void updateMembers(Function(List<MemberModelStruct>) updateFn) =>
      updateFn(_members ??= []);
  bool hasMembers() => _members != null;

  static TeamMembersModelStruct fromMap(Map<String, dynamic> data) =>
      TeamMembersModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        membersCount: castToType<int>(data['membersCount']),
        seniors: getStructList(
          data['seniors'],
          MemberModelStruct.fromMap,
        ),
        members: getStructList(
          data['members'],
          MemberModelStruct.fromMap,
        ),
      );

  static TeamMembersModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TeamMembersModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'membersCount': _membersCount,
        'seniors': _seniors?.map((e) => e.toMap()).toList(),
        'members': _members?.map((e) => e.toMap()).toList(),
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
        'membersCount': serializeParam(
          _membersCount,
          ParamType.int,
        ),
        'seniors': serializeParam(
          _seniors,
          ParamType.DataStruct,
          true,
        ),
        'members': serializeParam(
          _members,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static TeamMembersModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TeamMembersModelStruct(
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
        membersCount: deserializeParam(
          data['membersCount'],
          ParamType.int,
          false,
        ),
        seniors: deserializeStructParam<MemberModelStruct>(
          data['seniors'],
          ParamType.DataStruct,
          true,
          structBuilder: MemberModelStruct.fromSerializableMap,
        ),
        members: deserializeStructParam<MemberModelStruct>(
          data['members'],
          ParamType.DataStruct,
          true,
          structBuilder: MemberModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TeamMembersModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TeamMembersModelStruct &&
        id == other.id &&
        name == other.name &&
        membersCount == other.membersCount &&
        listEquality.equals(seniors, other.seniors) &&
        listEquality.equals(members, other.members);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, membersCount, seniors, members]);
}

TeamMembersModelStruct createTeamMembersModelStruct({
  int? id,
  String? name,
  int? membersCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamMembersModelStruct(
      id: id,
      name: name,
      membersCount: membersCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamMembersModelStruct? updateTeamMembersModelStruct(
  TeamMembersModelStruct? teamMembersModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teamMembersModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamMembersModelStructData(
  Map<String, dynamic> firestoreData,
  TeamMembersModelStruct? teamMembersModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teamMembersModel == null) {
    return;
  }
  if (teamMembersModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && teamMembersModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamMembersModelData =
      getTeamMembersModelFirestoreData(teamMembersModel, forFieldValue);
  final nestedData =
      teamMembersModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = teamMembersModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamMembersModelFirestoreData(
  TeamMembersModelStruct? teamMembersModel, [
  bool forFieldValue = false,
]) {
  if (teamMembersModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teamMembersModel.toMap());

  // Add any Firestore field values
  teamMembersModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamMembersModelListFirestoreData(
  List<TeamMembersModelStruct>? teamMembersModels,
) =>
    teamMembersModels
        ?.map((e) => getTeamMembersModelFirestoreData(e, true))
        .toList() ??
    [];
