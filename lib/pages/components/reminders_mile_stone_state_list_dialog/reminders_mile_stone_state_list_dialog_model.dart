import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'reminders_mile_stone_state_list_dialog_widget.dart'
    show RemindersMileStoneStateListDialogWidget;
import 'package:flutter/material.dart';

class RemindersMileStoneStateListDialogModel
    extends FlutterFlowModel<RemindersMileStoneStateListDialogWidget> {
  ///  Local state fields for this component.

  List<CountryModelStruct> countryList = [];
  void addToCountryList(CountryModelStruct item) => countryList.add(item);
  void removeFromCountryList(CountryModelStruct item) =>
      countryList.remove(item);
  void removeAtIndexFromCountryList(int index) => countryList.removeAt(index);
  void insertAtIndexInCountryList(int index, CountryModelStruct item) =>
      countryList.insert(index, item);
  void updateCountryListAtIndex(
          int index, Function(CountryModelStruct) updateFn) =>
      countryList[index] = updateFn(countryList[index]);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
