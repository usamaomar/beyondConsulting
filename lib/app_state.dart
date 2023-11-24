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

  List<PrioritieModelStruct> _prioritiesListAppState = [];
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

  List<ProjectModelStruct> _projectsListAppState = [];
  List<ProjectModelStruct> get projectsListAppState => _projectsListAppState;
  set projectsListAppState(List<ProjectModelStruct> value) {
    _projectsListAppState = value;
  }

  void addToProjectsListAppState(ProjectModelStruct value) {
    _projectsListAppState.add(value);
  }

  void removeFromProjectsListAppState(ProjectModelStruct value) {
    _projectsListAppState.remove(value);
  }

  void removeAtIndexFromProjectsListAppState(int index) {
    _projectsListAppState.removeAt(index);
  }

  void updateProjectsListAppStateAtIndex(
    int index,
    ProjectModelStruct Function(ProjectModelStruct) updateFn,
  ) {
    _projectsListAppState[index] = updateFn(_projectsListAppState[index]);
  }

  void insertAtIndexInProjectsListAppState(
      int index, ProjectModelStruct value) {
    _projectsListAppState.insert(index, value);
  }

  ProjectStatisticModelStruct _ProjectStatisticsModel =
      ProjectStatisticModelStruct();
  ProjectStatisticModelStruct get ProjectStatisticsModel =>
      _ProjectStatisticsModel;
  set ProjectStatisticsModel(ProjectStatisticModelStruct value) {
    _ProjectStatisticsModel = value;
  }

  void updateProjectStatisticsModelStruct(
      Function(ProjectStatisticModelStruct) updateFn) {
    updateFn(_ProjectStatisticsModel);
  }

  bool _projectIsOpend = false;
  bool get projectIsOpend => _projectIsOpend;
  set projectIsOpend(bool value) {
    _projectIsOpend = value;
  }

  List<ProjectModelStruct> _projectListCreationAppState = [];
  List<ProjectModelStruct> get projectListCreationAppState =>
      _projectListCreationAppState;
  set projectListCreationAppState(List<ProjectModelStruct> value) {
    _projectListCreationAppState = value;
  }

  void addToProjectListCreationAppState(ProjectModelStruct value) {
    _projectListCreationAppState.add(value);
  }

  void removeFromProjectListCreationAppState(ProjectModelStruct value) {
    _projectListCreationAppState.remove(value);
  }

  void removeAtIndexFromProjectListCreationAppState(int index) {
    _projectListCreationAppState.removeAt(index);
  }

  void updateProjectListCreationAppStateAtIndex(
    int index,
    ProjectModelStruct Function(ProjectModelStruct) updateFn,
  ) {
    _projectListCreationAppState[index] =
        updateFn(_projectListCreationAppState[index]);
  }

  void insertAtIndexInProjectListCreationAppState(
      int index, ProjectModelStruct value) {
    _projectListCreationAppState.insert(index, value);
  }

  ProjectModelStruct _newProjectCreatedModel = ProjectModelStruct();
  ProjectModelStruct get newProjectCreatedModel => _newProjectCreatedModel;
  set newProjectCreatedModel(ProjectModelStruct value) {
    _newProjectCreatedModel = value;
  }

  void updateNewProjectCreatedModelStruct(
      Function(ProjectModelStruct) updateFn) {
    updateFn(_newProjectCreatedModel);
  }

  List<ProjectTypeModelStruct> _projectTypesList = [
    ProjectTypeModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"آ","nameEn":"A","color":"#ea0202","type":"4"}')),
    ProjectTypeModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"ب","nameEn":"B","color":"#008000","type":"2"}')),
    ProjectTypeModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"ج","nameEn":"C","color":"#ffd600","type":"1"}'))
  ];
  List<ProjectTypeModelStruct> get projectTypesList => _projectTypesList;
  set projectTypesList(List<ProjectTypeModelStruct> value) {
    _projectTypesList = value;
  }

  void addToProjectTypesList(ProjectTypeModelStruct value) {
    _projectTypesList.add(value);
  }

  void removeFromProjectTypesList(ProjectTypeModelStruct value) {
    _projectTypesList.remove(value);
  }

  void removeAtIndexFromProjectTypesList(int index) {
    _projectTypesList.removeAt(index);
  }

  void updateProjectTypesListAtIndex(
    int index,
    ProjectTypeModelStruct Function(ProjectTypeModelStruct) updateFn,
  ) {
    _projectTypesList[index] = updateFn(_projectTypesList[index]);
  }

  void insertAtIndexInProjectTypesList(
      int index, ProjectTypeModelStruct value) {
    _projectTypesList.insert(index, value);
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
