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
import 'all_team_capacities_page_model.dart';
export 'all_team_capacities_page_model.dart';

class AllTeamCapacitiesPageWidget extends StatefulWidget {
  const AllTeamCapacitiesPageWidget({super.key});

  @override
  _AllTeamCapacitiesPageWidgetState createState() =>
      _AllTeamCapacitiesPageWidgetState();
}

class _AllTeamCapacitiesPageWidgetState
    extends State<AllTeamCapacitiesPageWidget> {
  late AllTeamCapacitiesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllTeamCapacitiesPageModel());

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
              child: Stack(
                children: [
                  if (MediaQuery.sizeOf(context).width > 450.0)
                    ListView(
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30.0, 20.0, 30.0, 20.0),
                                child: Text(
                                  _model.teamMemberModel?.name != null &&
                                          _model.teamMemberModel?.name != ''
                                      ? _model.teamMemberModel!.name
                                      : ' ',
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 20.0, 30.0, 20.0),
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
                                    '2679ikqu' /* Seniors */,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final listOfLocalSeniorsList =
                                  _model.teamMemberModel?.seniors.toList() ??
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
                                itemCount: listOfLocalSeniorsList.length,
                                itemBuilder:
                                    (context, listOfLocalSeniorsListIndex) {
                                  final listOfLocalSeniorsListItem =
                                      listOfLocalSeniorsList[
                                          listOfLocalSeniorsListIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.readMemberCpacityModels1
                                          .getModel(
                                        listOfLocalSeniorsListItem.id,
                                        listOfLocalSeniorsListIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: ReadMemberCpacityWidget(
                                        key: Key(
                                          'Keyz1a_${listOfLocalSeniorsListItem.id}',
                                        ),
                                        memberName:
                                            '${listOfLocalSeniorsListItem.firstName} ${listOfLocalSeniorsListItem.lastName}',
                                        projectType:
                                            functions.getAccessRoleName(
                                                listOfLocalSeniorsListItem
                                                    .accessRole),
                                        imagePath: listOfLocalSeniorsListItem
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 20.0, 30.0, 20.0),
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
                                    '84p82kg1' /* Middle Managers */,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final listOfLocalMedsList = _model
                                      .teamMemberModel?.members
                                      .where((e) =>
                                          e.accessRole == 3 ? true : false)
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
                                itemBuilder:
                                    (context, listOfLocalMedsListIndex) {
                                  final listOfLocalMedsListItem =
                                      listOfLocalMedsList[
                                          listOfLocalMedsListIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.readMemberCpacityModels2
                                          .getModel(
                                        listOfLocalMedsListItem.id,
                                        listOfLocalMedsListIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: ReadMemberCpacityWidget(
                                        key: Key(
                                          'Keyh19_${listOfLocalMedsListItem.id}',
                                        ),
                                        memberName:
                                            '${listOfLocalMedsListItem.firstName} ${listOfLocalMedsListItem.lastName}',
                                        projectType:
                                            functions.getAccessRoleName(
                                                listOfLocalMedsListItem
                                                    .accessRole),
                                        imagePath: listOfLocalMedsListItem
                                            .profilePictureDataUrl,
                                        currentCapacity: listOfLocalMedsListItem
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 20.0, 30.0, 20.0),
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
                                    'o1jemtrg' /* Associate */,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final listOfLocalAssociatesList = _model
                                      .teamMemberModel?.members
                                      .where((e) =>
                                          e.accessRole == 4 ? true : false)
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
                                      model: _model.readMemberCpacityModels3
                                          .getModel(
                                        listOfLocalAssociatesListItem.id,
                                        listOfLocalAssociatesListIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: ReadMemberCpacityWidget(
                                        key: Key(
                                          'Keygds_${listOfLocalAssociatesListItem.id}',
                                        ),
                                        memberName:
                                            '${listOfLocalAssociatesListItem.firstName} ${listOfLocalAssociatesListItem.lastName}',
                                        projectType:
                                            functions.getAccessRoleName(
                                                listOfLocalAssociatesListItem
                                                    .accessRole),
                                        imagePath: listOfLocalAssociatesListItem
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
                  if (MediaQuery.sizeOf(context).width < 450.0)
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                    _model.teamMemberModel?.name != null &&
                                            _model.teamMemberModel?.name != ''
                                        ? _model.teamMemberModel!.name
                                        : ' ',
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30.0, 20.0, 30.0, 20.0),
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
                                      'vnqjjbg5' /* Seniors */,
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
                          Builder(
                            builder: (context) {
                              final sensList1 =
                                  _model.teamMemberModel?.seniors.toList() ??
                                      [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: sensList1.length,
                                itemBuilder: (context, sensList1Index) {
                                  final sensList1Item =
                                      sensList1[sensList1Index];
                                  return SizedBox(
                                    height: 200.0,
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.readMemberCpacityModels4
                                            .getModel(
                                          sensList1Item.id,
                                          sensList1Index,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: ReadMemberCpacityWidget(
                                          key: Key(
                                            'Keyj3h_${sensList1Item.id}',
                                          ),
                                          memberName:
                                              '${sensList1Item.firstName} ${sensList1Item.lastName}',
                                          projectType:
                                              functions.getAccessRoleName(
                                                  sensList1Item.accessRole),
                                          imagePath: sensList1Item
                                              .profilePictureDataUrl,
                                          currentCapacity:
                                              sensList1Item.currentCapacity,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30.0, 20.0, 30.0, 20.0),
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
                                      'fyg0a8m9' /* Middle Managers */,
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
                          Builder(
                            builder: (context) {
                              final sensList2 = _model.teamMemberModel?.members
                                      .where((e) =>
                                          e.accessRole == 3 ? true : false)
                                      .toList()
                                      .toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: sensList2.length,
                                itemBuilder: (context, sensList2Index) {
                                  final sensList2Item =
                                      sensList2[sensList2Index];
                                  return SizedBox(
                                    height: 200.0,
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.readMemberCpacityModels5
                                            .getModel(
                                          sensList2Item.id,
                                          sensList2Index,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: ReadMemberCpacityWidget(
                                          key: Key(
                                            'Key08b_${sensList2Item.id}',
                                          ),
                                          memberName:
                                              '${sensList2Item.firstName} ${sensList2Item.lastName}',
                                          projectType:
                                              functions.getAccessRoleName(
                                                  sensList2Item.accessRole),
                                          imagePath: sensList2Item
                                              .profilePictureDataUrl,
                                          currentCapacity:
                                              sensList2Item.currentCapacity,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30.0, 20.0, 30.0, 20.0),
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
                                      'tqh8zeij' /* Associate */,
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
                          Builder(
                            builder: (context) {
                              final sensList4 = _model.teamMemberModel?.members
                                      .where((e) =>
                                          e.accessRole == 4 ? true : false)
                                      .toList()
                                      .toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: sensList4.length,
                                itemBuilder: (context, sensList4Index) {
                                  final sensList4Item =
                                      sensList4[sensList4Index];
                                  return SizedBox(
                                    height: 200.0,
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.readMemberCpacityModels6
                                            .getModel(
                                          sensList4Item.id,
                                          sensList4Index,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: ReadMemberCpacityWidget(
                                          key: Key(
                                            'Keyigr_${sensList4Item.id}',
                                          ),
                                          memberName:
                                              '${sensList4Item.firstName} ${sensList4Item.lastName}',
                                          projectType:
                                              functions.getAccessRoleName(
                                                  sensList4Item.accessRole),
                                          imagePath: sensList4Item
                                              .profilePictureDataUrl,
                                          currentCapacity:
                                              sensList4Item.currentCapacity,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
