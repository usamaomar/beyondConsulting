// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorModelStruct extends BaseStruct {
  ColorModelStruct({
    Color? colorHex,
    String? colorName,
  })  : _colorHex = colorHex,
        _colorName = colorName;

  // "colorHex" field.
  Color? _colorHex;
  Color? get colorHex => _colorHex;
  set colorHex(Color? val) => _colorHex = val;
  bool hasColorHex() => _colorHex != null;

  // "colorName" field.
  String? _colorName;
  String get colorName => _colorName ?? '';
  set colorName(String? val) => _colorName = val;
  bool hasColorName() => _colorName != null;

  static ColorModelStruct fromMap(Map<String, dynamic> data) =>
      ColorModelStruct(
        colorHex: getSchemaColor(data['colorHex']),
        colorName: data['colorName'] as String?,
      );

  static ColorModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ColorModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'colorHex': _colorHex,
        'colorName': _colorName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'colorHex': serializeParam(
          _colorHex,
          ParamType.Color,
        ),
        'colorName': serializeParam(
          _colorName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ColorModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColorModelStruct(
        colorHex: deserializeParam(
          data['colorHex'],
          ParamType.Color,
          false,
        ),
        colorName: deserializeParam(
          data['colorName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ColorModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColorModelStruct &&
        colorHex == other.colorHex &&
        colorName == other.colorName;
  }

  @override
  int get hashCode => const ListEquality().hash([colorHex, colorName]);
}

ColorModelStruct createColorModelStruct({
  Color? colorHex,
  String? colorName,
}) =>
    ColorModelStruct(
      colorHex: colorHex,
      colorName: colorName,
    );
