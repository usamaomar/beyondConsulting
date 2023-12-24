// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TokenModelStruct extends FFFirebaseStruct {
  TokenModelStruct({
    String? token,
    String? refreshToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _token = token,
        _refreshToken = refreshToken,
        super(firestoreUtilData);

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  // "refreshToken" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;
  bool hasRefreshToken() => _refreshToken != null;

  static TokenModelStruct fromMap(Map<String, dynamic> data) =>
      TokenModelStruct(
        token: data['token'] as String?,
        refreshToken: data['refreshToken'] as String?,
      );

  static TokenModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TokenModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'token': _token,
        'refreshToken': _refreshToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'refreshToken': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static TokenModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TokenModelStruct(
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refreshToken'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TokenModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TokenModelStruct &&
        token == other.token &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode => const ListEquality().hash([token, refreshToken]);
}

TokenModelStruct createTokenModelStruct({
  String? token,
  String? refreshToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TokenModelStruct(
      token: token,
      refreshToken: refreshToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TokenModelStruct? updateTokenModelStruct(
  TokenModelStruct? tokenModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tokenModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTokenModelStructData(
  Map<String, dynamic> firestoreData,
  TokenModelStruct? tokenModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tokenModel == null) {
    return;
  }
  if (tokenModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tokenModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tokenModelData = getTokenModelFirestoreData(tokenModel, forFieldValue);
  final nestedData = tokenModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tokenModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTokenModelFirestoreData(
  TokenModelStruct? tokenModel, [
  bool forFieldValue = false,
]) {
  if (tokenModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tokenModel.toMap());

  // Add any Firestore field values
  tokenModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTokenModelListFirestoreData(
  List<TokenModelStruct>? tokenModels,
) =>
    tokenModels?.map((e) => getTokenModelFirestoreData(e, true)).toList() ?? [];
