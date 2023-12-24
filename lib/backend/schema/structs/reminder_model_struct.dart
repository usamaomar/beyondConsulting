// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReminderModelStruct extends FFFirebaseStruct {
  ReminderModelStruct({
    String? nameEn,
    String? nameAr,
    int? day,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nameEn = nameEn,
        _nameAr = nameAr,
        _day = day,
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

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;
  void incrementDay(int amount) => _day = day + amount;
  bool hasDay() => _day != null;

  static ReminderModelStruct fromMap(Map<String, dynamic> data) =>
      ReminderModelStruct(
        nameEn: data['nameEn'] as String?,
        nameAr: data['nameAr'] as String?,
        day: castToType<int>(data['day']),
      );

  static ReminderModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ReminderModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nameEn': _nameEn,
        'nameAr': _nameAr,
        'day': _day,
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
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
      }.withoutNulls;

  static ReminderModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReminderModelStruct(
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
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ReminderModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReminderModelStruct &&
        nameEn == other.nameEn &&
        nameAr == other.nameAr &&
        day == other.day;
  }

  @override
  int get hashCode => const ListEquality().hash([nameEn, nameAr, day]);
}

ReminderModelStruct createReminderModelStruct({
  String? nameEn,
  String? nameAr,
  int? day,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReminderModelStruct(
      nameEn: nameEn,
      nameAr: nameAr,
      day: day,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReminderModelStruct? updateReminderModelStruct(
  ReminderModelStruct? reminderModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    reminderModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReminderModelStructData(
  Map<String, dynamic> firestoreData,
  ReminderModelStruct? reminderModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (reminderModel == null) {
    return;
  }
  if (reminderModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && reminderModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reminderModelData =
      getReminderModelFirestoreData(reminderModel, forFieldValue);
  final nestedData =
      reminderModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = reminderModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReminderModelFirestoreData(
  ReminderModelStruct? reminderModel, [
  bool forFieldValue = false,
]) {
  if (reminderModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(reminderModel.toMap());

  // Add any Firestore field values
  reminderModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReminderModelListFirestoreData(
  List<ReminderModelStruct>? reminderModels,
) =>
    reminderModels
        ?.map((e) => getReminderModelFirestoreData(e, true))
        .toList() ??
    [];
