// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryModelStruct extends BaseStruct {
  CountryModelStruct({
    String? nameEn,
    String? nameAr,
    String? flag,
    String? code,
  })  : _nameEn = nameEn,
        _nameAr = nameAr,
        _flag = flag,
        _code = code;

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

  static CountryModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CountryModelStruct.fromMap(data) : null;

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
}) =>
    CountryModelStruct(
      nameEn: nameEn,
      nameAr: nameAr,
      flag: flag,
      code: code,
    );
