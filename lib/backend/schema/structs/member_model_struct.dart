// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberModelStruct extends BaseStruct {
  MemberModelStruct({
    String? id,
    String? name,
    String? picture,
  })  : _id = id,
        _name = name,
        _picture = picture;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "picture" field.
  String? _picture;
  String get picture => _picture ?? '';
  set picture(String? val) => _picture = val;
  bool hasPicture() => _picture != null;

  static MemberModelStruct fromMap(Map<String, dynamic> data) =>
      MemberModelStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        picture: data['picture'] as String?,
      );

  static MemberModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MemberModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'picture': _picture,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'picture': serializeParam(
          _picture,
          ParamType.String,
        ),
      }.withoutNulls;

  static MemberModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MemberModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        picture: deserializeParam(
          data['picture'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MemberModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MemberModelStruct &&
        id == other.id &&
        name == other.name &&
        picture == other.picture;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, picture]);
}

MemberModelStruct createMemberModelStruct({
  String? id,
  String? name,
  String? picture,
}) =>
    MemberModelStruct(
      id: id,
      name: name,
      picture: picture,
    );
