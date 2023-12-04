// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MemberModelStruct extends BaseStruct {
  MemberModelStruct({
    String? id,
    String? name,
    String? picture,
    bool? status,
    String? firstName,
    String? lastName,
    bool? isSelected,
  })  : _id = id,
        _name = name,
        _picture = picture,
        _status = status,
        _firstName = firstName,
        _lastName = lastName,
        _isSelected = isSelected;

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

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  set status(bool? val) => _status = val;
  bool hasStatus() => _status != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;
  bool hasLastName() => _lastName != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;
  bool hasIsSelected() => _isSelected != null;

  static MemberModelStruct fromMap(Map<String, dynamic> data) =>
      MemberModelStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        picture: data['picture'] as String?,
        status: data['status'] as bool?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        isSelected: data['isSelected'] as bool?,
      );

  static MemberModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MemberModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'picture': _picture,
        'status': _status,
        'firstName': _firstName,
        'lastName': _lastName,
        'isSelected': _isSelected,
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
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
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
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
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
        picture == other.picture &&
        status == other.status &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, picture, status, firstName, lastName, isSelected]);
}

MemberModelStruct createMemberModelStruct({
  String? id,
  String? name,
  String? picture,
  bool? status,
  String? firstName,
  String? lastName,
  bool? isSelected,
}) =>
    MemberModelStruct(
      id: id,
      name: name,
      picture: picture,
      status: status,
      firstName: firstName,
      lastName: lastName,
      isSelected: isSelected,
    );
