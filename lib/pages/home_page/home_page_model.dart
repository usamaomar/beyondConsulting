import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  StatisticsModelStruct? statisticsModel;
  void updateStatisticsModelStruct(Function(StatisticsModelStruct) updateFn) =>
      updateFn(statisticsModel ??= StatisticsModelStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetStatisticsApi)] action in HomePage widget.
  ApiCallResponse? apiResult8gj;
  // Stores action output result for [Backend Call - API (GetMyPrioritiesApi)] action in HomePage widget.
  ApiCallResponse? apiResultscn;
  // Stores action output result for [Backend Call - API (GetMyProjectsApi)] action in HomePage widget.
  ApiCallResponse? apiProjectResultscn;
  // Stores action output result for [Backend Call - API (GetProjectStatisticsApi)] action in HomePage widget.
  ApiCallResponse? apiProjectStats;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
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
