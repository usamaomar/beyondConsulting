// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamTapModelStruct extends BaseStruct {
  TeamTapModelStruct({
    int? id,
    String? name,
    int? membersCount,
  })  : _id = id,
        _name = name,
        _membersCount = membersCount;

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

  static TeamTapModelStruct fromMap(Map<String, dynamic> data) =>
      TeamTapModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        membersCount: castToType<int>(data['membersCount']),
      );

  static TeamTapModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TeamTapModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'membersCount': _membersCount,
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
      }.withoutNulls;

  static TeamTapModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamTapModelStruct(
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
      );

  @override
  String toString() => 'TeamTapModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamTapModelStruct &&
        id == other.id &&
        name == other.name &&
        membersCount == other.membersCount;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, membersCount]);
}

TeamTapModelStruct createTeamTapModelStruct({
  int? id,
  String? name,
  int? membersCount,
}) =>
    TeamTapModelStruct(
      id: id,
      name: name,
      membersCount: membersCount,
    );
