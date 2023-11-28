// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MileStoneStateModelStruct extends BaseStruct {
  MileStoneStateModelStruct({
    String? nameAr,
    String? nameEn,
    int? stateId,
  })  : _nameAr = nameAr,
        _nameEn = nameEn,
        _stateId = stateId;

  // "nameAr" field.
  String? _nameAr;
  String get nameAr => _nameAr ?? '';
  set nameAr(String? val) => _nameAr = val;
  bool hasNameAr() => _nameAr != null;

  // "nameEn" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  set nameEn(String? val) => _nameEn = val;
  bool hasNameEn() => _nameEn != null;

  // "stateId" field.
  int? _stateId;
  int get stateId => _stateId ?? 0;
  set stateId(int? val) => _stateId = val;
  void incrementStateId(int amount) => _stateId = stateId + amount;
  bool hasStateId() => _stateId != null;

  static MileStoneStateModelStruct fromMap(Map<String, dynamic> data) =>
      MileStoneStateModelStruct(
        nameAr: data['nameAr'] as String?,
        nameEn: data['nameEn'] as String?,
        stateId: castToType<int>(data['stateId']),
      );

  static MileStoneStateModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? MileStoneStateModelStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'nameAr': _nameAr,
        'nameEn': _nameEn,
        'stateId': _stateId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nameAr': serializeParam(
          _nameAr,
          ParamType.String,
        ),
        'nameEn': serializeParam(
          _nameEn,
          ParamType.String,
        ),
        'stateId': serializeParam(
          _stateId,
          ParamType.int,
        ),
      }.withoutNulls;

  static MileStoneStateModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MileStoneStateModelStruct(
        nameAr: deserializeParam(
          data['nameAr'],
          ParamType.String,
          false,
        ),
        nameEn: deserializeParam(
          data['nameEn'],
          ParamType.String,
          false,
        ),
        stateId: deserializeParam(
          data['stateId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MileStoneStateModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MileStoneStateModelStruct &&
        nameAr == other.nameAr &&
        nameEn == other.nameEn &&
        stateId == other.stateId;
  }

  @override
  int get hashCode => const ListEquality().hash([nameAr, nameEn, stateId]);
}

MileStoneStateModelStruct createMileStoneStateModelStruct({
  String? nameAr,
  String? nameEn,
  int? stateId,
}) =>
    MileStoneStateModelStruct(
      nameAr: nameAr,
      nameEn: nameEn,
      stateId: stateId,
    );
