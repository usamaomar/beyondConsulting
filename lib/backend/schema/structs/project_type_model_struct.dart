// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectTypeModelStruct extends BaseStruct {
  ProjectTypeModelStruct({
    String? nameAr,
    String? nameEn,
    Color? color,
    int? type,
  })  : _nameAr = nameAr,
        _nameEn = nameEn,
        _color = color,
        _type = type;

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

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;
  void incrementType(int amount) => _type = type + amount;
  bool hasType() => _type != null;

  static ProjectTypeModelStruct fromMap(Map<String, dynamic> data) =>
      ProjectTypeModelStruct(
        nameAr: data['nameAr'] as String?,
        nameEn: data['nameEn'] as String?,
        color: getSchemaColor(data['color']),
        type: castToType<int>(data['type']),
      );

  static ProjectTypeModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectTypeModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nameAr': _nameAr,
        'nameEn': _nameEn,
        'color': _color,
        'type': _type,
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
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProjectTypeModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProjectTypeModelStruct(
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
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProjectTypeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectTypeModelStruct &&
        nameAr == other.nameAr &&
        nameEn == other.nameEn &&
        color == other.color &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([nameAr, nameEn, color, type]);
}

ProjectTypeModelStruct createProjectTypeModelStruct({
  String? nameAr,
  String? nameEn,
  Color? color,
  int? type,
}) =>
    ProjectTypeModelStruct(
      nameAr: nameAr,
      nameEn: nameEn,
      color: color,
      type: type,
    );
