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
    String? userName,
    String? email,
    String? phoneNumber,
    String? profilePictureDataUrl,
    int? accessRole,
    int? fullCapacity,
    int? currentCapacity,
  })  : _id = id,
        _name = name,
        _picture = picture,
        _status = status,
        _firstName = firstName,
        _lastName = lastName,
        _isSelected = isSelected,
        _userName = userName,
        _email = email,
        _phoneNumber = phoneNumber,
        _profilePictureDataUrl = profilePictureDataUrl,
        _accessRole = accessRole,
        _fullCapacity = fullCapacity,
        _currentCapacity = currentCapacity;

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

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "profilePictureDataUrl" field.
  String? _profilePictureDataUrl;
  String get profilePictureDataUrl => _profilePictureDataUrl ?? '';
  set profilePictureDataUrl(String? val) => _profilePictureDataUrl = val;
  bool hasProfilePictureDataUrl() => _profilePictureDataUrl != null;

  // "accessRole" field.
  int? _accessRole;
  int get accessRole => _accessRole ?? 0;
  set accessRole(int? val) => _accessRole = val;
  void incrementAccessRole(int amount) => _accessRole = accessRole + amount;
  bool hasAccessRole() => _accessRole != null;

  // "fullCapacity" field.
  int? _fullCapacity;
  int get fullCapacity => _fullCapacity ?? 0;
  set fullCapacity(int? val) => _fullCapacity = val;
  void incrementFullCapacity(int amount) =>
      _fullCapacity = fullCapacity + amount;
  bool hasFullCapacity() => _fullCapacity != null;

  // "currentCapacity" field.
  int? _currentCapacity;
  int get currentCapacity => _currentCapacity ?? 0;
  set currentCapacity(int? val) => _currentCapacity = val;
  void incrementCurrentCapacity(int amount) =>
      _currentCapacity = currentCapacity + amount;
  bool hasCurrentCapacity() => _currentCapacity != null;

  static MemberModelStruct fromMap(Map<String, dynamic> data) =>
      MemberModelStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        picture: data['picture'] as String?,
        status: data['status'] as bool?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        isSelected: data['isSelected'] as bool?,
        userName: data['userName'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        profilePictureDataUrl: data['profilePictureDataUrl'] as String?,
        accessRole: castToType<int>(data['accessRole']),
        fullCapacity: castToType<int>(data['fullCapacity']),
        currentCapacity: castToType<int>(data['currentCapacity']),
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
        'userName': _userName,
        'email': _email,
        'phoneNumber': _phoneNumber,
        'profilePictureDataUrl': _profilePictureDataUrl,
        'accessRole': _accessRole,
        'fullCapacity': _fullCapacity,
        'currentCapacity': _currentCapacity,
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
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'profilePictureDataUrl': serializeParam(
          _profilePictureDataUrl,
          ParamType.String,
        ),
        'accessRole': serializeParam(
          _accessRole,
          ParamType.int,
        ),
        'fullCapacity': serializeParam(
          _fullCapacity,
          ParamType.int,
        ),
        'currentCapacity': serializeParam(
          _currentCapacity,
          ParamType.int,
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
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        profilePictureDataUrl: deserializeParam(
          data['profilePictureDataUrl'],
          ParamType.String,
          false,
        ),
        accessRole: deserializeParam(
          data['accessRole'],
          ParamType.int,
          false,
        ),
        fullCapacity: deserializeParam(
          data['fullCapacity'],
          ParamType.int,
          false,
        ),
        currentCapacity: deserializeParam(
          data['currentCapacity'],
          ParamType.int,
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
        isSelected == other.isSelected &&
        userName == other.userName &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        profilePictureDataUrl == other.profilePictureDataUrl &&
        accessRole == other.accessRole &&
        fullCapacity == other.fullCapacity &&
        currentCapacity == other.currentCapacity;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        picture,
        status,
        firstName,
        lastName,
        isSelected,
        userName,
        email,
        phoneNumber,
        profilePictureDataUrl,
        accessRole,
        fullCapacity,
        currentCapacity
      ]);
}

MemberModelStruct createMemberModelStruct({
  String? id,
  String? name,
  String? picture,
  bool? status,
  String? firstName,
  String? lastName,
  bool? isSelected,
  String? userName,
  String? email,
  String? phoneNumber,
  String? profilePictureDataUrl,
  int? accessRole,
  int? fullCapacity,
  int? currentCapacity,
}) =>
    MemberModelStruct(
      id: id,
      name: name,
      picture: picture,
      status: status,
      firstName: firstName,
      lastName: lastName,
      isSelected: isSelected,
      userName: userName,
      email: email,
      phoneNumber: phoneNumber,
      profilePictureDataUrl: profilePictureDataUrl,
      accessRole: accessRole,
      fullCapacity: fullCapacity,
      currentCapacity: currentCapacity,
    );
