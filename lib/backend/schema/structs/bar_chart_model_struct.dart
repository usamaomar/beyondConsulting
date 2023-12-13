// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarChartModelStruct extends BaseStruct {
  BarChartModelStruct({
    String? lable,
    int? number,
  })  : _lable = lable,
        _number = number;

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

  static BarChartModelStruct fromMap(Map<String, dynamic> data) =>
      BarChartModelStruct(
        lable: data['lable'] as String?,
        number: castToType<int>(data['number']),
      );

  static BarChartModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? BarChartModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'lable': _lable,
        'number': _number,
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
      );

  @override
  String toString() => 'BarChartModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BarChartModelStruct &&
        lable == other.lable &&
        number == other.number;
  }

  @override
  int get hashCode => const ListEquality().hash([lable, number]);
}

BarChartModelStruct createBarChartModelStruct({
  String? lable,
  int? number,
}) =>
    BarChartModelStruct(
      lable: lable,
      number: number,
    );
