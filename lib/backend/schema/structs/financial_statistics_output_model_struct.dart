// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FinancialStatisticsOutputModelStruct extends BaseStruct {
  FinancialStatisticsOutputModelStruct({
    FinancialStatisticsOutputModelStruct? data,
    double? actualRevenue,
    double? plannedRevenue,
    double? actualCost,
    double? plannedCost,
    double? actualProfit,
    double? plannedProfit,
    double? targetGP,
    double? actualGP,
    double? totalBudget,
    double? spentBudget,
    double? remainingBudget,
  })  : _data = data,
        _actualRevenue = actualRevenue,
        _plannedRevenue = plannedRevenue,
        _actualCost = actualCost,
        _plannedCost = plannedCost,
        _actualProfit = actualProfit,
        _plannedProfit = plannedProfit,
        _targetGP = targetGP,
        _actualGP = actualGP,
        _totalBudget = totalBudget,
        _spentBudget = spentBudget,
        _remainingBudget = remainingBudget;

  // "data" field.
  FinancialStatisticsOutputModelStruct? _data;
  FinancialStatisticsOutputModelStruct get data =>
      _data ?? FinancialStatisticsOutputModelStruct();
  set data(FinancialStatisticsOutputModelStruct? val) => _data = val;
  void updateData(Function(FinancialStatisticsOutputModelStruct) updateFn) =>
      updateFn(_data ??= FinancialStatisticsOutputModelStruct());
  bool hasData() => _data != null;

  // "actualRevenue" field.
  double? _actualRevenue;
  double get actualRevenue => _actualRevenue ?? 0.0;
  set actualRevenue(double? val) => _actualRevenue = val;
  void incrementActualRevenue(double amount) =>
      _actualRevenue = actualRevenue + amount;
  bool hasActualRevenue() => _actualRevenue != null;

  // "plannedRevenue" field.
  double? _plannedRevenue;
  double get plannedRevenue => _plannedRevenue ?? 0.0;
  set plannedRevenue(double? val) => _plannedRevenue = val;
  void incrementPlannedRevenue(double amount) =>
      _plannedRevenue = plannedRevenue + amount;
  bool hasPlannedRevenue() => _plannedRevenue != null;

  // "actualCost" field.
  double? _actualCost;
  double get actualCost => _actualCost ?? 0.0;
  set actualCost(double? val) => _actualCost = val;
  void incrementActualCost(double amount) => _actualCost = actualCost + amount;
  bool hasActualCost() => _actualCost != null;

  // "plannedCost" field.
  double? _plannedCost;
  double get plannedCost => _plannedCost ?? 0.0;
  set plannedCost(double? val) => _plannedCost = val;
  void incrementPlannedCost(double amount) =>
      _plannedCost = plannedCost + amount;
  bool hasPlannedCost() => _plannedCost != null;

  // "actualProfit" field.
  double? _actualProfit;
  double get actualProfit => _actualProfit ?? 0.0;
  set actualProfit(double? val) => _actualProfit = val;
  void incrementActualProfit(double amount) =>
      _actualProfit = actualProfit + amount;
  bool hasActualProfit() => _actualProfit != null;

  // "plannedProfit" field.
  double? _plannedProfit;
  double get plannedProfit => _plannedProfit ?? 0.0;
  set plannedProfit(double? val) => _plannedProfit = val;
  void incrementPlannedProfit(double amount) =>
      _plannedProfit = plannedProfit + amount;
  bool hasPlannedProfit() => _plannedProfit != null;

  // "targetGP" field.
  double? _targetGP;
  double get targetGP => _targetGP ?? 0.0;
  set targetGP(double? val) => _targetGP = val;
  void incrementTargetGP(double amount) => _targetGP = targetGP + amount;
  bool hasTargetGP() => _targetGP != null;

  // "actualGP" field.
  double? _actualGP;
  double get actualGP => _actualGP ?? 0.0;
  set actualGP(double? val) => _actualGP = val;
  void incrementActualGP(double amount) => _actualGP = actualGP + amount;
  bool hasActualGP() => _actualGP != null;

  // "totalBudget" field.
  double? _totalBudget;
  double get totalBudget => _totalBudget ?? 0.0;
  set totalBudget(double? val) => _totalBudget = val;
  void incrementTotalBudget(double amount) =>
      _totalBudget = totalBudget + amount;
  bool hasTotalBudget() => _totalBudget != null;

  // "spentBudget" field.
  double? _spentBudget;
  double get spentBudget => _spentBudget ?? 0.0;
  set spentBudget(double? val) => _spentBudget = val;
  void incrementSpentBudget(double amount) =>
      _spentBudget = spentBudget + amount;
  bool hasSpentBudget() => _spentBudget != null;

  // "remainingBudget" field.
  double? _remainingBudget;
  double get remainingBudget => _remainingBudget ?? 0.0;
  set remainingBudget(double? val) => _remainingBudget = val;
  void incrementRemainingBudget(double amount) =>
      _remainingBudget = remainingBudget + amount;
  bool hasRemainingBudget() => _remainingBudget != null;

  static FinancialStatisticsOutputModelStruct fromMap(
          Map<String, dynamic> data) =>
      FinancialStatisticsOutputModelStruct(
        data: FinancialStatisticsOutputModelStruct.maybeFromMap(data['data']),
        actualRevenue: castToType<double>(data['actualRevenue']),
        plannedRevenue: castToType<double>(data['plannedRevenue']),
        actualCost: castToType<double>(data['actualCost']),
        plannedCost: castToType<double>(data['plannedCost']),
        actualProfit: castToType<double>(data['actualProfit']),
        plannedProfit: castToType<double>(data['plannedProfit']),
        targetGP: castToType<double>(data['targetGP']),
        actualGP: castToType<double>(data['actualGP']),
        totalBudget: castToType<double>(data['totalBudget']),
        spentBudget: castToType<double>(data['spentBudget']),
        remainingBudget: castToType<double>(data['remainingBudget']),
      );

  static FinancialStatisticsOutputModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? FinancialStatisticsOutputModelStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
        'actualRevenue': _actualRevenue,
        'plannedRevenue': _plannedRevenue,
        'actualCost': _actualCost,
        'plannedCost': _plannedCost,
        'actualProfit': _actualProfit,
        'plannedProfit': _plannedProfit,
        'targetGP': _targetGP,
        'actualGP': _actualGP,
        'totalBudget': _totalBudget,
        'spentBudget': _spentBudget,
        'remainingBudget': _remainingBudget,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
        'actualRevenue': serializeParam(
          _actualRevenue,
          ParamType.double,
        ),
        'plannedRevenue': serializeParam(
          _plannedRevenue,
          ParamType.double,
        ),
        'actualCost': serializeParam(
          _actualCost,
          ParamType.double,
        ),
        'plannedCost': serializeParam(
          _plannedCost,
          ParamType.double,
        ),
        'actualProfit': serializeParam(
          _actualProfit,
          ParamType.double,
        ),
        'plannedProfit': serializeParam(
          _plannedProfit,
          ParamType.double,
        ),
        'targetGP': serializeParam(
          _targetGP,
          ParamType.double,
        ),
        'actualGP': serializeParam(
          _actualGP,
          ParamType.double,
        ),
        'totalBudget': serializeParam(
          _totalBudget,
          ParamType.double,
        ),
        'spentBudget': serializeParam(
          _spentBudget,
          ParamType.double,
        ),
        'remainingBudget': serializeParam(
          _remainingBudget,
          ParamType.double,
        ),
      }.withoutNulls;

  static FinancialStatisticsOutputModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FinancialStatisticsOutputModelStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder:
              FinancialStatisticsOutputModelStruct.fromSerializableMap,
        ),
        actualRevenue: deserializeParam(
          data['actualRevenue'],
          ParamType.double,
          false,
        ),
        plannedRevenue: deserializeParam(
          data['plannedRevenue'],
          ParamType.double,
          false,
        ),
        actualCost: deserializeParam(
          data['actualCost'],
          ParamType.double,
          false,
        ),
        plannedCost: deserializeParam(
          data['plannedCost'],
          ParamType.double,
          false,
        ),
        actualProfit: deserializeParam(
          data['actualProfit'],
          ParamType.double,
          false,
        ),
        plannedProfit: deserializeParam(
          data['plannedProfit'],
          ParamType.double,
          false,
        ),
        targetGP: deserializeParam(
          data['targetGP'],
          ParamType.double,
          false,
        ),
        actualGP: deserializeParam(
          data['actualGP'],
          ParamType.double,
          false,
        ),
        totalBudget: deserializeParam(
          data['totalBudget'],
          ParamType.double,
          false,
        ),
        spentBudget: deserializeParam(
          data['spentBudget'],
          ParamType.double,
          false,
        ),
        remainingBudget: deserializeParam(
          data['remainingBudget'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'FinancialStatisticsOutputModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FinancialStatisticsOutputModelStruct &&
        data == other.data &&
        actualRevenue == other.actualRevenue &&
        plannedRevenue == other.plannedRevenue &&
        actualCost == other.actualCost &&
        plannedCost == other.plannedCost &&
        actualProfit == other.actualProfit &&
        plannedProfit == other.plannedProfit &&
        targetGP == other.targetGP &&
        actualGP == other.actualGP &&
        totalBudget == other.totalBudget &&
        spentBudget == other.spentBudget &&
        remainingBudget == other.remainingBudget;
  }

  @override
  int get hashCode => const ListEquality().hash([
        data,
        actualRevenue,
        plannedRevenue,
        actualCost,
        plannedCost,
        actualProfit,
        plannedProfit,
        targetGP,
        actualGP,
        totalBudget,
        spentBudget,
        remainingBudget
      ]);
}

FinancialStatisticsOutputModelStruct
    createFinancialStatisticsOutputModelStruct({
  FinancialStatisticsOutputModelStruct? data,
  double? actualRevenue,
  double? plannedRevenue,
  double? actualCost,
  double? plannedCost,
  double? actualProfit,
  double? plannedProfit,
  double? targetGP,
  double? actualGP,
  double? totalBudget,
  double? spentBudget,
  double? remainingBudget,
}) =>
        FinancialStatisticsOutputModelStruct(
          data: data ?? FinancialStatisticsOutputModelStruct(),
          actualRevenue: actualRevenue,
          plannedRevenue: plannedRevenue,
          actualCost: actualCost,
          plannedCost: plannedCost,
          actualProfit: actualProfit,
          plannedProfit: plannedProfit,
          targetGP: targetGP,
          actualGP: actualGP,
          totalBudget: totalBudget,
          spentBudget: spentBudget,
          remainingBudget: remainingBudget,
        );
