import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'main_dash_board_page_widget.dart' show MainDashBoardPageWidget;
import 'package:flutter/material.dart';

class MainDashBoardPageModel extends FlutterFlowModel<MainDashBoardPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideNav component.
  late SideNavModel sideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
