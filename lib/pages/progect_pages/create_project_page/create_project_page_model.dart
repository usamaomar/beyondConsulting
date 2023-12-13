import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/clint_drop_douwn_list_component/clint_drop_douwn_list_component_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/pages/components/text_drop_douwn_list_component/text_drop_douwn_list_component_widget.dart';
import '/pages/components/type_drop_douwn_list_component/type_drop_douwn_list_component_widget.dart';
import 'create_project_page_widget.dart' show CreateProjectPageWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CreateProjectPageModel extends FlutterFlowModel<CreateProjectPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for TextDropDouwnListComponent component.
  late TextDropDouwnListComponentModel textDropDouwnListComponentModel1;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for TypeDropDouwnListComponent component.
  late TypeDropDouwnListComponentModel typeDropDouwnListComponentModel;
  // Model for TextDropDouwnListComponent component.
  late TextDropDouwnListComponentModel textDropDouwnListComponentModel2;
  // State field(s) for Checkbox widget.

  Map<MemberModelStruct, bool> checkboxValueMap = {};
  List<MemberModelStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for ClintDropDouwnListComponent component.
  late ClintDropDouwnListComponentModel clintDropDouwnListComponentModel;
  // Stores action output result for [Backend Call - API (CreateProjectApi)] action in Button widget.
  ApiCallResponse? apiResultb91;
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textDropDouwnListComponentModel1 =
        createModel(context, () => TextDropDouwnListComponentModel());
    typeDropDouwnListComponentModel =
        createModel(context, () => TypeDropDouwnListComponentModel());
    textDropDouwnListComponentModel2 =
        createModel(context, () => TextDropDouwnListComponentModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
    clintDropDouwnListComponentModel =
        createModel(context, () => ClintDropDouwnListComponentModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textDropDouwnListComponentModel1.dispose();
    typeDropDouwnListComponentModel.dispose();
    textDropDouwnListComponentModel2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    clintDropDouwnListComponentModel.dispose();
    sideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
