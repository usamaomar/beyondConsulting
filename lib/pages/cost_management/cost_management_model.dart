import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/cost_drop_component/cost_drop_component_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'cost_management_widget.dart' show CostManagementWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CostManagementModel extends FlutterFlowModel<CostManagementWidget> {
  ///  Local state fields for this page.

  ProjectModelStruct? projectModel;
  void updateProjectModelStruct(Function(ProjectModelStruct) updateFn) =>
      updateFn(projectModel ??= ProjectModelStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for CostDropComponent dynamic component.
  late FlutterFlowDynamicModels<CostDropComponentModel> costDropComponentModels;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    costDropComponentModels =
        FlutterFlowDynamicModels(() => CostDropComponentModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    costDropComponentModels.dispose();
    sideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
