// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientModelStruct extends BaseStruct {
  ClientModelStruct({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
    String? contactName,
    String? alternativePhoneNumber,
    String? logoImageUrl,
  })  : _id = id,
        _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        _address = address,
        _contactName = contactName,
        _alternativePhoneNumber = alternativePhoneNumber,
        _logoImageUrl = logoImageUrl;

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

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "contactName" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  set contactName(String? val) => _contactName = val;
  bool hasContactName() => _contactName != null;

  // "alternativePhoneNumber" field.
  String? _alternativePhoneNumber;
  String get alternativePhoneNumber => _alternativePhoneNumber ?? '';
  set alternativePhoneNumber(String? val) => _alternativePhoneNumber = val;
  bool hasAlternativePhoneNumber() => _alternativePhoneNumber != null;

  // "logoImageUrl" field.
  String? _logoImageUrl;
  String get logoImageUrl => _logoImageUrl ?? '';
  set logoImageUrl(String? val) => _logoImageUrl = val;
  bool hasLogoImageUrl() => _logoImageUrl != null;

  static ClientModelStruct fromMap(Map<String, dynamic> data) =>
      ClientModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        address: data['address'] as String?,
        contactName: data['contactName'] as String?,
        alternativePhoneNumber: data['alternativePhoneNumber'] as String?,
        logoImageUrl: data['logoImageUrl'] as String?,
      );

  static ClientModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ClientModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'email': _email,
        'phoneNumber': _phoneNumber,
        'address': _address,
        'contactName': _contactName,
        'alternativePhoneNumber': _alternativePhoneNumber,
        'logoImageUrl': _logoImageUrl,
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
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'contactName': serializeParam(
          _contactName,
          ParamType.String,
        ),
        'alternativePhoneNumber': serializeParam(
          _alternativePhoneNumber,
          ParamType.String,
        ),
        'logoImageUrl': serializeParam(
          _logoImageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClientModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClientModelStruct(
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
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        contactName: deserializeParam(
          data['contactName'],
          ParamType.String,
          false,
        ),
        alternativePhoneNumber: deserializeParam(
          data['alternativePhoneNumber'],
          ParamType.String,
          false,
        ),
        logoImageUrl: deserializeParam(
          data['logoImageUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClientModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClientModelStruct &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        address == other.address &&
        contactName == other.contactName &&
        alternativePhoneNumber == other.alternativePhoneNumber &&
        logoImageUrl == other.logoImageUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        email,
        phoneNumber,
        address,
        contactName,
        alternativePhoneNumber,
        logoImageUrl
      ]);
}

ClientModelStruct createClientModelStruct({
  int? id,
  String? name,
  String? email,
  String? phoneNumber,
  String? address,
  String? contactName,
  String? alternativePhoneNumber,
  String? logoImageUrl,
}) =>
    ClientModelStruct(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      contactName: contactName,
      alternativePhoneNumber: alternativePhoneNumber,
      logoImageUrl: logoImageUrl,
    );
