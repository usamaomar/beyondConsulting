import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'cost_management_widget.dart' show CostManagementWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CostManagementModel extends FlutterFlowModel<CostManagementWidget> {
  ///  Local state fields for this page.

  ProjectModelStruct? projectModel;
  void updateProjectModelStruct(Function(ProjectModelStruct) updateFn) =>
      updateFn(projectModel ??= ProjectModelStruct());

  List<MemberModelStruct> listOfMemebrslocal = [];
  void addToListOfMemebrslocal(MemberModelStruct item) =>
      listOfMemebrslocal.add(item);
  void removeFromListOfMemebrslocal(MemberModelStruct item) =>
      listOfMemebrslocal.remove(item);
  void removeAtIndexFromListOfMemebrslocal(int index) =>
      listOfMemebrslocal.removeAt(index);
  void insertAtIndexInListOfMemebrslocal(int index, MemberModelStruct item) =>
      listOfMemebrslocal.insert(index, item);
  void updateListOfMemebrslocalAtIndex(
          int index, Function(MemberModelStruct) updateFn) =>
      listOfMemebrslocal[index] = updateFn(listOfMemebrslocal[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
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
