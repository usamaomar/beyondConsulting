import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/read_member_cpacity/read_member_cpacity_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'team_capacities_page_widget.dart' show TeamCapacitiesPageWidget;
import 'package:flutter/material.dart';

class TeamCapacitiesPageModel
    extends FlutterFlowModel<TeamCapacitiesPageWidget> {
  ///  Local state fields for this page.

  TeamMembersModelStruct? teamMemberModel;
  void updateTeamMemberModelStruct(Function(TeamMembersModelStruct) updateFn) =>
      updateFn(teamMemberModel ??= TeamMembersModelStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetMyTeamApi)] action in TeamCapacitiesPage widget.
  ApiCallResponse? apiResult1xv;
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel> readMemberCpacityModels;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    readMemberCpacityModels =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    readMemberCpacityModels.dispose();
    sideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
