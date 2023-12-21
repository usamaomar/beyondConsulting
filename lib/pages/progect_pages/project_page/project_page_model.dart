import '/backend/schema/structs/index.dart';
import '/components/satisfaction_component_widget.dart';
import '/components/stick_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/read_member_cpacity/read_member_cpacity_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'project_page_widget.dart' show ProjectPageWidget;
import 'package:data_table_2/data_table_2.dart';
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
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel> readMemberCpacityModels;
  // Model for satisfactionComponent component.
  late SatisfactionComponentModel satisfactionComponentModel;
  // Model for stick component.
  late StickModel stickModel1;
  // Model for stick component.
  late StickModel stickModel2;
  // Model for stick component.
  late StickModel stickModel3;
  // Model for stick component.
  late StickModel stickModel4;
  // Model for stick component.
  late StickModel stickModel5;
  // Model for stick component.
  late StickModel stickModel6;
  // Model for stick component.
  late StickModel stickModel7;
  // Model for stick component.
  late StickModel stickModel8;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    readMemberCpacityModels =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    satisfactionComponentModel =
        createModel(context, () => SatisfactionComponentModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    stickModel1 = createModel(context, () => StickModel());
    stickModel2 = createModel(context, () => StickModel());
    stickModel3 = createModel(context, () => StickModel());
    stickModel4 = createModel(context, () => StickModel());
    stickModel5 = createModel(context, () => StickModel());
    stickModel6 = createModel(context, () => StickModel());
    stickModel7 = createModel(context, () => StickModel());
    stickModel8 = createModel(context, () => StickModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    readMemberCpacityModels.dispose();
    satisfactionComponentModel.dispose();
    stickModel1.dispose();
    stickModel2.dispose();
    stickModel3.dispose();
    stickModel4.dispose();
    stickModel5.dispose();
    stickModel6.dispose();
    stickModel7.dispose();
    stickModel8.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
