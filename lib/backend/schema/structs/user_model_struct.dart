// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends BaseStruct {
  UserModelStruct({
    String? id,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? isActive,
    String? emailConfirmed,
    String? phoneNumber,
    String? supervisorId,
    String? supervisorName,
    String? notificationToken,
    int? accessRole,
    String? profilePictureDataUrl,
  })  : _id = id,
        _userName = userName,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _isActive = isActive,
        _emailConfirmed = emailConfirmed,
        _phoneNumber = phoneNumber,
        _supervisorId = supervisorId,
        _supervisorName = supervisorName,
        _notificationToken = notificationToken,
        _accessRole = accessRole,
        _profilePictureDataUrl = profilePictureDataUrl;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "isActive" field.
  String? _isActive;
  String get isActive => _isActive ?? '';
  set isActive(String? val) => _isActive = val;
  bool hasIsActive() => _isActive != null;

  // "emailConfirmed" field.
  String? _emailConfirmed;
  String get emailConfirmed => _emailConfirmed ?? '';
  set emailConfirmed(String? val) => _emailConfirmed = val;
  bool hasEmailConfirmed() => _emailConfirmed != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "supervisorId" field.
  String? _supervisorId;
  String get supervisorId => _supervisorId ?? '';
  set supervisorId(String? val) => _supervisorId = val;
  bool hasSupervisorId() => _supervisorId != null;

  // "supervisorName" field.
  String? _supervisorName;
  String get supervisorName => _supervisorName ?? '';
  set supervisorName(String? val) => _supervisorName = val;
  bool hasSupervisorName() => _supervisorName != null;

  // "notificationToken" field.
  String? _notificationToken;
  String get notificationToken => _notificationToken ?? '';
  set notificationToken(String? val) => _notificationToken = val;
  bool hasNotificationToken() => _notificationToken != null;

  // "accessRole" field.
  int? _accessRole;
  int get accessRole => _accessRole ?? 0;
  set accessRole(int? val) => _accessRole = val;
  void incrementAccessRole(int amount) => _accessRole = accessRole + amount;
  bool hasAccessRole() => _accessRole != null;

  // "profilePictureDataUrl" field.
  String? _profilePictureDataUrl;
  String get profilePictureDataUrl => _profilePictureDataUrl ?? '';
  set profilePictureDataUrl(String? val) => _profilePictureDataUrl = val;
  bool hasProfilePictureDataUrl() => _profilePictureDataUrl != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        id: data['id'] as String?,
        userName: data['userName'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        email: data['email'] as String?,
        isActive: data['isActive'] as String?,
        emailConfirmed: data['emailConfirmed'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        supervisorId: data['supervisorId'] as String?,
        supervisorName: data['supervisorName'] as String?,
        notificationToken: data['notificationToken'] as String?,
        accessRole: castToType<int>(data['accessRole']),
        profilePictureDataUrl: data['profilePictureDataUrl'] as String?,
      );

  static UserModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userName': _userName,
        'firstName': _firstName,
        'lastName': _lastName,
        'email': _email,
        'isActive': _isActive,
        'emailConfirmed': _emailConfirmed,
        'phoneNumber': _phoneNumber,
        'supervisorId': _supervisorId,
        'supervisorName': _supervisorName,
        'notificationToken': _notificationToken,
        'accessRole': _accessRole,
        'profilePictureDataUrl': _profilePictureDataUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'isActive': serializeParam(
          _isActive,
          ParamType.String,
        ),
        'emailConfirmed': serializeParam(
          _emailConfirmed,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'supervisorId': serializeParam(
          _supervisorId,
          ParamType.String,
        ),
        'supervisorName': serializeParam(
          _supervisorName,
          ParamType.String,
        ),
        'notificationToken': serializeParam(
          _notificationToken,
          ParamType.String,
        ),
        'accessRole': serializeParam(
          _accessRole,
          ParamType.int,
        ),
        'profilePictureDataUrl': serializeParam(
          _profilePictureDataUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
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
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        isActive: deserializeParam(
          data['isActive'],
          ParamType.String,
          false,
        ),
        emailConfirmed: deserializeParam(
          data['emailConfirmed'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        supervisorId: deserializeParam(
          data['supervisorId'],
          ParamType.String,
          false,
        ),
        supervisorName: deserializeParam(
          data['supervisorName'],
          ParamType.String,
          false,
        ),
        notificationToken: deserializeParam(
          data['notificationToken'],
          ParamType.String,
          false,
        ),
        accessRole: deserializeParam(
          data['accessRole'],
          ParamType.int,
          false,
        ),
        profilePictureDataUrl: deserializeParam(
          data['profilePictureDataUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserModelStruct &&
        id == other.id &&
        userName == other.userName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        isActive == other.isActive &&
        emailConfirmed == other.emailConfirmed &&
        phoneNumber == other.phoneNumber &&
        supervisorId == other.supervisorId &&
        supervisorName == other.supervisorName &&
        notificationToken == other.notificationToken &&
        accessRole == other.accessRole &&
        profilePictureDataUrl == other.profilePictureDataUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userName,
        firstName,
        lastName,
        email,
        isActive,
        emailConfirmed,
        phoneNumber,
        supervisorId,
        supervisorName,
        notificationToken,
        accessRole,
        profilePictureDataUrl
      ]);
}

UserModelStruct createUserModelStruct({
  String? id,
  String? userName,
  String? firstName,
  String? lastName,
  String? email,
  String? isActive,
  String? emailConfirmed,
  String? phoneNumber,
  String? supervisorId,
  String? supervisorName,
  String? notificationToken,
  int? accessRole,
  String? profilePictureDataUrl,
}) =>
    UserModelStruct(
      id: id,
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      isActive: isActive,
      emailConfirmed: emailConfirmed,
      phoneNumber: phoneNumber,
      supervisorId: supervisorId,
      supervisorName: supervisorName,
      notificationToken: notificationToken,
      accessRole: accessRole,
      profilePictureDataUrl: profilePictureDataUrl,
    );
