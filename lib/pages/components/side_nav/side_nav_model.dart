import '../../../backend/schema/structs/team_members_model_struct.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_nav_widget.dart' show SideNavWidget;
import 'package:flutter/material.dart';

class SideNavModel extends FlutterFlowModel<SideNavWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetMyProjectsCreationApi)] action in SideNav widget.
  ApiCallResponse? apiResultoho;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (ImAvailableApi)] action in Switch widget.
  ApiCallResponse? apiResultv5n;
  // Stores action output result for [Backend Call - API (ImAvailableApi)] action in Switch widget.
  ApiCallResponse? apiResultpos;

  /// Initialization and disposal methods.
  ///
  ///
  ///


  TeamMembersModelStruct? teamMemberModel;
  void updateTeamMemberModelStruct(Function(TeamMembersModelStruct) updateFn) =>
      updateFn(teamMemberModel ??= TeamMembersModelStruct());

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetMyTeamApi)] action in TeamCapacitiesPage widget.
  ApiCallResponse? apiResult1xv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
