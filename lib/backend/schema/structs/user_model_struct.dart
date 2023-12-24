// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends FFFirebaseStruct {
  UserModelStruct({
    String? id,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? supervisorId,
    String? supervisorName,
    String? notificationToken,
    int? accessRole,
    String? profilePictureDataUrl,
    bool? isActive,
    bool? emailConfirmed,
    int? fullCapacity,
    int? currentCapacity,
    bool? isSelected,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _userName = userName,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _phoneNumber = phoneNumber,
        _supervisorId = supervisorId,
        _supervisorName = supervisorName,
        _notificationToken = notificationToken,
        _accessRole = accessRole,
        _profilePictureDataUrl = profilePictureDataUrl,
        _isActive = isActive,
        _emailConfirmed = emailConfirmed,
        _fullCapacity = fullCapacity,
        _currentCapacity = currentCapacity,
        _isSelected = isSelected,
        super(firestoreUtilData);

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

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;
  bool hasIsActive() => _isActive != null;

  // "emailConfirmed" field.
  bool? _emailConfirmed;
  bool get emailConfirmed => _emailConfirmed ?? false;
  set emailConfirmed(bool? val) => _emailConfirmed = val;
  bool hasEmailConfirmed() => _emailConfirmed != null;

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

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;
  bool hasIsSelected() => _isSelected != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        id: data['id'] as String?,
        userName: data['userName'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        supervisorId: data['supervisorId'] as String?,
        supervisorName: data['supervisorName'] as String?,
        notificationToken: data['notificationToken'] as String?,
        accessRole: castToType<int>(data['accessRole']),
        profilePictureDataUrl: data['profilePictureDataUrl'] as String?,
        isActive: data['isActive'] as bool?,
        emailConfirmed: data['emailConfirmed'] as bool?,
        fullCapacity: castToType<int>(data['fullCapacity']),
        currentCapacity: castToType<int>(data['currentCapacity']),
        isSelected: data['isSelected'] as bool?,
      );

  static UserModelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userName': _userName,
        'firstName': _firstName,
        'lastName': _lastName,
        'email': _email,
        'phoneNumber': _phoneNumber,
        'supervisorId': _supervisorId,
        'supervisorName': _supervisorName,
        'notificationToken': _notificationToken,
        'accessRole': _accessRole,
        'profilePictureDataUrl': _profilePictureDataUrl,
        'isActive': _isActive,
        'emailConfirmed': _emailConfirmed,
        'fullCapacity': _fullCapacity,
        'currentCapacity': _currentCapacity,
        'isSelected': _isSelected,
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
        'isActive': serializeParam(
          _isActive,
          ParamType.bool,
        ),
        'emailConfirmed': serializeParam(
          _emailConfirmed,
          ParamType.bool,
        ),
        'fullCapacity': serializeParam(
          _fullCapacity,
          ParamType.int,
        ),
        'currentCapacity': serializeParam(
          _currentCapacity,
          ParamType.int,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
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
        isActive: deserializeParam(
          data['isActive'],
          ParamType.bool,
          false,
        ),
        emailConfirmed: deserializeParam(
          data['emailConfirmed'],
          ParamType.bool,
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
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
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
        phoneNumber == other.phoneNumber &&
        supervisorId == other.supervisorId &&
        supervisorName == other.supervisorName &&
        notificationToken == other.notificationToken &&
        accessRole == other.accessRole &&
        profilePictureDataUrl == other.profilePictureDataUrl &&
        isActive == other.isActive &&
        emailConfirmed == other.emailConfirmed &&
        fullCapacity == other.fullCapacity &&
        currentCapacity == other.currentCapacity &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userName,
        firstName,
        lastName,
        email,
        phoneNumber,
        supervisorId,
        supervisorName,
        notificationToken,
        accessRole,
        profilePictureDataUrl,
        isActive,
        emailConfirmed,
        fullCapacity,
        currentCapacity,
        isSelected
      ]);
}

UserModelStruct createUserModelStruct({
  String? id,
  String? userName,
  String? firstName,
  String? lastName,
  String? email,
  String? phoneNumber,
  String? supervisorId,
  String? supervisorName,
  String? notificationToken,
  int? accessRole,
  String? profilePictureDataUrl,
  bool? isActive,
  bool? emailConfirmed,
  int? fullCapacity,
  int? currentCapacity,
  bool? isSelected,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserModelStruct(
      id: id,
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      supervisorId: supervisorId,
      supervisorName: supervisorName,
      notificationToken: notificationToken,
      accessRole: accessRole,
      profilePictureDataUrl: profilePictureDataUrl,
      isActive: isActive,
      emailConfirmed: emailConfirmed,
      fullCapacity: fullCapacity,
      currentCapacity: currentCapacity,
      isSelected: isSelected,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserModelStruct? updateUserModelStruct(
  UserModelStruct? userModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserModelStructData(
  Map<String, dynamic> firestoreData,
  UserModelStruct? userModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userModel == null) {
    return;
  }
  if (userModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userModelData = getUserModelFirestoreData(userModel, forFieldValue);
  final nestedData = userModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserModelFirestoreData(
  UserModelStruct? userModel, [
  bool forFieldValue = false,
]) {
  if (userModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userModel.toMap());

  // Add any Firestore field values
  userModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserModelListFirestoreData(
  List<UserModelStruct>? userModels,
) =>
    userModels?.map((e) => getUserModelFirestoreData(e, true)).toList() ?? [];
