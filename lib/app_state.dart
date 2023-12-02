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

  List<ClientModelStruct> _clientList = [];
  List<ClientModelStruct> get clientList => _clientList;
  set clientList(List<ClientModelStruct> value) {
    _clientList = value;
  }

  void addToClientList(ClientModelStruct value) {
    _clientList.add(value);
  }

  void removeFromClientList(ClientModelStruct value) {
    _clientList.remove(value);
  }

  void removeAtIndexFromClientList(int index) {
    _clientList.removeAt(index);
  }

  void updateClientListAtIndex(
    int index,
    ClientModelStruct Function(ClientModelStruct) updateFn,
  ) {
    _clientList[index] = updateFn(_clientList[index]);
  }

  void insertAtIndexInClientList(int index, ClientModelStruct value) {
    _clientList.insert(index, value);
  }

  List<MileStoneStateModelStruct> _mileStoneModelAppState = [
    MileStoneStateModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"لم يبدأ","nameEn":"Not Started","stateId":"0"}')),
    MileStoneStateModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"عن مسارها","nameEn":"Offtrack","stateId":"1"}')),
    MileStoneStateModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"في تَقَدم","nameEn":"In Progress","stateId":"2"}')),
    MileStoneStateModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"في خطر","nameEn":"At Risk","stateId":"3"}')),
    MileStoneStateModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"ألغيت","nameEn":"Canceled","stateId":"4"}')),
    MileStoneStateModelStruct.fromSerializableMap(jsonDecode(
        '{"nameAr":"مكتمل","nameEn":"Completed","stateId":"5"}'))
  ];
  List<MileStoneStateModelStruct> get mileStoneModelAppState =>
      _mileStoneModelAppState;
  set mileStoneModelAppState(List<MileStoneStateModelStruct> value) {
    _mileStoneModelAppState = value;
  }

  void addToMileStoneModelAppState(MileStoneStateModelStruct value) {
    _mileStoneModelAppState.add(value);
  }

  void removeFromMileStoneModelAppState(MileStoneStateModelStruct value) {
    _mileStoneModelAppState.remove(value);
  }

  void removeAtIndexFromMileStoneModelAppState(int index) {
    _mileStoneModelAppState.removeAt(index);
  }

  void updateMileStoneModelAppStateAtIndex(
    int index,
    MileStoneStateModelStruct Function(MileStoneStateModelStruct) updateFn,
  ) {
    _mileStoneModelAppState[index] = updateFn(_mileStoneModelAppState[index]);
  }

  void insertAtIndexInMileStoneModelAppState(
      int index, MileStoneStateModelStruct value) {
    _mileStoneModelAppState.insert(index, value);
  }

  List<int> _reminderIntList = [1, 2, 4, 5];
  List<int> get reminderIntList => _reminderIntList;
  set reminderIntList(List<int> value) {
    _reminderIntList = value;
  }

  void addToReminderIntList(int value) {
    _reminderIntList.add(value);
  }

  void removeFromReminderIntList(int value) {
    _reminderIntList.remove(value);
  }

  void removeAtIndexFromReminderIntList(int index) {
    _reminderIntList.removeAt(index);
  }

  void updateReminderIntListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _reminderIntList[index] = updateFn(_reminderIntList[index]);
  }

  void insertAtIndexInReminderIntList(int index, int value) {
    _reminderIntList.insert(index, value);
  }

  List<MemberModelStruct> _listOfRols = [];
  List<MemberModelStruct> get listOfRols => _listOfRols;
  set listOfRols(List<MemberModelStruct> value) {
    _listOfRols = value;
  }

  void addToListOfRols(MemberModelStruct value) {
    _listOfRols.add(value);
  }

  void removeFromListOfRols(MemberModelStruct value) {
    _listOfRols.remove(value);
  }

  void removeAtIndexFromListOfRols(int index) {
    _listOfRols.removeAt(index);
  }

  void updateListOfRolsAtIndex(
    int index,
    MemberModelStruct Function(MemberModelStruct) updateFn,
  ) {
    _listOfRols[index] = updateFn(_listOfRols[index]);
  }

  void insertAtIndexInListOfRols(int index, MemberModelStruct value) {
    _listOfRols.insert(index, value);
  }

  MilestoneModelStruct _SelectedMileStoneModel = MilestoneModelStruct();
  MilestoneModelStruct get SelectedMileStoneModel => _SelectedMileStoneModel;
  set SelectedMileStoneModel(MilestoneModelStruct value) {
    _SelectedMileStoneModel = value;
  }

  void updateSelectedMileStoneModelStruct(
      Function(MilestoneModelStruct) updateFn) {
    updateFn(_SelectedMileStoneModel);
  }

  CostModelStruct _SelectedCostModel = CostModelStruct();
  CostModelStruct get SelectedCostModel => _SelectedCostModel;
  set SelectedCostModel(CostModelStruct value) {
    _SelectedCostModel = value;
  }

  void updateSelectedCostModelStruct(Function(CostModelStruct) updateFn) {
    updateFn(_SelectedCostModel);
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
