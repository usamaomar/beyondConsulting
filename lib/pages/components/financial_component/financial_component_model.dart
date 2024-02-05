import '../../../backend/schema/structs/bar_chart_model_struct.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'financial_component_widget.dart' show FinancialComponentWidget;
import 'package:flutter/material.dart';

class FinancialComponentModel
    extends FlutterFlowModel<FinancialComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;


  List<BarChartModelStruct> totalLableList = [];
  void addToTotalLableList(BarChartModelStruct item) =>
      totalLableList.add(item);
  void removeFromTotalLableList(BarChartModelStruct item) =>
      totalLableList.remove(item);
  void removeAtIndexFromTotalLableList(int index) =>
      totalLableList.removeAt(index);
  void insertAtIndexInTotalLableList(int index, BarChartModelStruct item) =>
      totalLableList.insert(index, item);
  void updateTotalLableListAtIndex(
      int index, Function(BarChartModelStruct) updateFn) =>
      totalLableList[index] = updateFn(totalLableList[index]);


  List<BarChartModelStruct> spentLableList = [];
  void addToSpentLableList(BarChartModelStruct item) =>
      spentLableList.add(item);
  void removeFromSpentLableList(BarChartModelStruct item) =>
      spentLableList.remove(item);
  void removeAtIndexFromSpentLableList(int index) =>
      spentLableList.removeAt(index);
  void insertAtIndexInSpentLableList(int index, BarChartModelStruct item) =>
      spentLableList.insert(index, item);
  void updateSpentLableListAtIndex(
      int index, Function(BarChartModelStruct) updateFn) =>
      spentLableList[index] = updateFn(spentLableList[index]);

  List<BarChartModelStruct> remainingLableList = [];
  void addToRemainingLableList(BarChartModelStruct item) =>
      remainingLableList.add(item);
  void removeFromRemainingLableList(BarChartModelStruct item) =>
      remainingLableList.remove(item);
  void removeAtIndexFromRemainingLableList(int index) =>
      remainingLableList.removeAt(index);
  void insertAtIndexInRemainingLableList(int index, BarChartModelStruct item) =>
      remainingLableList.insert(index, item);
  void updateRemainingLableListAtIndex(
      int index, Function(BarChartModelStruct) updateFn) =>
      remainingLableList[index] = updateFn(remainingLableList[index]);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
