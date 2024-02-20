import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
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

  List<CostModelStruct> savedAllCostsList = [];

  ///  State fields for stateful widgets in this page.
  DateTime? fromDatePicked;
  DateTime? toDatePicked;

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetAllCostsApi)] action in AllCostsPage widget.
  ApiCallResponse? apiResulttbe;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UploadFile)] action in Container widget.
  ApiCallResponse? outUpload;
  // Stores action output result for [Backend Call - API (UpdateAdminCostStatusApi)] action in Button widget.
  ApiCallResponse? apiResultz7xm;
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  late CostModelStruct costModelStruct;


  FocusNode? textFieldFocusNodeNote;
  TextEditingController? textControllerNote;
  String? Function(BuildContext, String?)? textController1ValidatorNote;


  FocusNode? textFieldFocusNodeAdminNote;
  TextEditingController? textControllerAdminNote;
  String? Function(BuildContext, String?)? textController1ValidatorAdminNote;



  FocusNode? textFieldFocusNodeActualBilledAmount;
  TextEditingController? textControllerActualBilledAmount;
  String? Function(BuildContext, String?)? textController1ValidatorActualBilledAmount;


  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    costModelStruct = CostModelStruct();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();

    textFieldFocusNodeNote?.dispose();
    textControllerNote?.dispose();

    textFieldFocusNodeAdminNote?.dispose();
    textControllerAdminNote?.dispose();


    textFieldFocusNodeActualBilledAmount?.dispose();
    textControllerActualBilledAmount?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
