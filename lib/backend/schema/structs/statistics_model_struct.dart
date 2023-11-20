// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatisticsModelStruct extends BaseStruct {
  StatisticsModelStruct({
    int? beyonders,
    int? teams,
    int? projects,
  })  : _beyonders = beyonders,
        _teams = teams,
        _projects = projects;

  // "beyonders" field.
  int? _beyonders;
  int get beyonders => _beyonders ?? 0;
  set beyonders(int? val) => _beyonders = val;
  void incrementBeyonders(int amount) => _beyonders = beyonders + amount;
  bool hasBeyonders() => _beyonders != null;

  // "teams" field.
  int? _teams;
  int get teams => _teams ?? 0;
  set teams(int? val) => _teams = val;
  void incrementTeams(int amount) => _teams = teams + amount;
  bool hasTeams() => _teams != null;

  // "projects" field.
  int? _projects;
  int get projects => _projects ?? 0;
  set projects(int? val) => _projects = val;
  void incrementProjects(int amount) => _projects = projects + amount;
  bool hasProjects() => _projects != null;

  static StatisticsModelStruct fromMap(Map<String, dynamic> data) =>
      StatisticsModelStruct(
        beyonders: castToType<int>(data['beyonders']),
        teams: castToType<int>(data['teams']),
        projects: castToType<int>(data['projects']),
      );

  static StatisticsModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? StatisticsModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'beyonders': _beyonders,
        'teams': _teams,
        'projects': _projects,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'beyonders': serializeParam(
          _beyonders,
          ParamType.int,
        ),
        'teams': serializeParam(
          _teams,
          ParamType.int,
        ),
        'projects': serializeParam(
          _projects,
          ParamType.int,
        ),
      }.withoutNulls;

  static StatisticsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatisticsModelStruct(
        beyonders: deserializeParam(
          data['beyonders'],
          ParamType.int,
          false,
        ),
        teams: deserializeParam(
          data['teams'],
          ParamType.int,
          false,
        ),
        projects: deserializeParam(
          data['projects'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StatisticsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatisticsModelStruct &&
        beyonders == other.beyonders &&
        teams == other.teams &&
        projects == other.projects;
  }

  @override
  int get hashCode => const ListEquality().hash([beyonders, teams, projects]);
}

StatisticsModelStruct createStatisticsModelStruct({
  int? beyonders,
  int? teams,
  int? projects,
}) =>
    StatisticsModelStruct(
      beyonders: beyonders,
      teams: teams,
      projects: projects,
    );
