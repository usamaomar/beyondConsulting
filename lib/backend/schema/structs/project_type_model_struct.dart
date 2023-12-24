// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectTypeModelStruct extends FFFirebaseStruct {
  ProjectTypeModelStruct({
    String? nameAr,
    String? nameEn,
    Color? color,
    int? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nameAr = nameAr,
        _nameEn = nameEn,
        _color = color,
        _type = type,
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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectTypeModelStruct(
      nameAr: nameAr,
      nameEn: nameEn,
      color: color,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectTypeModelStruct? updateProjectTypeModelStruct(
  ProjectTypeModelStruct? projectTypeModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectTypeModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectTypeModelStructData(
  Map<String, dynamic> firestoreData,
  ProjectTypeModelStruct? projectTypeModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectTypeModel == null) {
    return;
  }
  if (projectTypeModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && projectTypeModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectTypeModelData =
      getProjectTypeModelFirestoreData(projectTypeModel, forFieldValue);
  final nestedData =
      projectTypeModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = projectTypeModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectTypeModelFirestoreData(
  ProjectTypeModelStruct? projectTypeModel, [
  bool forFieldValue = false,
]) {
  if (projectTypeModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectTypeModel.toMap());

  // Add any Firestore field values
  projectTypeModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectTypeModelListFirestoreData(
  List<ProjectTypeModelStruct>? projectTypeModels,
) =>
    projectTypeModels
        ?.map((e) => getProjectTypeModelFirestoreData(e, true))
        .toList() ??
    [];
