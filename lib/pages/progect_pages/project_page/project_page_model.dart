import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'project_page_widget.dart' show ProjectPageWidget;
import 'package:flutter/material.dart';

class ProjectPageModel extends FlutterFlowModel<ProjectPageWidget> {
  ///  Local state fields for this page.

  ProjectModelStruct? projectModel;
  void updateProjectModelStruct(Function(ProjectModelStruct) updateFn) =>
      updateFn(projectModel ??= ProjectModelStruct());

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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
