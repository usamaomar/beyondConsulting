// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdinalSalesStruct extends FFFirebaseStruct {
  OrdinalSalesStruct({
    String? year,
    int? sales,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _year = year,
        _sales = sales,
        super(firestoreUtilData);

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;
  bool hasYear() => _year != null;

  // "sales" field.
  int? _sales;
  int get sales => _sales ?? 0;
  set sales(int? val) => _sales = val;
  void incrementSales(int amount) => _sales = sales + amount;
  bool hasSales() => _sales != null;

  static OrdinalSalesStruct fromMap(Map<String, dynamic> data) =>
      OrdinalSalesStruct(
        year: data['year'] as String?,
        sales: castToType<int>(data['sales']),
      );

  static OrdinalSalesStruct? maybeFromMap(dynamic data) => data is Map
      ? OrdinalSalesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'year': _year,
        'sales': _sales,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
        'sales': serializeParam(
          _sales,
          ParamType.int,
        ),
      }.withoutNulls;

  static OrdinalSalesStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrdinalSalesStruct(
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
        sales: deserializeParam(
          data['sales'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OrdinalSalesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrdinalSalesStruct &&
        year == other.year &&
        sales == other.sales;
  }

  @override
  int get hashCode => const ListEquality().hash([year, sales]);
}

OrdinalSalesStruct createOrdinalSalesStruct({
  String? year,
  int? sales,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrdinalSalesStruct(
      year: year,
      sales: sales,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrdinalSalesStruct? updateOrdinalSalesStruct(
  OrdinalSalesStruct? ordinalSales, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ordinalSales
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrdinalSalesStructData(
  Map<String, dynamic> firestoreData,
  OrdinalSalesStruct? ordinalSales,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ordinalSales == null) {
    return;
  }
  if (ordinalSales.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ordinalSales.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ordinalSalesData =
      getOrdinalSalesFirestoreData(ordinalSales, forFieldValue);
  final nestedData =
      ordinalSalesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ordinalSales.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrdinalSalesFirestoreData(
  OrdinalSalesStruct? ordinalSales, [
  bool forFieldValue = false,
]) {
  if (ordinalSales == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ordinalSales.toMap());

  // Add any Firestore field values
  ordinalSales.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrdinalSalesListFirestoreData(
  List<OrdinalSalesStruct>? ordinalSaless,
) =>
    ordinalSaless?.map((e) => getOrdinalSalesFirestoreData(e, true)).toList() ??
    [];
