// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppCardModelStruct extends BaseStruct {
  AppCardModelStruct({
    String? title,
    String? note,
    String? backTitle,
    DateTime? createdDate,
    DateTime? achievementData,
    Color? backColor,
    Color? frontColor,
  })  : _title = title,
        _note = note,
        _backTitle = backTitle,
        _createdDate = createdDate,
        _achievementData = achievementData,
        _backColor = backColor,
        _frontColor = frontColor;

  // "title" field.
  String? _title;

  String get title => _title ?? '';

  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "note" field.
  String? _note;

  String get note => _note ?? '';

  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "backTitle" field.
  String? _backTitle;

  String get backTitle => _backTitle ?? '';

  set backTitle(String? val) => _backTitle = val;

  bool hasBackTitle() => _backTitle != null;

  // "createdDate" field.
  DateTime? _createdDate;

  DateTime? get createdDate => _createdDate;

  set createdDate(DateTime? val) => _createdDate = val;

  bool hasCreatedDate() => _createdDate != null;

  // "achievementData" field.
  DateTime? _achievementData;

  DateTime? get achievementData => _achievementData;

  set achievementData(DateTime? val) => _achievementData = val;

  bool hasAchievementData() => _achievementData != null;

  // "backColor" field.
  Color? _backColor;

  Color? get backColor => _backColor;

  set backColor(Color? val) => _backColor = val;

  bool hasBackColor() => _backColor != null;

  // "frontColor" field.
  Color? _frontColor;

  Color? get frontColor => _frontColor;

  set frontColor(Color? val) => _frontColor = val;

  bool hasFrontColor() => _frontColor != null;

  static AppCardModelStruct fromMap(Map<String, dynamic> data) =>
      AppCardModelStruct(
        title: data['title'] as String?,
        note: data['noteText'] as String?,
        backTitle: data['backTitle'] as String?,
        createdDate: convertStringToDateTime(data['date']),
        backColor: Color(int.parse(data['backColor'])),
        frontColor: Color(int.parse(data['color'])),
      );

  static DateTime? convertStringToDateTime(String dateString) {
    DateTime? dateTime = DateTime.parse(dateString);
    return dateTime;
  }

  static AppCardModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AppCardModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'note': _note,
        'backTitle': _backTitle,
        'createdDate': _createdDate,
        'achievementData': _achievementData,
        'backColor': _backColor,
        'frontColor': _frontColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'backTitle': serializeParam(
          _backTitle,
          ParamType.String,
        ),
        'createdDate': serializeParam(
          _createdDate,
          ParamType.DateTime,
        ),
        'achievementData': serializeParam(
          _achievementData,
          ParamType.DateTime,
        ),
        'backColor': serializeParam(
          _backColor,
          ParamType.Color,
        ),
        'frontColor': serializeParam(
          _frontColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static AppCardModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppCardModelStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        backTitle: deserializeParam(
          data['backTitle'],
          ParamType.String,
          false,
        ),
        createdDate: deserializeParam(
          data['createdDate'],
          ParamType.DateTime,
          false,
        ),
        achievementData: deserializeParam(
          data['achievementData'],
          ParamType.DateTime,
          false,
        ),
        backColor: deserializeParam(
          data['backColor'],
          ParamType.Color,
          false,
        ),
        frontColor: deserializeParam(
          data['frontColor'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'AppCardModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppCardModelStruct &&
        title == other.title &&
        note == other.note &&
        backTitle == other.backTitle &&
        createdDate == other.createdDate &&
        achievementData == other.achievementData &&
        backColor == other.backColor &&
        frontColor == other.frontColor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        note,
        backTitle,
        createdDate,
        achievementData,
        backColor,
        frontColor
      ]);
}

AppCardModelStruct createAppCardModelStruct({
  String? title,
  String? note,
  String? backTitle,
  DateTime? createdDate,
  DateTime? achievementData,
  Color? backColor,
  Color? frontColor,
}) =>
    AppCardModelStruct(
      title: title,
      note: note,
      backTitle: backTitle,
      createdDate: createdDate,
      achievementData: achievementData,
      backColor: backColor,
      frontColor: frontColor,
    );
