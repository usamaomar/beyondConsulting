import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_see_all_widget.dart' show HomePageSeeAllWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class HomePageSeeAllModel extends FlutterFlowModel<HomePageSeeAllWidget> {
  ///  Local state fields for this page.

  List<ProjectModelStruct> listOfProjects = [];
  void addToListOfProjects(ProjectModelStruct item) => listOfProjects.add(item);
  void removeFromListOfProjects(ProjectModelStruct item) =>
      listOfProjects.remove(item);
  void removeAtIndexFromListOfProjects(int index) =>
      listOfProjects.removeAt(index);
  void insertAtIndexInListOfProjects(int index, ProjectModelStruct item) =>
      listOfProjects.insert(index, item);
  void updateListOfProjectsAtIndex(
          int index, Function(ProjectModelStruct) updateFn) =>
      listOfProjects[index] = updateFn(listOfProjects[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetAllProjectsApi)] action in HomePageSeeAll widget.
  ApiCallResponse? apiResultbod;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
