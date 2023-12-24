// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdinalSalesStruct extends BaseStruct {
  OrdinalSalesStruct({
    String? year,
    int? sales,
  })  : _year = year,
        _sales = sales;

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
}) =>
    OrdinalSalesStruct(
      year: year,
      sales: sales,
    );
