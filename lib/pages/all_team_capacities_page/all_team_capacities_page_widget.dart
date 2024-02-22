import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/read_member_cpacity/read_member_cpacity_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'all_team_capacities_page_model.dart';
export 'all_team_capacities_page_model.dart';

class AllTeamCapacitiesPageWidget extends StatefulWidget {
  const AllTeamCapacitiesPageWidget({super.key});

  @override
  State<AllTeamCapacitiesPageWidget> createState() =>
      _AllTeamCapacitiesPageWidgetState();
}

class _AllTeamCapacitiesPageWidgetState
    extends State<AllTeamCapacitiesPageWidget> with TickerProviderStateMixin {
  late AllTeamCapacitiesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'progressBarOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllTeamCapacitiesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoading = true;
      });
      _model.apiResultdlx = await GetAllTeamsApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResultdlx?.succeeded ?? true)) {
        setState(() {
          _model.teamTabModel = TeamTapModelStruct.maybeFromMap(
                  (_model.apiResultdlx?.jsonBody ?? ''))!
              .data
              .toList()
              .cast<TeamTapModelStruct>();
        });
        setState(() {
          _model.selectedId = _model.teamTabModel.first.id;
        });
      }
      _model.apiResult1xv = await GetTeamByIdApiCall.call(
        token: FFAppState().tokenModelAppState.token,
        id: _model.selectedId,
      );
      if ((_model.apiResult1xv?.succeeded ?? true)) {
        setState(() {
          _model.teamMemberModel =
              TeamMembersModelStruct.maybeFromMap(getJsonField(
            (_model.apiResult1xv?.jsonBody ?? ''),
            r'''$.data''',
          ));
        });
      }
      setState(() {
        _model.isLoading = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).info,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => setState(() {}),
            child: const SideNavWidget(
              sideMenuEnum: SideMenuEnum.TEAM_CAPACITIES,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF032734),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.format_list_bulleted_sharp,
                  color: FlutterFlowTheme.of(context).info,
                  size: 25.0,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '4xrxiqlo' /* Team Capacities */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Almarai',
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 20.0, 30.0, 0.0),
                          child: Container(
                            height: 60.0,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).beyondBlueColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .beyondBlueColor,
                                width: 2.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      30.0, 16.0, 30.0, 16.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '7j4aa15z' /* Select Team */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final listOfTeams =
                              _model.teamTabModel.map((e) => e).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listOfTeams.length,
                            itemBuilder: (context, listOfTeamsIndex) {
                              final listOfTeamsItem =
                                  listOfTeams[listOfTeamsIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 30.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.isLoading = true;
                                    });
                                    setState(() {
                                      _model.selectedIndex = listOfTeamsIndex;
                                    });
                                    setState(() {
                                      _model.selectedId = listOfTeamsItem.id;
                                    });
                                    _model.apiResultt61 =
                                        await GetTeamByIdApiCall.call(
                                      token:
                                          FFAppState().tokenModelAppState.token,
                                      id: _model.selectedId,
                                    );
                                    if ((_model.apiResultt61?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.teamMemberModel =
                                            TeamMembersModelStruct.maybeFromMap(
                                                getJsonField(
                                          (_model.apiResultt61?.jsonBody ?? ''),
                                          r'''$.data''',
                                        ));
                                      });
                                    }
                                    setState(() {
                                      _model.isLoading = false;
                                    });

                                    setState(() {});
                                  },
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 220.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _model.selectedIndex ==
                                              listOfTeamsIndex
                                          ? const Color(0xFFE9E9E9)
                                          : const Color(0xBFFFFFFF),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 16.0, 0.0, 16.0),
                                          child: Text(
                                            listOfTeamsItem.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Almarai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 30.0, 0.0),
                                          child: Text(
                                            '( ${listOfTeamsItem.membersCount.toString()} )',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .beyondBlueColor,
                                  width: 2.0,
                                ),
                              ),
                              child: Visibility(
                                visible: () {
                                  if ((_model.teamMemberModel?.seniors.length != null) &&
                                          (_model.teamMemberModel!.seniors.isNotEmpty)
                                      ? true
                                      : false) {
                                    return true;
                                  } else if ((_model.teamMemberModel?.members
                                                  .where((e) =>
                                                      e.accessRole == 3
                                                          ? true
                                                          : false)
                                                  .toList()
                                                  .length !=
                                              null) &&
                                          (_model.teamMemberModel!.members
                                                  .where((e) => e.accessRole == 3
                                                      ? true
                                                      : false)
                                                  .toList().isNotEmpty)
                                      ? true
                                      : false) {
                                    return true;
                                  } else if ((_model.teamMemberModel?.members
                                                  .where((e) => e.accessRole == 4 ? true : false)
                                                  .toList()
                                                  .length !=
                                              null) &&
                                          (_model.teamMemberModel!.members.where((e) => e.accessRole == 4 ? true : false).toList().isNotEmpty)
                                      ? true
                                      : false) {
                                    return true;
                                  } else {
                                    return false;
                                  }
                                }(),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFE9E9E9),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      30.0, 20.0, 30.0, 20.0),
                                              child: Text(
                                                _model.teamMemberModel?.name !=
                                                            null &&
                                                        _model.teamMemberModel
                                                                ?.name !=
                                                            ''
                                                    ? _model
                                                        .teamMemberModel!.name
                                                    : ' ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Almarai',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if ((_model.teamMemberModel?.seniors
                                                      .length !=
                                                  null) &&
                                              (_model.teamMemberModel!.seniors.isNotEmpty)
                                          ? true
                                          : false)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 20.0, 30.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star_rate_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                size: 40.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2679ikqu' /* Seniors */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        color:
                                                            const Color(0xFF01A3E2),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 0.0, 30.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final listOfLocalSeniorsList =
                                                _model.teamMemberModel?.seniors
                                                        .toList() ??
                                                    [];
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 5.0,
                                                mainAxisSpacing: 5.0,
                                                childAspectRatio: 2.0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listOfLocalSeniorsList.length,
                                              itemBuilder: (context,
                                                  listOfLocalSeniorsListIndex) {
                                                final listOfLocalSeniorsListItem =
                                                    listOfLocalSeniorsList[
                                                        listOfLocalSeniorsListIndex];
                                                return Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .readMemberCpacityModels1
                                                        .getModel(
                                                      listOfLocalSeniorsListItem
                                                          .id,
                                                      listOfLocalSeniorsListIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        ReadMemberCpacityWidget(
                                                      key: Key(
                                                        'Keyz1a_${listOfLocalSeniorsListItem.id}',
                                                      ),
                                                      memberName:
                                                          '${listOfLocalSeniorsListItem.firstName} ${listOfLocalSeniorsListItem.lastName}',
                                                      projectType: functions
                                                          .getAccessRoleName(
                                                              listOfLocalSeniorsListItem
                                                                  .accessRole),
                                                      imagePath:
                                                          listOfLocalSeniorsListItem
                                                              .profilePictureDataUrl,
                                                      currentCapacity:
                                                          listOfLocalSeniorsListItem
                                                              .currentCapacity,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      if ((_model.teamMemberModel?.members
                                                      .where((e) =>
                                                          e.accessRole == 3
                                                              ? true
                                                              : false)
                                                      .toList()
                                                      .length !=
                                                  null) &&
                                              (_model.teamMemberModel!.members
                                                      .where((e) =>
                                                          e.accessRole == 3
                                                              ? true
                                                              : false)
                                                      .toList().isNotEmpty)
                                          ? true
                                          : false)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 20.0, 30.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star_rate_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                size: 40.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '84p82kg1' /* Middle Managers */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        color:
                                                            const Color(0xFF01A3E2),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 0.0, 30.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final listOfLocalMedsList = _model
                                                    .teamMemberModel?.members
                                                    .where((e) =>
                                                        e.accessRole == 3
                                                            ? true
                                                            : false)
                                                    .toList()
                                                    .toList() ??
                                                [];
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 5.0,
                                                mainAxisSpacing: 5.0,
                                                childAspectRatio: 2.0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listOfLocalMedsList.length,
                                              itemBuilder: (context,
                                                  listOfLocalMedsListIndex) {
                                                final listOfLocalMedsListItem =
                                                    listOfLocalMedsList[
                                                        listOfLocalMedsListIndex];
                                                return Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .readMemberCpacityModels2
                                                        .getModel(
                                                      listOfLocalMedsListItem
                                                          .id,
                                                      listOfLocalMedsListIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        ReadMemberCpacityWidget(
                                                      key: Key(
                                                        'Keyh19_${listOfLocalMedsListItem.id}',
                                                      ),
                                                      memberName:
                                                          '${listOfLocalMedsListItem.firstName} ${listOfLocalMedsListItem.lastName}',
                                                      projectType: functions
                                                          .getAccessRoleName(
                                                              listOfLocalMedsListItem
                                                                  .accessRole),
                                                      imagePath:
                                                          listOfLocalMedsListItem
                                                              .profilePictureDataUrl,
                                                      currentCapacity:
                                                          listOfLocalMedsListItem
                                                              .currentCapacity,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      if ((_model.teamMemberModel?.members
                                                      .where((e) =>
                                                          e.accessRole == 4
                                                              ? true
                                                              : false)
                                                      .toList()
                                                      .length !=
                                                  null) &&
                                              (_model.teamMemberModel!.members
                                                      .where((e) =>
                                                          e.accessRole == 4
                                                              ? true
                                                              : false)
                                                      .toList().isNotEmpty)
                                          ? true
                                          : false)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 20.0, 30.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star_rate_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                size: 40.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'o1jemtrg' /* Associate */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        color:
                                                            const Color(0xFF01A3E2),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            30.0, 0.0, 30.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final listOfLocalAssociatesList =
                                                _model.teamMemberModel
                                                        ?.members
                                                        .where((e) =>
                                                            e.accessRole == 4
                                                                ? true
                                                                : false)
                                                        .toList()
                                                        .toList() ??
                                                    [];
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 5.0,
                                                mainAxisSpacing: 5.0,
                                                childAspectRatio: 2.0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listOfLocalAssociatesList
                                                      .length,
                                              itemBuilder: (context,
                                                  listOfLocalAssociatesListIndex) {
                                                final listOfLocalAssociatesListItem =
                                                    listOfLocalAssociatesList[
                                                        listOfLocalAssociatesListIndex];
                                                return Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .readMemberCpacityModels3
                                                        .getModel(
                                                      listOfLocalAssociatesListItem
                                                          .id,
                                                      listOfLocalAssociatesListIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        ReadMemberCpacityWidget(
                                                      key: Key(
                                                        'Keygds_${listOfLocalAssociatesListItem.id}',
                                                      ),
                                                      memberName:
                                                          '${listOfLocalAssociatesListItem.firstName} ${listOfLocalAssociatesListItem.lastName}',
                                                      projectType: functions
                                                          .getAccessRoleName(
                                                              listOfLocalAssociatesListItem
                                                                  .accessRole),
                                                      imagePath:
                                                          listOfLocalAssociatesListItem
                                                              .profilePictureDataUrl,
                                                      currentCapacity:
                                                          listOfLocalAssociatesListItem
                                                              .currentCapacity,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (_model.isLoading == true)
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: CircularPercentIndicator(
                              percent: 0.5,
                              radius: 25.0,
                              lineWidth: 6.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor:
                                  FlutterFlowTheme.of(context).beyondBlueColor,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                            ).animateOnPageLoad(animationsMap[
                                'progressBarOnPageLoadAnimation']!),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
