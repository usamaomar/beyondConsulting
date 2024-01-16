import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'financial_page_widget.dart' show FinancialPageWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class FinancialPageModel extends FlutterFlowModel<FinancialPageWidget> {
  ///  Local state fields for this page.

  String currentYear = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (GetFinancialBudgetExcelApi)] action in Button widget.
  ApiCallResponse? apiResultrqd;
  // Stores action output result for [Backend Call - API (GetFinancialProjectSummaryExcelApi)] action in Button widget.
  ApiCallResponse? apiResultrqd2;
  // Stores action output result for [Backend Call - API (GetCostManagementActualIncomeExcelApi)] action in Button widget.
  ApiCallResponse? apiResultrqd24;
  // Stores action output result for [Backend Call - API (GetFinancialResultsExcelApi)] action in Button widget.
  ApiCallResponse? apiResultrqd245;
  // Stores action output result for [Backend Call - API (GetFinancialBudgetReportApi)] action in Card widget.
  ApiCallResponse? apiResultrd4;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (UpdateYearBudgetApi)] action in Card widget.
  ApiCallResponse? apiResultrd4;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    sideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
