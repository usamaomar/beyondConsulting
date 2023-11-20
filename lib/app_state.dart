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
