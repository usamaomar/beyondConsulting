// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SatisfactionModelStruct extends BaseStruct {
  SatisfactionModelStruct({
    int? type,
    bool? isSelected,
    Color? color,
    Color? notColor,
  })  : _type = type,
        _isSelected = isSelected,
        _color = color,
        _notColor = notColor;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;
  void incrementType(int amount) => _type = type + amount;
  bool hasType() => _type != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;
  bool hasIsSelected() => _isSelected != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  // "notColor" field.
  Color? _notColor;
  Color? get notColor => _notColor;
  set notColor(Color? val) => _notColor = val;
  bool hasNotColor() => _notColor != null;

  static SatisfactionModelStruct fromMap(Map<String, dynamic> data) =>
      SatisfactionModelStruct(
        type: castToType<int>(data['type']),
        isSelected: data['isSelected'] as bool?,
        color: getSchemaColor(data['color']),
        notColor: getSchemaColor(data['notColor']),
      );

  static SatisfactionModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? SatisfactionModelStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'isSelected': _isSelected,
        'color': _color,
        'notColor': _notColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'notColor': serializeParam(
          _notColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static SatisfactionModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SatisfactionModelStruct(
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        notColor: deserializeParam(
          data['notColor'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'SatisfactionModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SatisfactionModelStruct &&
        type == other.type &&
        isSelected == other.isSelected &&
        color == other.color &&
        notColor == other.notColor;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, isSelected, color, notColor]);
}

SatisfactionModelStruct createSatisfactionModelStruct({
  int? type,
  bool? isSelected,
  Color? color,
  Color? notColor,
}) =>
    SatisfactionModelStruct(
      type: type,
      isSelected: isSelected,
      color: color,
      notColor: notColor,
    );
