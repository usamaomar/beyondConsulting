import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  UserModelStruct _userModelAppState = UserModelStruct.fromSerializableMap(
      jsonDecode(
          '{"supervisorName":"name","profilePictureDataUrl":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwk9ehRwCXvCb9IP02EyqUz-ppXch-25QRBA&usqp=CAU"}'));
  UserModelStruct get userModelAppState => _userModelAppState;
  set userModelAppState(UserModelStruct value) {
    _userModelAppState = value;
  }

  void updateUserModelAppStateStruct(Function(UserModelStruct) updateFn) {
    updateFn(_userModelAppState);
  }

  TokenModelStruct _tokenModelAppState = TokenModelStruct();
  TokenModelStruct get tokenModelAppState => _tokenModelAppState;
  set tokenModelAppState(TokenModelStruct value) {
    _tokenModelAppState = value;
  }

  void updateTokenModelAppStateStruct(Function(TokenModelStruct) updateFn) {
    updateFn(_tokenModelAppState);
  }

  List<PrioritieModelStruct> _prioritiesListAppState = [
    PrioritieModelStruct.fromSerializableMap(jsonDecode(
        '{"mileStoneId":"0","projectId":"0","projectName":" ","client":" ","clientId":"0","clientLogo":"https://picsum.photos/seed/299/600","startDate":"1700483896348","endDate":"1700483896348","description":"Hello World","status":"0","title":" ","amount":"0","reminderOffset":"0","milestoneType":"0","progress":"0","invoiceUrl":" ","invoiceStatus":"0","members":"[\\"{\\\\\\"id\\\\\\":\\\\\\" \\\\\\",\\\\\\"name\\\\\\":\\\\\\" \\\\\\",\\\\\\"picture\\\\\\":\\\\\\"https://picsum.photos/seed/119/600\\\\\\"}\\"]"}'))
  ];
  List<PrioritieModelStruct> get prioritiesListAppState =>
      _prioritiesListAppState;
  set prioritiesListAppState(List<PrioritieModelStruct> value) {
    _prioritiesListAppState = value;
  }

  void addToPrioritiesListAppState(PrioritieModelStruct value) {
    _prioritiesListAppState.add(value);
  }

  void removeFromPrioritiesListAppState(PrioritieModelStruct value) {
    _prioritiesListAppState.remove(value);
  }

  void removeAtIndexFromPrioritiesListAppState(int index) {
    _prioritiesListAppState.removeAt(index);
  }

  void updatePrioritiesListAppStateAtIndex(
    int index,
    PrioritieModelStruct Function(PrioritieModelStruct) updateFn,
  ) {
    _prioritiesListAppState[index] = updateFn(_prioritiesListAppState[index]);
  }

  void insertAtIndexInPrioritiesListAppState(
      int index, PrioritieModelStruct value) {
    _prioritiesListAppState.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
