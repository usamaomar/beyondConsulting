import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userModelAppState')) {
        try {
          final serializedData =
              prefs.getString('ff_userModelAppState') ?? '{}';
          _userModelAppState =
              UserModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_tokenModelAppState')) {
        try {
          final serializedData =
              prefs.getString('ff_tokenModelAppState') ?? '{}';
          _tokenModelAppState =
              TokenModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _prioritiesListAppState = prefs
              .getStringList('ff_prioritiesListAppState')
              ?.map((x) {
                try {
                  return PrioritieModelStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _prioritiesListAppState;
    });
    _safeInit(() {
      _projectsListAppState = prefs
              .getStringList('ff_projectsListAppState')
              ?.map((x) {
                try {
                  return ProjectModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _projectsListAppState;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ProjectStatisticsModel')) {
        try {
          final serializedData =
              prefs.getString('ff_ProjectStatisticsModel') ?? '{}';
          _ProjectStatisticsModel =
              ProjectStatisticModelStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _projectIsOpend = prefs.getBool('ff_projectIsOpend') ?? _projectIsOpend;
    });
    _safeInit(() {
      _projectListCreationAppState = prefs
              .getStringList('ff_projectListCreationAppState')
              ?.map((x) {
                try {
                  return ProjectModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _projectListCreationAppState;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_newProjectCreatedModel')) {
        try {
          final serializedData =
              prefs.getString('ff_newProjectCreatedModel') ?? '{}';
          _newProjectCreatedModel = ProjectModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _projectTypesList = prefs
              .getStringList('ff_projectTypesList')
              ?.map((x) {
                try {
                  return ProjectTypeModelStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _projectTypesList;
    });
    _safeInit(() {
      _clientList = prefs
              .getStringList('ff_clientList')
              ?.map((x) {
                try {
                  return ClientModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _clientList;
    });
    _safeInit(() {
      _mileStoneModelAppState = prefs
              .getStringList('ff_mileStoneModelAppState')
              ?.map((x) {
                try {
                  return MileStoneStateModelStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _mileStoneModelAppState;
    });
    _safeInit(() {
      _reminderIntList =
          prefs.getStringList('ff_reminderIntList')?.map(int.parse).toList() ??
              _reminderIntList;
    });
    _safeInit(() {
      _listOfRols = prefs
              .getStringList('ff_listOfRols')
              ?.map((x) {
                try {
                  return MemberModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _listOfRols;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_SelectedMileStoneModel')) {
        try {
          final serializedData =
              prefs.getString('ff_SelectedMileStoneModel') ?? '{}';
          _SelectedMileStoneModel = MilestoneModelStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_SelectedCostModel')) {
        try {
          final serializedData =
              prefs.getString('ff_SelectedCostModel') ?? '{}';
          _SelectedCostModel =
              CostModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _costIsOpend = prefs.getBool('ff_costIsOpend') ?? _costIsOpend;
    });
    _safeInit(() {
      _clintSatisfactionList = prefs
              .getStringList('ff_clintSatisfactionList')
              ?.map((x) {
                try {
                  return SatisfactionModelStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _clintSatisfactionList;
    });
    _safeInit(() {
      _colorList = prefs
              .getStringList('ff_colorList')
              ?.map((x) {
                try {
                  return ColorModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _colorList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_FrontColorModel')) {
        try {
          final serializedData = prefs.getString('ff_FrontColorModel') ?? '{}';
          _FrontColorModel =
              ColorModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_BackColorModel')) {
        try {
          final serializedData = prefs.getString('ff_BackColorModel') ?? '{}';
          _BackColorModel =
              ColorModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _helpRequstedStrings =
          prefs.getStringList('ff_helpRequstedStrings') ?? _helpRequstedStrings;
    });
    _safeInit(() {
      _fcm = prefs.getString('ff_fcm') ?? _fcm;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserModelStruct _userModelAppState = UserModelStruct.fromSerializableMap(
      jsonDecode(
          '{"supervisorName":"name","profilePictureDataUrl":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwk9ehRwCXvCb9IP02EyqUz-ppXch-25QRBA&usqp=CAU"}'));
  UserModelStruct get userModelAppState => _userModelAppState;
  set userModelAppState(UserModelStruct value) {
    _userModelAppState = value;
    prefs.setString('ff_userModelAppState', value.serialize());
  }

  void updateUserModelAppStateStruct(Function(UserModelStruct) updateFn) {
    updateFn(_userModelAppState);
    prefs.setString('ff_userModelAppState', _userModelAppState.serialize());
  }

  TokenModelStruct _tokenModelAppState = TokenModelStruct();
  TokenModelStruct get tokenModelAppState => _tokenModelAppState;
  set tokenModelAppState(TokenModelStruct value) {
    _tokenModelAppState = value;
    prefs.setString('ff_tokenModelAppState', value.serialize());
  }

  void updateTokenModelAppStateStruct(Function(TokenModelStruct) updateFn) {
    updateFn(_tokenModelAppState);
    prefs.setString('ff_tokenModelAppState', _tokenModelAppState.serialize());
  }

  List<PrioritieModelStruct> _prioritiesListAppState = [];
  List<PrioritieModelStruct> get prioritiesListAppState =>
      _prioritiesListAppState;
  set prioritiesListAppState(List<PrioritieModelStruct> value) {
    _prioritiesListAppState = value;
    prefs.setStringList(
        'ff_prioritiesListAppState', value.map((x) => x.serialize()).toList());
  }

  void addToPrioritiesListAppState(PrioritieModelStruct value) {
    _prioritiesListAppState.add(value);
    prefs.setStringList('ff_prioritiesListAppState',
        _prioritiesListAppState.map((x) => x.serialize()).toList());
  }

  void removeFromPrioritiesListAppState(PrioritieModelStruct value) {
    _prioritiesListAppState.remove(value);
    prefs.setStringList('ff_prioritiesListAppState',
        _prioritiesListAppState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPrioritiesListAppState(int index) {
    _prioritiesListAppState.removeAt(index);
    prefs.setStringList('ff_prioritiesListAppState',
        _prioritiesListAppState.map((x) => x.serialize()).toList());
  }

  void updatePrioritiesListAppStateAtIndex(
    int index,
    PrioritieModelStruct Function(PrioritieModelStruct) updateFn,
  ) {
    _prioritiesListAppState[index] = updateFn(_prioritiesListAppState[index]);
    prefs.setStringList('ff_prioritiesListAppState',
        _prioritiesListAppState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPrioritiesListAppState(
      int index, PrioritieModelStruct value) {
    _prioritiesListAppState.insert(index, value);
    prefs.setStringList('ff_prioritiesListAppState',
        _prioritiesListAppState.map((x) => x.serialize()).toList());
  }

  List<ProjectModelStruct> _projectsListAppState = [];
  List<ProjectModelStruct> get projectsListAppState => _projectsListAppState;
  set projectsListAppState(List<ProjectModelStruct> value) {
    _projectsListAppState = value;
    prefs.setStringList(
        'ff_projectsListAppState', value.map((x) => x.serialize()).toList());
  }

  void addToProjectsListAppState(ProjectModelStruct value) {
    _projectsListAppState.add(value);
    prefs.setStringList('ff_projectsListAppState',
        _projectsListAppState.map((x) => x.serialize()).toList());
  }

  void removeFromProjectsListAppState(ProjectModelStruct value) {
    _projectsListAppState.remove(value);
    prefs.setStringList('ff_projectsListAppState',
        _projectsListAppState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProjectsListAppState(int index) {
    _projectsListAppState.removeAt(index);
    prefs.setStringList('ff_projectsListAppState',
        _projectsListAppState.map((x) => x.serialize()).toList());
  }

  void updateProjectsListAppStateAtIndex(
    int index,
    ProjectModelStruct Function(ProjectModelStruct) updateFn,
  ) {
    _projectsListAppState[index] = updateFn(_projectsListAppState[index]);
    prefs.setStringList('ff_projectsListAppState',
        _projectsListAppState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProjectsListAppState(
      int index, ProjectModelStruct value) {
    _projectsListAppState.insert(index, value);
    prefs.setStringList('ff_projectsListAppState',
        _projectsListAppState.map((x) => x.serialize()).toList());
  }

  ProjectStatisticModelStruct _ProjectStatisticsModel =
      ProjectStatisticModelStruct();
  ProjectStatisticModelStruct get ProjectStatisticsModel =>
      _ProjectStatisticsModel;
  set ProjectStatisticsModel(ProjectStatisticModelStruct value) {
    _ProjectStatisticsModel = value;
    prefs.setString('ff_ProjectStatisticsModel', value.serialize());
  }

  void updateProjectStatisticsModelStruct(
      Function(ProjectStatisticModelStruct) updateFn) {
    updateFn(_ProjectStatisticsModel);
    prefs.setString(
        'ff_ProjectStatisticsModel', _ProjectStatisticsModel.serialize());
  }

  bool _projectIsOpend = false;
  bool get projectIsOpend => _projectIsOpend;
  set projectIsOpend(bool value) {
    _projectIsOpend = value;
    prefs.setBool('ff_projectIsOpend', value);
  }

  List<ProjectModelStruct> _projectListCreationAppState = [];
  List<ProjectModelStruct> get projectListCreationAppState =>
      _projectListCreationAppState;
  set projectListCreationAppState(List<ProjectModelStruct> value) {
    _projectListCreationAppState = value;
    prefs.setStringList('ff_projectListCreationAppState',
        value.map((x) => x.serialize()).toList());
  }

  void addToProjectListCreationAppState(ProjectModelStruct value) {
    _projectListCreationAppState.add(value);
    prefs.setStringList('ff_projectListCreationAppState',
        _projectListCreationAppState.map((x) => x.serialize()).toList());
  }

  void removeFromProjectListCreationAppState(ProjectModelStruct value) {
    _projectListCreationAppState.remove(value);
    prefs.setStringList('ff_projectListCreationAppState',
        _projectListCreationAppState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProjectListCreationAppState(int index) {
    _projectListCreationAppState.removeAt(index);
    prefs.setStringList('ff_projectListCreationAppState',
        _projectListCreationAppState.map((x) => x.serialize()).toList());
  }

  void updateProjectListCreationAppStateAtIndex(
    int index,
    ProjectModelStruct Function(ProjectModelStruct) updateFn,
  ) {
    _projectListCreationAppState[index] =
        updateFn(_projectListCreationAppState[index]);
    prefs.setStringList('ff_projectListCreationAppState',
        _projectListCreationAppState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProjectListCreationAppState(
      int index, ProjectModelStruct value) {
    _projectListCreationAppState.insert(index, value);
    prefs.setStringList('ff_projectListCreationAppState',
        _projectListCreationAppState.map((x) => x.serialize()).toList());
  }

  ProjectModelStruct _newProjectCreatedModel = ProjectModelStruct();
  ProjectModelStruct get newProjectCreatedModel => _newProjectCreatedModel;
  set newProjectCreatedModel(ProjectModelStruct value) {
    _newProjectCreatedModel = value;
    prefs.setString('ff_newProjectCreatedModel', value.serialize());
  }

  void updateNewProjectCreatedModelStruct(
      Function(ProjectModelStruct) updateFn) {
    updateFn(_newProjectCreatedModel);
    prefs.setString(
        'ff_newProjectCreatedModel', _newProjectCreatedModel.serialize());
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
    prefs.setStringList(
        'ff_projectTypesList', value.map((x) => x.serialize()).toList());
  }

  void addToProjectTypesList(ProjectTypeModelStruct value) {
    _projectTypesList.add(value);
    prefs.setStringList('ff_projectTypesList',
        _projectTypesList.map((x) => x.serialize()).toList());
  }

  void removeFromProjectTypesList(ProjectTypeModelStruct value) {
    _projectTypesList.remove(value);
    prefs.setStringList('ff_projectTypesList',
        _projectTypesList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProjectTypesList(int index) {
    _projectTypesList.removeAt(index);
    prefs.setStringList('ff_projectTypesList',
        _projectTypesList.map((x) => x.serialize()).toList());
  }

  void updateProjectTypesListAtIndex(
    int index,
    ProjectTypeModelStruct Function(ProjectTypeModelStruct) updateFn,
  ) {
    _projectTypesList[index] = updateFn(_projectTypesList[index]);
    prefs.setStringList('ff_projectTypesList',
        _projectTypesList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProjectTypesList(
      int index, ProjectTypeModelStruct value) {
    _projectTypesList.insert(index, value);
    prefs.setStringList('ff_projectTypesList',
        _projectTypesList.map((x) => x.serialize()).toList());
  }

  List<ClientModelStruct> _clientList = [];
  List<ClientModelStruct> get clientList => _clientList;
  set clientList(List<ClientModelStruct> value) {
    _clientList = value;
    prefs.setStringList(
        'ff_clientList', value.map((x) => x.serialize()).toList());
  }

  void addToClientList(ClientModelStruct value) {
    _clientList.add(value);
    prefs.setStringList(
        'ff_clientList', _clientList.map((x) => x.serialize()).toList());
  }

  void removeFromClientList(ClientModelStruct value) {
    _clientList.remove(value);
    prefs.setStringList(
        'ff_clientList', _clientList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromClientList(int index) {
    _clientList.removeAt(index);
    prefs.setStringList(
        'ff_clientList', _clientList.map((x) => x.serialize()).toList());
  }

  void updateClientListAtIndex(
    int index,
    ClientModelStruct Function(ClientModelStruct) updateFn,
  ) {
    _clientList[index] = updateFn(_clientList[index]);
    prefs.setStringList(
        'ff_clientList', _clientList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInClientList(int index, ClientModelStruct value) {
    _clientList.insert(index, value);
    prefs.setStringList(
        'ff_clientList', _clientList.map((x) => x.serialize()).toList());
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
    prefs.setStringList(
        'ff_mileStoneModelAppState', value.map((x) => x.serialize()).toList());
  }

  void addToMileStoneModelAppState(MileStoneStateModelStruct value) {
    _mileStoneModelAppState.add(value);
    prefs.setStringList('ff_mileStoneModelAppState',
        _mileStoneModelAppState.map((x) => x.serialize()).toList());
  }

  void removeFromMileStoneModelAppState(MileStoneStateModelStruct value) {
    _mileStoneModelAppState.remove(value);
    prefs.setStringList('ff_mileStoneModelAppState',
        _mileStoneModelAppState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMileStoneModelAppState(int index) {
    _mileStoneModelAppState.removeAt(index);
    prefs.setStringList('ff_mileStoneModelAppState',
        _mileStoneModelAppState.map((x) => x.serialize()).toList());
  }

  void updateMileStoneModelAppStateAtIndex(
    int index,
    MileStoneStateModelStruct Function(MileStoneStateModelStruct) updateFn,
  ) {
    _mileStoneModelAppState[index] = updateFn(_mileStoneModelAppState[index]);
    prefs.setStringList('ff_mileStoneModelAppState',
        _mileStoneModelAppState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMileStoneModelAppState(
      int index, MileStoneStateModelStruct value) {
    _mileStoneModelAppState.insert(index, value);
    prefs.setStringList('ff_mileStoneModelAppState',
        _mileStoneModelAppState.map((x) => x.serialize()).toList());
  }

  List<int> _reminderIntList = [1, 2, 4, 5];
  List<int> get reminderIntList => _reminderIntList;
  set reminderIntList(List<int> value) {
    _reminderIntList = value;
    prefs.setStringList(
        'ff_reminderIntList', value.map((x) => x.toString()).toList());
  }

  void addToReminderIntList(int value) {
    _reminderIntList.add(value);
    prefs.setStringList('ff_reminderIntList',
        _reminderIntList.map((x) => x.toString()).toList());
  }

  void removeFromReminderIntList(int value) {
    _reminderIntList.remove(value);
    prefs.setStringList('ff_reminderIntList',
        _reminderIntList.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromReminderIntList(int index) {
    _reminderIntList.removeAt(index);
    prefs.setStringList('ff_reminderIntList',
        _reminderIntList.map((x) => x.toString()).toList());
  }

  void updateReminderIntListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _reminderIntList[index] = updateFn(_reminderIntList[index]);
    prefs.setStringList('ff_reminderIntList',
        _reminderIntList.map((x) => x.toString()).toList());
  }

  void insertAtIndexInReminderIntList(int index, int value) {
    _reminderIntList.insert(index, value);
    prefs.setStringList('ff_reminderIntList',
        _reminderIntList.map((x) => x.toString()).toList());
  }

  List<MemberModelStruct> _listOfRols = [];
  List<MemberModelStruct> get listOfRols => _listOfRols;
  set listOfRols(List<MemberModelStruct> value) {
    _listOfRols = value;
    prefs.setStringList(
        'ff_listOfRols', value.map((x) => x.serialize()).toList());
  }

  void addToListOfRols(MemberModelStruct value) {
    _listOfRols.add(value);
    prefs.setStringList(
        'ff_listOfRols', _listOfRols.map((x) => x.serialize()).toList());
  }

  void removeFromListOfRols(MemberModelStruct value) {
    _listOfRols.remove(value);
    prefs.setStringList(
        'ff_listOfRols', _listOfRols.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListOfRols(int index) {
    _listOfRols.removeAt(index);
    prefs.setStringList(
        'ff_listOfRols', _listOfRols.map((x) => x.serialize()).toList());
  }

  void updateListOfRolsAtIndex(
    int index,
    MemberModelStruct Function(MemberModelStruct) updateFn,
  ) {
    _listOfRols[index] = updateFn(_listOfRols[index]);
    prefs.setStringList(
        'ff_listOfRols', _listOfRols.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListOfRols(int index, MemberModelStruct value) {
    _listOfRols.insert(index, value);
    prefs.setStringList(
        'ff_listOfRols', _listOfRols.map((x) => x.serialize()).toList());
  }

  MilestoneModelStruct _SelectedMileStoneModel = MilestoneModelStruct();
  MilestoneModelStruct get SelectedMileStoneModel => _SelectedMileStoneModel;
  set SelectedMileStoneModel(MilestoneModelStruct value) {
    _SelectedMileStoneModel = value;
    prefs.setString('ff_SelectedMileStoneModel', value.serialize());
  }

  void updateSelectedMileStoneModelStruct(
      Function(MilestoneModelStruct) updateFn) {
    updateFn(_SelectedMileStoneModel);
    prefs.setString(
        'ff_SelectedMileStoneModel', _SelectedMileStoneModel.serialize());
  }

  CostModelStruct _SelectedCostModel = CostModelStruct();
  CostModelStruct get SelectedCostModel => _SelectedCostModel;
  set SelectedCostModel(CostModelStruct value) {
    _SelectedCostModel = value;
    prefs.setString('ff_SelectedCostModel', value.serialize());
  }

  void updateSelectedCostModelStruct(Function(CostModelStruct) updateFn) {
    updateFn(_SelectedCostModel);
    prefs.setString('ff_SelectedCostModel', _SelectedCostModel.serialize());
  }

  bool _costIsOpend = false;
  bool get costIsOpend => _costIsOpend;
  set costIsOpend(bool value) {
    _costIsOpend = value;
    prefs.setBool('ff_costIsOpend', value);
  }

  List<SatisfactionModelStruct> _clintSatisfactionList = [
    SatisfactionModelStruct.fromSerializableMap(jsonDecode(
        '{"type":"1","isSelected":"false","color":"#e6000b","notColor":"#472a21"}')),
    SatisfactionModelStruct.fromSerializableMap(jsonDecode(
        '{"type":"2","isSelected":"false","color":"#ee8b60","notColor":"#4d3820"}')),
    SatisfactionModelStruct.fromSerializableMap(jsonDecode(
        '{"type":"3","isSelected":"false","color":"#ffe851","notColor":"#524624"}')),
    SatisfactionModelStruct.fromSerializableMap(jsonDecode(
        '{"type":"4","isSelected":"false","color":"#249689","notColor":"#363e27"}')),
    SatisfactionModelStruct.fromSerializableMap(jsonDecode(
        '{"type":"5","isSelected":"false","color":"#0bf352","notColor":"#468a61"}'))
  ];
  List<SatisfactionModelStruct> get clintSatisfactionList =>
      _clintSatisfactionList;
  set clintSatisfactionList(List<SatisfactionModelStruct> value) {
    _clintSatisfactionList = value;
    prefs.setStringList(
        'ff_clintSatisfactionList', value.map((x) => x.serialize()).toList());
  }

  void addToClintSatisfactionList(SatisfactionModelStruct value) {
    _clintSatisfactionList.add(value);
    prefs.setStringList('ff_clintSatisfactionList',
        _clintSatisfactionList.map((x) => x.serialize()).toList());
  }

  void removeFromClintSatisfactionList(SatisfactionModelStruct value) {
    _clintSatisfactionList.remove(value);
    prefs.setStringList('ff_clintSatisfactionList',
        _clintSatisfactionList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromClintSatisfactionList(int index) {
    _clintSatisfactionList.removeAt(index);
    prefs.setStringList('ff_clintSatisfactionList',
        _clintSatisfactionList.map((x) => x.serialize()).toList());
  }

  void updateClintSatisfactionListAtIndex(
    int index,
    SatisfactionModelStruct Function(SatisfactionModelStruct) updateFn,
  ) {
    _clintSatisfactionList[index] = updateFn(_clintSatisfactionList[index]);
    prefs.setStringList('ff_clintSatisfactionList',
        _clintSatisfactionList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInClintSatisfactionList(
      int index, SatisfactionModelStruct value) {
    _clintSatisfactionList.insert(index, value);
    prefs.setStringList('ff_clintSatisfactionList',
        _clintSatisfactionList.map((x) => x.serialize()).toList());
  }

  List<ColorModelStruct> _colorList = [
    ColorModelStruct.fromSerializableMap(
        jsonDecode('{"colorHex":"#03a4e2","colorName":"Beyond Blue"}')),
    ColorModelStruct.fromSerializableMap(
        jsonDecode('{"colorHex":"#ea0202","colorName":"Read"}')),
    ColorModelStruct.fromSerializableMap(
        jsonDecode('{"colorHex":"#fff","colorName":"Clear"}')),
    ColorModelStruct.fromSerializableMap(
        jsonDecode('{"colorHex":"#14181b","colorName":"Black"}')),
    ColorModelStruct.fromSerializableMap(
        jsonDecode('{"colorHex":"#ee8b60","colorName":"Orange"}')),
    ColorModelStruct.fromSerializableMap(
        jsonDecode('{"colorHex":"#39d2c0","colorName":"Teal"}')),
    ColorModelStruct.fromSerializableMap(
        jsonDecode('{"colorHex":"#339259","colorName":"Grean"}')),
    ColorModelStruct.fromSerializableMap(
        jsonDecode('{"colorHex":"#ffd612","colorName":"Yello"}'))
  ];
  List<ColorModelStruct> get colorList => _colorList;
  set colorList(List<ColorModelStruct> value) {
    _colorList = value;
    prefs.setStringList(
        'ff_colorList', value.map((x) => x.serialize()).toList());
  }

  void addToColorList(ColorModelStruct value) {
    _colorList.add(value);
    prefs.setStringList(
        'ff_colorList', _colorList.map((x) => x.serialize()).toList());
  }

  void removeFromColorList(ColorModelStruct value) {
    _colorList.remove(value);
    prefs.setStringList(
        'ff_colorList', _colorList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromColorList(int index) {
    _colorList.removeAt(index);
    prefs.setStringList(
        'ff_colorList', _colorList.map((x) => x.serialize()).toList());
  }

  void updateColorListAtIndex(
    int index,
    ColorModelStruct Function(ColorModelStruct) updateFn,
  ) {
    _colorList[index] = updateFn(_colorList[index]);
    prefs.setStringList(
        'ff_colorList', _colorList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInColorList(int index, ColorModelStruct value) {
    _colorList.insert(index, value);
    prefs.setStringList(
        'ff_colorList', _colorList.map((x) => x.serialize()).toList());
  }

  ColorModelStruct _FrontColorModel = ColorModelStruct();
  ColorModelStruct get FrontColorModel => _FrontColorModel;
  set FrontColorModel(ColorModelStruct value) {
    _FrontColorModel = value;
    prefs.setString('ff_FrontColorModel', value.serialize());
  }

  void updateFrontColorModelStruct(Function(ColorModelStruct) updateFn) {
    updateFn(_FrontColorModel);
    prefs.setString('ff_FrontColorModel', _FrontColorModel.serialize());
  }

  ColorModelStruct _BackColorModel = ColorModelStruct();
  ColorModelStruct get BackColorModel => _BackColorModel;
  set BackColorModel(ColorModelStruct value) {
    _BackColorModel = value;
    prefs.setString('ff_BackColorModel', value.serialize());
  }

  void updateBackColorModelStruct(Function(ColorModelStruct) updateFn) {
    updateFn(_BackColorModel);
    prefs.setString('ff_BackColorModel', _BackColorModel.serialize());
  }

  List<AppCardModelStruct> _listOfNotes = [];
  List<AppCardModelStruct> get listOfNotes => _listOfNotes;
  set listOfNotes(List<AppCardModelStruct> value) {
    _listOfNotes = value;
  }

  void addToListOfNotes(AppCardModelStruct value) {
    _listOfNotes.add(value);
  }

  void removeFromListOfNotes(AppCardModelStruct value) {
    _listOfNotes.remove(value);
  }

  void removeAtIndexFromListOfNotes(int index) {
    _listOfNotes.removeAt(index);
  }

  void updateListOfNotesAtIndex(
    int index,
    AppCardModelStruct Function(AppCardModelStruct) updateFn,
  ) {
    _listOfNotes[index] = updateFn(_listOfNotes[index]);
  }

  void insertAtIndexInListOfNotes(int index, AppCardModelStruct value) {
    _listOfNotes.insert(index, value);
  }

  List<String> _helpRequstedStrings = [];
  List<String> get helpRequstedStrings => _helpRequstedStrings;
  set helpRequstedStrings(List<String> value) {
    _helpRequstedStrings = value;
    prefs.setStringList('ff_helpRequstedStrings', value);
  }

  void addToHelpRequstedStrings(String value) {
    _helpRequstedStrings.add(value);
    prefs.setStringList('ff_helpRequstedStrings', _helpRequstedStrings);
  }

  void removeFromHelpRequstedStrings(String value) {
    _helpRequstedStrings.remove(value);
    prefs.setStringList('ff_helpRequstedStrings', _helpRequstedStrings);
  }

  void removeAtIndexFromHelpRequstedStrings(int index) {
    _helpRequstedStrings.removeAt(index);
    prefs.setStringList('ff_helpRequstedStrings', _helpRequstedStrings);
  }

  void updateHelpRequstedStringsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _helpRequstedStrings[index] = updateFn(_helpRequstedStrings[index]);
    prefs.setStringList('ff_helpRequstedStrings', _helpRequstedStrings);
  }

  void insertAtIndexInHelpRequstedStrings(int index, String value) {
    _helpRequstedStrings.insert(index, value);
    prefs.setStringList('ff_helpRequstedStrings', _helpRequstedStrings);
  }

  String _fcm = '';
  String get fcm => _fcm;
  set fcm(String value) {
    _fcm = value;
    prefs.setString('ff_fcm', value);
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
