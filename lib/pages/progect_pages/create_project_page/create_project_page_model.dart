import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/pages/components/text_drop_douwn_list_component/text_drop_douwn_list_component_widget.dart';
import 'create_project_page_widget.dart' show CreateProjectPageWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CreateProjectPageModel extends FlutterFlowModel<CreateProjectPageWidget> {
  ///  Local state fields for this page.

  List<MemberModelStruct> listOfRols = [];
  void addToListOfRols(MemberModelStruct item) => listOfRols.add(item);
  void removeFromListOfRols(MemberModelStruct item) => listOfRols.remove(item);
  void removeAtIndexFromListOfRols(int index) => listOfRols.removeAt(index);
  void insertAtIndexInListOfRols(int index, MemberModelStruct item) =>
      listOfRols.insert(index, item);
  void updateListOfRolsAtIndex(
          int index, Function(MemberModelStruct) updateFn) =>
      listOfRols[index] = updateFn(listOfRols[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for TextDropDouwnListComponent component.
  late TextDropDouwnListComponentModel textDropDouwnListComponentModel;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Checkbox widget.

  Map<MemberModelStruct, bool> checkboxValueMap1 = {};
  List<MemberModelStruct> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<MemberModelStruct, bool> checkboxValueMap2 = {};
  List<MemberModelStruct> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    textDropDouwnListComponentModel =
        createModel(context, () => TextDropDouwnListComponentModel());
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textDropDouwnListComponentModel.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
