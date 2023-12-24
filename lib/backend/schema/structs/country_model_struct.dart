// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CountryModelStruct extends FFFirebaseStruct {
  CountryModelStruct({
    String? nameEn,
    String? nameAr,
    String? flag,
    String? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nameEn = nameEn,
        _nameAr = nameAr,
        _flag = flag,
        _code = code,
        super(firestoreUtilData);

  // "nameEn" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  set nameEn(String? val) => _nameEn = val;
  bool hasNameEn() => _nameEn != null;

  // "nameAr" field.
  String? _nameAr;
  String get nameAr => _nameAr ?? '';
  set nameAr(String? val) => _nameAr = val;
  bool hasNameAr() => _nameAr != null;

  // "flag" field.
  String? _flag;
  String get flag => _flag ?? '';
  set flag(String? val) => _flag = val;
  bool hasFlag() => _flag != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;
  bool hasCode() => _code != null;

  static CountryModelStruct fromMap(Map<String, dynamic> data) =>
      CountryModelStruct(
        nameEn: data['nameEn'] as String?,
        nameAr: data['nameAr'] as String?,
        flag: data['flag'] as String?,
        code: data['code'] as String?,
      );

  static CountryModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CountryModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nameEn': _nameEn,
        'nameAr': _nameAr,
        'flag': _flag,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nameEn': serializeParam(
          _nameEn,
          ParamType.String,
        ),
        'nameAr': serializeParam(
          _nameAr,
          ParamType.String,
        ),
        'flag': serializeParam(
          _flag,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static CountryModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountryModelStruct(
        nameEn: deserializeParam(
          data['nameEn'],
          ParamType.String,
          false,
        ),
        nameAr: deserializeParam(
          data['nameAr'],
          ParamType.String,
          false,
        ),
        flag: deserializeParam(
          data['flag'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CountryModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountryModelStruct &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        flag == other.flag &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([nameEn, nameAr, flag, code]);
}

CountryModelStruct createCountryModelStruct({
  String? nameEn,
  String? nameAr,
  String? flag,
  String? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CountryModelStruct(
      nameEn: nameEn,
      nameAr: nameAr,
      flag: flag,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CountryModelStruct? updateCountryModelStruct(
  CountryModelStruct? countryModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    countryModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCountryModelStructData(
  Map<String, dynamic> firestoreData,
  CountryModelStruct? countryModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (countryModel == null) {
    return;
  }
  if (countryModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && countryModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final countryModelData =
      getCountryModelFirestoreData(countryModel, forFieldValue);
  final nestedData =
      countryModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = countryModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCountryModelFirestoreData(
  CountryModelStruct? countryModel, [
  bool forFieldValue = false,
]) {
  if (countryModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(countryModel.toMap());

  // Add any Firestore field values
  countryModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCountryModelListFirestoreData(
  List<CountryModelStruct>? countryModels,
) =>
    countryModels?.map((e) => getCountryModelFirestoreData(e, true)).toList() ??
    [];
