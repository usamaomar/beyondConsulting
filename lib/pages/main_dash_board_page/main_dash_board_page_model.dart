import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/satisfaction_component_main_dash_board_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/read_member_cpacity/read_member_cpacity_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'main_dash_board_page_widget.dart' show MainDashBoardPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class MainDashBoardPageModel extends FlutterFlowModel<MainDashBoardPageWidget> {
  ///  Local state fields for this page.

  List<ProjectModelStruct> listOfLiveTracker = [];
  void addToListOfLiveTracker(ProjectModelStruct item) =>
      listOfLiveTracker.add(item);
  void removeFromListOfLiveTracker(ProjectModelStruct item) =>
      listOfLiveTracker.remove(item);
  void removeAtIndexFromListOfLiveTracker(int index) =>
      listOfLiveTracker.removeAt(index);
  void insertAtIndexInListOfLiveTracker(int index, ProjectModelStruct item) =>
      listOfLiveTracker.insert(index, item);
  void updateListOfLiveTrackerAtIndex(
          int index, Function(ProjectModelStruct) updateFn) =>
      listOfLiveTracker[index] = updateFn(listOfLiveTracker[index]);

  List<PrioritieModelStruct> listOfProirtes = [];
  void addToListOfProirtes(PrioritieModelStruct item) =>
      listOfProirtes.add(item);
  void removeFromListOfProirtes(PrioritieModelStruct item) =>
      listOfProirtes.remove(item);
  void removeAtIndexFromListOfProirtes(int index) =>
      listOfProirtes.removeAt(index);
  void insertAtIndexInListOfProirtes(int index, PrioritieModelStruct item) =>
      listOfProirtes.insert(index, item);
  void updateListOfProirtesAtIndex(
          int index, Function(PrioritieModelStruct) updateFn) =>
      listOfProirtes[index] = updateFn(listOfProirtes[index]);

  List<ProjectModelStruct> allProjectsList = [];
  void addToAllProjectsList(ProjectModelStruct item) =>
      allProjectsList.add(item);
  void removeFromAllProjectsList(ProjectModelStruct item) =>
      allProjectsList.remove(item);
  void removeAtIndexFromAllProjectsList(int index) =>
      allProjectsList.removeAt(index);
  void insertAtIndexInAllProjectsList(int index, ProjectModelStruct item) =>
      allProjectsList.insert(index, item);
  void updateAllProjectsListAtIndex(
          int index, Function(ProjectModelStruct) updateFn) =>
      allProjectsList[index] = updateFn(allProjectsList[index]);

  String seniorName = '';

  String seniorId = '';

  String seniorPicure = ',';

  List<MemberModelStruct> listtAssosiates = [];
  void addToListtAssosiates(MemberModelStruct item) =>
      listtAssosiates.add(item);
  void removeFromListtAssosiates(MemberModelStruct item) =>
      listtAssosiates.remove(item);
  void removeAtIndexFromListtAssosiates(int index) =>
      listtAssosiates.removeAt(index);
  void insertAtIndexInListtAssosiates(int index, MemberModelStruct item) =>
      listtAssosiates.insert(index, item);
  void updateListtAssosiatesAtIndex(
          int index, Function(MemberModelStruct) updateFn) =>
      listtAssosiates[index] = updateFn(listtAssosiates[index]);

  List<MemberModelStruct> listOfMids = [];
  void addToListOfMids(MemberModelStruct item) => listOfMids.add(item);
  void removeFromListOfMids(MemberModelStruct item) => listOfMids.remove(item);
  void removeAtIndexFromListOfMids(int index) => listOfMids.removeAt(index);
  void insertAtIndexInListOfMids(int index, MemberModelStruct item) =>
      listOfMids.insert(index, item);
  void updateListOfMidsAtIndex(
          int index, Function(MemberModelStruct) updateFn) =>
      listOfMids[index] = updateFn(listOfMids[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetMyProjectTrackersApi)] action in MainDashBoardPage widget.
  ApiCallResponse? apiResult7fn;
  // Stores action output result for [Backend Call - API (GetMyPrioritiesApi)] action in MainDashBoardPage widget.
  ApiCallResponse? apiResulty7y;
  // Stores action output result for [Backend Call - API (GetMyProjectsApi)] action in MainDashBoardPage widget.
  ApiCallResponse? apiResultv1q;
  // Stores action output result for [Backend Call - API (GetPersonalsApi)] action in MainDashBoardPage widget.
  ApiCallResponse? apiResult8i4;
  // Models for ReadMemberCpacity dynamic component.
  late FlutterFlowDynamicModels<ReadMemberCpacityModel> readMemberCpacityModels;
  // Models for satisfactionComponentMainDashBoard dynamic component.
  late FlutterFlowDynamicModels<SatisfactionComponentMainDashBoardModel>
      satisfactionComponentMainDashBoardModels;
  // State field(s) for Timer widget.
  int timerMilliseconds = 2000;
  String timerValue = StopWatchTimer.getDisplayTime(
    2000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - API (GetMyProjectTrackersApi)] action in Timer widget.
  ApiCallResponse? apiResult7fn5;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    readMemberCpacityModels =
        FlutterFlowDynamicModels(() => ReadMemberCpacityModel());
    satisfactionComponentMainDashBoardModels = FlutterFlowDynamicModels(
        () => SatisfactionComponentMainDashBoardModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    readMemberCpacityModels.dispose();
    satisfactionComponentMainDashBoardModels.dispose();
    timerController.dispose();
    sideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
