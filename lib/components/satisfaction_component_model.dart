import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'satisfaction_component_widget.dart' show SatisfactionComponentWidget;
import 'package:flutter/material.dart';

class SatisfactionComponentModel
    extends FlutterFlowModel<SatisfactionComponentWidget> {
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
