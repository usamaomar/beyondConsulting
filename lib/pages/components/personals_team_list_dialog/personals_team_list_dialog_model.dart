import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'personals_team_list_dialog_widget.dart'
    show PersonalsTeamListDialogWidget;
import 'package:flutter/material.dart';

class PersonalsTeamListDialogModel
    extends FlutterFlowModel<PersonalsTeamListDialogWidget> {
  ///  Local state fields for this component.

  UserModelStruct? seniorModel;
  void updateSeniorModelStruct(Function(UserModelStruct) updateFn) =>
      updateFn(seniorModel ??= UserModelStruct());

  List<UserModelStruct> midManagersModelList = [];
  void addToMidManagersModelList(UserModelStruct item) =>
      midManagersModelList.add(item);
  void removeFromMidManagersModelList(UserModelStruct item) =>
      midManagersModelList.remove(item);
  void removeAtIndexFromMidManagersModelList(int index) =>
      midManagersModelList.removeAt(index);
  void insertAtIndexInMidManagersModelList(int index, UserModelStruct item) =>
      midManagersModelList.insert(index, item);
  void updateMidManagersModelListAtIndex(
          int index, Function(UserModelStruct) updateFn) =>
      midManagersModelList[index] = updateFn(midManagersModelList[index]);

  List<UserModelStruct> associatesModelList = [];
  void addToAssociatesModelList(UserModelStruct item) =>
      associatesModelList.add(item);
  void removeFromAssociatesModelList(UserModelStruct item) =>
      associatesModelList.remove(item);
  void removeAtIndexFromAssociatesModelList(int index) =>
      associatesModelList.removeAt(index);
  void insertAtIndexInAssociatesModelList(int index, UserModelStruct item) =>
      associatesModelList.insert(index, item);
  void updateAssociatesModelListAtIndex(
          int index, Function(UserModelStruct) updateFn) =>
      associatesModelList[index] = updateFn(associatesModelList[index]);

  List<UserModelStruct> midManagersSelectedIds = [];
  void addToMidManagersSelectedIds(UserModelStruct item) =>
      midManagersSelectedIds.add(item);
  void removeFromMidManagersSelectedIds(UserModelStruct item) =>
      midManagersSelectedIds.remove(item);
  void removeAtIndexFromMidManagersSelectedIds(int index) =>
      midManagersSelectedIds.removeAt(index);
  void insertAtIndexInMidManagersSelectedIds(int index, UserModelStruct item) =>
      midManagersSelectedIds.insert(index, item);
  void updateMidManagersSelectedIdsAtIndex(
          int index, Function(UserModelStruct) updateFn) =>
      midManagersSelectedIds[index] = updateFn(midManagersSelectedIds[index]);

  List<UserModelStruct> associatesSelectedIds = [];
  void addToAssociatesSelectedIds(UserModelStruct item) =>
      associatesSelectedIds.add(item);
  void removeFromAssociatesSelectedIds(UserModelStruct item) =>
      associatesSelectedIds.remove(item);
  void removeAtIndexFromAssociatesSelectedIds(int index) =>
      associatesSelectedIds.removeAt(index);
  void insertAtIndexInAssociatesSelectedIds(int index, UserModelStruct item) =>
      associatesSelectedIds.insert(index, item);
  void updateAssociatesSelectedIdsAtIndex(
          int index, Function(UserModelStruct) updateFn) =>
      associatesSelectedIds[index] = updateFn(associatesSelectedIds[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetPersonalsApi)] action in personalsTeamListDialog widget.
  ApiCallResponse? apiResult4a6;
  // State field(s) for Checkbox widget.

  Map<UserModelStruct, bool> checkboxValueMap1 = {};
  List<UserModelStruct> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<UserModelStruct, bool> checkboxValueMap2 = {};
  List<UserModelStruct> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
