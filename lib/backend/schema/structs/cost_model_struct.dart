// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CostModelStruct extends BaseStruct {
  CostModelStruct({
    int? id,
    String? title,
    String? date,
    String? category,
    String? notes,
    double? unitCost,
    String? unit,
    double? duration,
    String? durationUnit,
    double? total,
    double? costType,
    int? costStatus,
  })  : _id = id,
        _title = title,
        _date = date,
        _category = category,
        _notes = notes,
        _unitCost = unitCost,
        _unit = unit,
        _duration = duration,
        _durationUnit = durationUnit,
        _total = total,
        _costType = costType,
        _costStatus = costStatus;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;
  bool hasNotes() => _notes != null;

  // "unitCost" field.
  double? _unitCost;
  double get unitCost => _unitCost ?? 0.0;
  set unitCost(double? val) => _unitCost = val;
  void incrementUnitCost(double amount) => _unitCost = unitCost + amount;
  bool hasUnitCost() => _unitCost != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  set duration(double? val) => _duration = val;
  void incrementDuration(double amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "durationUnit" field.
  String? _durationUnit;
  String get durationUnit => _durationUnit ?? '';
  set durationUnit(String? val) => _durationUnit = val;
  bool hasDurationUnit() => _durationUnit != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;
  void incrementTotal(double amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "costType" field.
  double? _costType;
  double get costType => _costType ?? 0.0;
  set costType(double? val) => _costType = val;
  void incrementCostType(double amount) => _costType = costType + amount;
  bool hasCostType() => _costType != null;

  // "costStatus" field.
  int? _costStatus;
  int get costStatus => _costStatus ?? 0;
  set costStatus(int? val) => _costStatus = val;
  void incrementCostStatus(int amount) => _costStatus = costStatus + amount;
  bool hasCostStatus() => _costStatus != null;

  static CostModelStruct fromMap(Map<String, dynamic> data) => CostModelStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        date: data['date'] as String?,
        category: data['category'] as String?,
        notes: data['notes'] as String?,
        unitCost: castToType<double>(data['unitCost']),
        unit: data['unit'] as String?,
        duration: castToType<double>(data['duration']),
        durationUnit: data['durationUnit'] as String?,
        total: castToType<double>(data['total']),
        costType: castToType<double>(data['costType']),
        costStatus: castToType<int>(data['costStatus']),
      );

  static CostModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CostModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'date': _date,
        'category': _category,
        'notes': _notes,
        'unitCost': _unitCost,
        'unit': _unit,
        'duration': _duration,
        'durationUnit': _durationUnit,
        'total': _total,
        'costType': _costType,
        'costStatus': _costStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'unitCost': serializeParam(
          _unitCost,
          ParamType.double,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.double,
        ),
        'durationUnit': serializeParam(
          _durationUnit,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'costType': serializeParam(
          _costType,
          ParamType.double,
        ),
        'costStatus': serializeParam(
          _costStatus,
          ParamType.int,
        ),
      }.withoutNulls;

  static CostModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CostModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        unitCost: deserializeParam(
          data['unitCost'],
          ParamType.double,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.double,
          false,
        ),
        durationUnit: deserializeParam(
          data['durationUnit'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        costType: deserializeParam(
          data['costType'],
          ParamType.double,
          false,
        ),
        costStatus: deserializeParam(
          data['costStatus'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CostModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CostModelStruct &&
        id == other.id &&
        title == other.title &&
        date == other.date &&
        category == other.category &&
        notes == other.notes &&
        unitCost == other.unitCost &&
        unit == other.unit &&
        duration == other.duration &&
        durationUnit == other.durationUnit &&
        total == other.total &&
        costType == other.costType &&
        costStatus == other.costStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        date,
        category,
        notes,
        unitCost,
        unit,
        duration,
        durationUnit,
        total,
        costType,
        costStatus
      ]);
}

CostModelStruct createCostModelStruct({
  int? id,
  String? title,
  String? date,
  String? category,
  String? notes,
  double? unitCost,
  String? unit,
  double? duration,
  String? durationUnit,
  double? total,
  double? costType,
  int? costStatus,
}) =>
    CostModelStruct(
      id: id,
      title: title,
      date: date,
      category: category,
      notes: notes,
      unitCost: unitCost,
      unit: unit,
      duration: duration,
      durationUnit: durationUnit,
      total: total,
      costType: costType,
      costStatus: costStatus,
    );
