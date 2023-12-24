// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MileStoneStateModelStruct extends FFFirebaseStruct {
  MileStoneStateModelStruct({
    String? nameAr,
    String? nameEn,
    int? stateId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nameAr = nameAr,
        _nameEn = nameEn,
        _stateId = stateId,
        super(firestoreUtilData);

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

  static MileStoneStateModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MileStoneStateModelStruct.fromMap(data.cast<String, dynamic>())
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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MileStoneStateModelStruct(
      nameAr: nameAr,
      nameEn: nameEn,
      stateId: stateId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MileStoneStateModelStruct? updateMileStoneStateModelStruct(
  MileStoneStateModelStruct? mileStoneStateModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mileStoneStateModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMileStoneStateModelStructData(
  Map<String, dynamic> firestoreData,
  MileStoneStateModelStruct? mileStoneStateModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mileStoneStateModel == null) {
    return;
  }
  if (mileStoneStateModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mileStoneStateModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mileStoneStateModelData =
      getMileStoneStateModelFirestoreData(mileStoneStateModel, forFieldValue);
  final nestedData =
      mileStoneStateModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      mileStoneStateModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMileStoneStateModelFirestoreData(
  MileStoneStateModelStruct? mileStoneStateModel, [
  bool forFieldValue = false,
]) {
  if (mileStoneStateModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mileStoneStateModel.toMap());

  // Add any Firestore field values
  mileStoneStateModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMileStoneStateModelListFirestoreData(
  List<MileStoneStateModelStruct>? mileStoneStateModels,
) =>
    mileStoneStateModels
        ?.map((e) => getMileStoneStateModelFirestoreData(e, true))
        .toList() ??
    [];
