import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/read_member_cpacity/read_member_cpacity_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'team_capacities_page_model.dart';
export 'team_capacities_page_model.dart';

class TeamCapacitiesPageWidget extends StatefulWidget {
  const TeamCapacitiesPageWidget({super.key});

  @override
  _TeamCapacitiesPageWidgetState createState() =>
      _TeamCapacitiesPageWidgetState();
}

class _TeamCapacitiesPageWidgetState extends State<TeamCapacitiesPageWidget> {
  late TeamCapacitiesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamCapacitiesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult1xv = await GetMyTeamApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResult1xv?.succeeded ?? true)) {
        setState(() {
          _model.teamMemberModel = getJsonField(
                        (_model.apiResult1xv?.jsonBody ?? ''),
                        r'''$.data''',
                      ) !=
                      null &&
                  getJsonField(
                        (_model.apiResult1xv?.jsonBody ?? ''),
                        r'''$.data''',
                      ) !=
                      ''
              ? TeamMembersModelStruct.fromMap(getJsonField(
                  (_model.apiResult1xv?.jsonBody ?? ''),
                  r'''$.data''',
                ))
              : null;
        });
      }
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
                    'z0yohwm5' /* Team Capacities */,
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).beyondBlueColor,
                  width: 2.0,
                ),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 20.0, 30.0, 20.0),
                          child: Text(
                            _model.teamMemberModel!.name,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Almarai',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate_sharp,
                          color: FlutterFlowTheme.of(context).warning,
                          size: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '835w2hj5' /* Seniors */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Almarai',
                                  color: const Color(0xFF01A3E2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final listOfLocalSeniorsList =
                            _model.teamMemberModel?.seniors.toList() ?? [];
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 5.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listOfLocalSeniorsList.length,
                          itemBuilder: (context, listOfLocalSeniorsListIndex) {
                            final listOfLocalSeniorsListItem =
                                listOfLocalSeniorsList[
                                    listOfLocalSeniorsListIndex];
                            return Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: wrapWithModel(
                                model: _model.readMemberCpacityModels1.getModel(
                                  listOfLocalSeniorsListItem.id,
                                  listOfLocalSeniorsListIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: ReadMemberCpacityWidget(
                                  key: Key(
                                    'Keycyp_${listOfLocalSeniorsListItem.id}',
                                  ),
                                  memberName:
                                      listOfLocalSeniorsListItem.userName,
                                  projectType: functions.getAccessRoleName(
                                      listOfLocalSeniorsListItem.accessRole),
                                  imagePath: listOfLocalSeniorsListItem
                                      .profilePictureDataUrl,
                                  currentCapacity: listOfLocalSeniorsListItem
                                      .currentCapacity,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate_sharp,
                          color: FlutterFlowTheme.of(context).warning,
                          size: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'h8uowkgw' /* Middle Managers */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Almarai',
                                  color: const Color(0xFF01A3E2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final listOfLocalMedsList = _model
                                .teamMemberModel?.members
                                .where((e) => e.accessRole == 3 ? true : false)
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
                            childAspectRatio: 5.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listOfLocalMedsList.length,
                          itemBuilder: (context, listOfLocalMedsListIndex) {
                            final listOfLocalMedsListItem =
                                listOfLocalMedsList[listOfLocalMedsListIndex];
                            return Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: wrapWithModel(
                                model: _model.readMemberCpacityModels2.getModel(
                                  listOfLocalMedsListItem.id,
                                  listOfLocalMedsListIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: ReadMemberCpacityWidget(
                                  key: Key(
                                    'Keyb0i_${listOfLocalMedsListItem.id}',
                                  ),
                                  memberName: listOfLocalMedsListItem.userName,
                                  projectType: functions.getAccessRoleName(
                                      listOfLocalMedsListItem.accessRole),
                                  imagePath: listOfLocalMedsListItem
                                      .profilePictureDataUrl,
                                  currentCapacity:
                                      listOfLocalMedsListItem.currentCapacity,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate_sharp,
                          color: FlutterFlowTheme.of(context).warning,
                          size: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'bqsruo7f' /* Associate */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Almarai',
                                  color: const Color(0xFF01A3E2),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final listOfLocalAssociatesList = _model
                                .teamMemberModel?.members
                                .where((e) => e.accessRole == 4 ? true : false)
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
                            childAspectRatio: 5.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listOfLocalAssociatesList.length,
                          itemBuilder:
                              (context, listOfLocalAssociatesListIndex) {
                            final listOfLocalAssociatesListItem =
                                listOfLocalAssociatesList[
                                    listOfLocalAssociatesListIndex];
                            return Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: wrapWithModel(
                                model: _model.readMemberCpacityModels3.getModel(
                                  listOfLocalAssociatesListItem.id,
                                  listOfLocalAssociatesListIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: ReadMemberCpacityWidget(
                                  key: Key(
                                    'Key47y_${listOfLocalAssociatesListItem.id}',
                                  ),
                                  memberName:
                                      listOfLocalAssociatesListItem.userName,
                                  projectType: functions.getAccessRoleName(
                                      listOfLocalAssociatesListItem.accessRole),
                                  imagePath: listOfLocalAssociatesListItem
                                      .profilePictureDataUrl,
                                  currentCapacity: listOfLocalAssociatesListItem
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
    );
  }
}
