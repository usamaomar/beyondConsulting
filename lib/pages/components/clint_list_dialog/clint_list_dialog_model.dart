import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'clint_list_dialog_widget.dart' show ClintListDialogWidget;
import 'package:flutter/material.dart';

class ClintListDialogModel extends FlutterFlowModel<ClintListDialogWidget> {
  ///  Local state fields for this component.

  List<ClientModelStruct> clientList = [];
  void addToClientList(ClientModelStruct item) => clientList.add(item);
  void removeFromClientList(ClientModelStruct item) => clientList.remove(item);
  void removeAtIndexFromClientList(int index) => clientList.removeAt(index);
  void insertAtIndexInClientList(int index, ClientModelStruct item) =>
      clientList.insert(index, item);
  void updateClientListAtIndex(
          int index, Function(ClientModelStruct) updateFn) =>
      clientList[index] = updateFn(clientList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetAllClientsApi)] action in ClintListDialog widget.
  ApiCallResponse? apiResulttcj;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
