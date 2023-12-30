import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/cost_drop_component/cost_drop_component_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'all_costs_page_widget.dart' show AllCostsPageWidget;
import 'package:flutter/material.dart';

class AllCostsPageModel extends FlutterFlowModel<AllCostsPageWidget> {
  ///  Local state fields for this page.

  List<CostModelStruct> allCostsList = [];
  void addToAllCostsList(CostModelStruct item) => allCostsList.add(item);
  void removeFromAllCostsList(CostModelStruct item) =>
      allCostsList.remove(item);
  void removeAtIndexFromAllCostsList(int index) => allCostsList.removeAt(index);
  void insertAtIndexInAllCostsList(int index, CostModelStruct item) =>
      allCostsList.insert(index, item);
  void updateAllCostsListAtIndex(
          int index, Function(CostModelStruct) updateFn) =>
      allCostsList[index] = updateFn(allCostsList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetAllCostsApi)] action in AllCostsPage widget.
  ApiCallResponse? apiResulttbe;
  // Models for CostDropComponent dynamic component.
  late FlutterFlowDynamicModels<CostDropComponentModel> costDropComponentModels;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadFile)] action in Container widget.
  ApiCallResponse? outUpload;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
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
