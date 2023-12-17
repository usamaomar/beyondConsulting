import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/read_member_cpacity/read_member_cpacity_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'all_team_capacities_page_widget.dart' show AllTeamCapacitiesPageWidget;
import 'package:flutter/material.dart';

class AllTeamCapacitiesPageModel
    extends FlutterFlowModel<AllTeamCapacitiesPageWidget> {
  ///  Local state fields for this page.

  TeamMembersModelStruct? teamMemberModel;
  void updateTeamMemberModelStruct(Function(TeamMembersModelStruct) updateFn) =>
      updateFn(teamMemberModel ??= TeamMembersModelStruct());

  List<TeamTapModelStruct> teamTabModel = [];
  void addToTeamTabModel(TeamTapModelStruct item) => teamTabModel.add(item);
  void removeFromTeamTabModel(TeamTapModelStruct item) =>
      teamTabModel.remove(item);
  void removeAtIndexFromTeamTabModel(int index) => teamTabModel.removeAt(index);
  void insertAtIndexInTeamTabModel(int index, TeamTapModelStruct item) =>
      teamTabModel.insert(index, item);
  void updateTeamTabModelAtIndex(
          int index, Function(TeamTapModelStruct) updateFn) =>
      teamTabModel[index] = updateFn(teamTabModel[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetMyTeamApi)] action in AllTeamCapacitiesPage widget.
  ApiCallResponse? apiResult1xv;
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel>
      readMemberCpacityModels1;
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel>
      readMemberCpacityModels2;
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel>
      readMemberCpacityModels3;
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel>
      readMemberCpacityModels4;
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel>
      readMemberCpacityModels5;
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel>
      readMemberCpacityModels6;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    readMemberCpacityModels1 =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    readMemberCpacityModels2 =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    readMemberCpacityModels3 =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    readMemberCpacityModels4 =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    readMemberCpacityModels5 =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    readMemberCpacityModels6 =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    readMemberCpacityModels1.dispose();
    readMemberCpacityModels2.dispose();
    readMemberCpacityModels3.dispose();
    readMemberCpacityModels4.dispose();
    readMemberCpacityModels5.dispose();
    readMemberCpacityModels6.dispose();
    sideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
