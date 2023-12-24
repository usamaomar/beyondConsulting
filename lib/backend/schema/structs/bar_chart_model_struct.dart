// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarChartModelStruct extends FFFirebaseStruct {
  BarChartModelStruct({
    String? lable,
    int? number,
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lable = lable,
        _number = number,
        _color = color,
        super(firestoreUtilData);

  // "lable" field.
  String? _lable;
  String get lable => _lable ?? '';
  set lable(String? val) => _lable = val;
  bool hasLable() => _lable != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  static BarChartModelStruct fromMap(Map<String, dynamic> data) =>
      BarChartModelStruct(
        lable: data['lable'] as String?,
        number: castToType<int>(data['number']),
        color: getSchemaColor(data['color']),
      );

  static BarChartModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BarChartModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lable': _lable,
        'number': _number,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lable': serializeParam(
          _lable,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static BarChartModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      BarChartModelStruct(
        lable: deserializeParam(
          data['lable'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'BarChartModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BarChartModelStruct &&
        lable == other.lable &&
        number == other.number &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([lable, number, color]);
}

BarChartModelStruct createBarChartModelStruct({
  String? lable,
  int? number,
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BarChartModelStruct(
      lable: lable,
      number: number,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BarChartModelStruct? updateBarChartModelStruct(
  BarChartModelStruct? barChartModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    barChartModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBarChartModelStructData(
  Map<String, dynamic> firestoreData,
  BarChartModelStruct? barChartModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (barChartModel == null) {
    return;
  }
  if (barChartModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && barChartModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final barChartModelData =
      getBarChartModelFirestoreData(barChartModel, forFieldValue);
  final nestedData =
      barChartModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = barChartModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBarChartModelFirestoreData(
  BarChartModelStruct? barChartModel, [
  bool forFieldValue = false,
]) {
  if (barChartModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(barChartModel.toMap());

  // Add any Firestore field values
  barChartModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBarChartModelListFirestoreData(
  List<BarChartModelStruct>? barChartModels,
) =>
    barChartModels
        ?.map((e) => getBarChartModelFirestoreData(e, true))
        .toList() ??
    [];
