import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'countries_list_dialog_widget.dart' show CountriesListDialogWidget;
import 'package:flutter/material.dart';

class CountriesListDialogModel
    extends FlutterFlowModel<CountriesListDialogWidget> {
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

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
