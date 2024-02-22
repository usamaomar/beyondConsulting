// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoteModelStruct extends BaseStruct {
  NoteModelStruct({
    int? id,
    String? date,
    String? title,
    String? color,
    String? noteText,
    String? backTitle,
    String? backColor,
  })  : _id = id,
        _date = date,
        _title = title,
        _color = color,
        _noteText = noteText,
        _backTitle = backTitle,
        _backColor = backColor;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;
  bool hasColor() => _color != null;

  // "noteText" field.
  String? _noteText;
  String get noteText => _noteText ?? '';
  set noteText(String? val) => _noteText = val;
  bool hasNoteText() => _noteText != null;

  // "backTitle" field.
  String? _backTitle;
  String get backTitle => _backTitle ?? '';
  set backTitle(String? val) => _backTitle = val;
  bool hasBackTitle() => _backTitle != null;

  // "backColor" field.
  String? _backColor;
  String get backColor => _backColor ?? '';
  set backColor(String? val) => _backColor = val;
  bool hasBackColor() => _backColor != null;

  static NoteModelStruct fromMap(Map<String, dynamic> data) => NoteModelStruct(
        id: castToType<int>(data['id']),
        date: data['date'] as String?,
        title: data['title'] as String?,
        color: data['color'] as String?,
        noteText: data['noteText'] as String?,
        backTitle: data['backTitle'] as String?,
        backColor: data['backColor'] as String?,
      );

  static NoteModelStruct? maybeFromMap(dynamic data) => data is Map
      ? NoteModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'date': _date,
        'title': _title,
        'color': _color,
        'noteText': _noteText,
        'backTitle': _backTitle,
        'backColor': _backColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'noteText': serializeParam(
          _noteText,
          ParamType.String,
        ),
        'backTitle': serializeParam(
          _backTitle,
          ParamType.String,
        ),
        'backColor': serializeParam(
          _backColor,
          ParamType.String,
        ),
      }.withoutNulls;

  static NoteModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoteModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        noteText: deserializeParam(
          data['noteText'],
          ParamType.String,
          false,
        ),
        backTitle: deserializeParam(
          data['backTitle'],
          ParamType.String,
          false,
        ),
        backColor: deserializeParam(
          data['backColor'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NoteModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NoteModelStruct &&
        id == other.id &&
        date == other.date &&
        title == other.title &&
        color == other.color &&
        noteText == other.noteText &&
        backTitle == other.backTitle &&
        backColor == other.backColor;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, date, title, color, noteText, backTitle, backColor]);
}

NoteModelStruct createNoteModelStruct({
  int? id,
  String? date,
  String? title,
  String? color,
  String? noteText,
  String? backTitle,
  String? backColor,
}) =>
    NoteModelStruct(
      id: id,
      date: date,
      title: title,
      color: color,
      noteText: noteText,
      backTitle: backTitle,
      backColor: backColor,
    );
