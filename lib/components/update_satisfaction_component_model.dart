import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_satisfaction_component_widget.dart'
    show UpdateSatisfactionComponentWidget;
import 'package:flutter/material.dart';

class UpdateSatisfactionComponentModel
    extends FlutterFlowModel<UpdateSatisfactionComponentWidget> {
  ///  Local state fields for this component.

  List<SatisfactionModelStruct> satisfactionLocalsList = [];
  void addToSatisfactionLocalsList(SatisfactionModelStruct item) =>
      satisfactionLocalsList.add(item);
  void removeFromSatisfactionLocalsList(SatisfactionModelStruct item) =>
      satisfactionLocalsList.remove(item);
  void removeAtIndexFromSatisfactionLocalsList(int index) =>
      satisfactionLocalsList.removeAt(index);
  void insertAtIndexInSatisfactionLocalsList(
          int index, SatisfactionModelStruct item) =>
      satisfactionLocalsList.insert(index, item);
  void updateSatisfactionLocalsListAtIndex(
          int index, Function(SatisfactionModelStruct) updateFn) =>
      satisfactionLocalsList[index] = updateFn(satisfactionLocalsList[index]);

  int satsfac = 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
