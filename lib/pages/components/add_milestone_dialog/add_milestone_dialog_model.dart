import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/dialog_text_drop_douwn_list_component/dialog_text_drop_douwn_list_component_widget.dart';
import 'add_milestone_dialog_widget.dart' show AddMilestoneDialogWidget;
import 'package:flutter/material.dart';

class AddMilestoneDialogModel
    extends FlutterFlowModel<AddMilestoneDialogWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? invoiceFile;

  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // Model for DialogTextDropDouwnListComponent component.
  late DialogTextDropDouwnListComponentModel
      dialogTextDropDouwnListComponentModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for DialogTextDropDouwnListComponent component.
  late DialogTextDropDouwnListComponentModel
      dialogTextDropDouwnListComponentModel2;
  // Model for DialogTextDropDouwnListComponent component.
  late DialogTextDropDouwnListComponentModel
      dialogTextDropDouwnListComponentModel3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dialogTextDropDouwnListComponentModel1 =
        createModel(context, () => DialogTextDropDouwnListComponentModel());
    dialogTextDropDouwnListComponentModel2 =
        createModel(context, () => DialogTextDropDouwnListComponentModel());
    dialogTextDropDouwnListComponentModel3 =
        createModel(context, () => DialogTextDropDouwnListComponentModel());
  }

  @override
  void dispose() {
    dialogTextDropDouwnListComponentModel1.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    dialogTextDropDouwnListComponentModel2.dispose();
    dialogTextDropDouwnListComponentModel3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
