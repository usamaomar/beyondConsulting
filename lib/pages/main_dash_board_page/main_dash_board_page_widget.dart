import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/satisfaction_component_main_dash_board_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/note_components/back_view_component/back_view_component_widget.dart';
import '/pages/components/note_components/creat_new_not_component/creat_new_not_component_widget.dart';
import '/pages/components/note_components/front_view_component/front_view_component_widget.dart';
import '/pages/components/read_member_cpacity/read_member_cpacity_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flip_card/flip_card.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'main_dash_board_page_model.dart';
export 'main_dash_board_page_model.dart';

class MainDashBoardPageWidget extends StatefulWidget {
  const MainDashBoardPageWidget({super.key});

  @override
  State<MainDashBoardPageWidget> createState() =>
      _MainDashBoardPageWidgetState();
}

class _MainDashBoardPageWidgetState extends State<MainDashBoardPageWidget> {
  late MainDashBoardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainDashBoardPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      _model.apiResult7fn = await GetMyProjectTrackersApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResult7fn?.succeeded ?? true)) {
        setState(() {
          _model.listOfLiveTracker = (getJsonField(
            (_model.apiResult7fn?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
                  .toList()
                  .map<ProjectModelStruct?>(ProjectModelStruct.maybeFromMap)
                  .toList() as Iterable<ProjectModelStruct?>)
              .withoutNulls
              .toList()
              .cast<ProjectModelStruct>();
        });
      }
      _model.apiResulty7y = await GetMyPrioritiesApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResulty7y?.succeeded ?? true)) {
        setState(() {
          _model.listOfProirtes = (getJsonField(
            (_model.apiResulty7y?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
                  .toList()
                  .map<PrioritieModelStruct?>(PrioritieModelStruct.maybeFromMap)
                  .toList() as Iterable<PrioritieModelStruct?>)
              .withoutNulls
              .toList()
              .cast<PrioritieModelStruct>();
        });
      }
      _model.apiResultv1q = await GetMyProjectsApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResultv1q?.succeeded ?? true)) {
        setState(() {
          _model.allProjectsList = (getJsonField(
            (_model.apiResultv1q?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
                  .toList()
                  .map<ProjectModelStruct?>(ProjectModelStruct.maybeFromMap)
                  .toList() as Iterable<ProjectModelStruct?>)
              .withoutNulls
              .toList()
              .cast<ProjectModelStruct>();
        });
      }
      _model.apiResult8i4 = await GetPersonalsApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResult8i4?.succeeded ?? true)) {
        setState(() {
          _model.seniorName = getJsonField(
            (_model.apiResult8i4?.jsonBody ?? ''),
            r'''$.data.senior.userName''',
          ).toString().toString();
          _model.seniorId = getJsonField(
            (_model.apiResult8i4?.jsonBody ?? ''),
            r'''$.data.senior.id''',
          ).toString().toString();
          _model.seniorPicure = getJsonField(
            (_model.apiResult8i4?.jsonBody ?? ''),
            r'''$.data.senior.profilePictureDataUrl''',
          ).toString();
          _model.listtAssosiates = (getJsonField(
            (_model.apiResult8i4?.jsonBody ?? ''),
            r'''$.data.midManagers''',
            true,
          )!
                  .toList()
                  .map<MemberModelStruct?>(MemberModelStruct.maybeFromMap)
                  .toList() as Iterable<MemberModelStruct?>)
              .withoutNulls
              .toList()
              .cast<MemberModelStruct>();
          _model.listOfMids = (getJsonField(
            (_model.apiResult8i4?.jsonBody ?? ''),
            r'''$.data.associates''',
            true,
          )!
                  .toList()
                  .map<MemberModelStruct?>(MemberModelStruct.maybeFromMap)
                  .toList() as Iterable<MemberModelStruct?>)
              .withoutNulls
              .toList()
              .cast<MemberModelStruct>();
        });
      }
      _model.apiResultm5e = await GetFinancialStatisticsCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResultm5e?.succeeded ?? true)) {
        setState(() {
          _model.financialStatisticsModel =
              FinancialStatisticsOutputModelStruct.maybeFromMap(getJsonField(
            (_model.apiResultm5e?.jsonBody ?? ''),
            r'''$''',
          ));
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => setState(() {}),
            child: const SideNavWidget(
              sideMenuEnum: SideMenuEnum.MAIN_DASHBOARD,
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
                    '8bj5guab' /* Main DashBoard */,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ((FFAppState().userModelAppState.accessRole == 0) ||
                    (FFAppState().userModelAppState.accessRole == 1) ||
                    (FFAppState().userModelAppState.accessRole == 5))
                  Flexible(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                              child: Container(
                                height: 350.0,
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final listOfLocalCards = FFAppState()
                                        .listOfNotes
                                        .map((e) => e)
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listOfLocalCards.length,
                                      itemBuilder:
                                          (context, listOfLocalCardsIndex) {
                                        final listOfLocalCardsItem =
                                            listOfLocalCards[
                                                listOfLocalCardsIndex];
                                        return FlipCard(
                                          fill: Fill.fillBack,
                                          direction: FlipDirection.HORIZONTAL,
                                          speed: 400,
                                          front: FrontViewComponentWidget(
                                            key: Key(
                                                'Keyuf1_${listOfLocalCardsIndex}_of_${listOfLocalCards.length}'),
                                            title: listOfLocalCardsItem.title,
                                            color:
                                                listOfLocalCardsItem.backColor!,
                                            createdDate: listOfLocalCardsItem
                                                .createdDate!,
                                          ),
                                          back: BackViewComponentWidget(
                                            key: Key(
                                                'Keyw6a_${listOfLocalCardsIndex}_of_${listOfLocalCards.length}'),
                                            title: listOfLocalCardsItem.title,
                                            date: dateTimeFormat(
                                              'yMd',
                                              listOfLocalCardsItem
                                                  .achievementData!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            note: listOfLocalCardsItem.note,
                                            color: listOfLocalCardsItem
                                                .frontColor!,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: const CreatNewNotComponentWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ezus85f3' /* Add New Note */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Almarai',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Icon(
                                      Icons.add_circle,
                                      color: FlutterFlowTheme.of(context)
                                          .beyondBlueColor,
                                      size: 30.0,
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
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                  child: Container(
                    width: 500.0,
                    height: 450.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 20.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'pj06s05h' /* Live Tracker */,
                            ),
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
                        if ((_model.listOfLiveTracker.isNotEmpty) == true
                            ? true
                            : false)
                          Builder(
                            builder: (context) {
                              final localList = _model.listOfLiveTracker
                                  .map((e) => e)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: localList.length,
                                itemBuilder: (context, localListIndex) {
                                  final localListItem =
                                      localList[localListIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        60.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            functions.getFullImage(
                                                localListItem.seniorPicture)!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Text(
                                                  localListItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 10.0, 15.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Text(
                                                        functions
                                                            .convertDateString(
                                                                localListItem
                                                                    .startDate),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              color: const Color(
                                                                  0xFFA6A6A6),
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        functions
                                                            .convertDateString(
                                                                localListItem
                                                                    .endDate),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              color: const Color(
                                                                  0xFFA6A6A6),
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        Opacity(
                          opacity: 0.0,
                          child: FlutterFlowTimer(
                            initialTime: _model.timerMilliseconds,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
                              value,
                              hours: false,
                              milliSecond: false,
                            ),
                            controller: _model.timerController,
                            updateStateInterval: const Duration(milliseconds: 1000),
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerMilliseconds = value;
                              _model.timerValue = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            onEnded: () async {
                              _model.apiResult7fn5 =
                                  await GetMyProjectTrackersApiCall.call(
                                token: FFAppState().tokenModelAppState.token,
                              );
                              if ((_model.apiResult7fn5?.succeeded ?? true)) {
                                setState(() {
                                  _model.listOfLiveTracker = (getJsonField(
                                    (_model.apiResult7fn5?.jsonBody ?? ''),
                                    r'''$.data''',
                                    true,
                                  )!
                                              .toList()
                                              .map<ProjectModelStruct?>(
                                                  ProjectModelStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<ProjectModelStruct?>)
                                      .withoutNulls
                                      .toList()
                                      .cast<ProjectModelStruct>();
                                });
                              }

                              setState(() {});
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              border: Border.all(
                                color: const Color(0xFF01A3E2),
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 30.0, 0.0, 20.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'u8919gvw' /* Collaborators */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          fontSize:
                                              MediaQuery.sizeOf(context).width <
                                                      400.0
                                                  ? 14.0
                                                  : 18.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 1.0,
                                  indent: 30.0,
                                  endIndent: 30.0,
                                  color: Color(0xFFC8C9CC),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Container(
                                    height: 100.0,
                                    constraints: const BoxConstraints(
                                      minWidth: 350.0,
                                    ),
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final listOfMemebersLocal = functions
                                            .addMemberItemsToList(
                                                _model.seniorName,
                                                _model.seniorId,
                                                _model.seniorPicure,
                                                _model.listOfMids.toList(),
                                                _model.listtAssosiates.toList())
                                            .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: listOfMemebersLocal.length,
                                          itemBuilder: (context,
                                              listOfMemebersLocalIndex) {
                                            final listOfMemebersLocalItem =
                                                listOfMemebersLocal[
                                                    listOfMemebersLocalIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .readMemberCpacityModels
                                                        .getModel(
                                                      listOfMemebersLocalItem
                                                          .id,
                                                      listOfMemebersLocalIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        ReadMemberCpacityWidget(
                                                      key: Key(
                                                        'Keyao8_${listOfMemebersLocalItem.id}',
                                                      ),
                                                      memberName:
                                                          listOfMemebersLocalItem
                                                              .name,
                                                      projectType: functions
                                                          .getAccessRoleName(
                                                              listOfMemebersLocalItem
                                                                  .accessRole),
                                                      imagePath:
                                                          listOfMemebersLocalItem
                                                              .profilePictureDataUrl,
                                                      currentCapacity:
                                                          listOfMemebersLocalItem
                                                              .currentCapacity,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                border: Border.all(
                                  color: const Color(0xFF01A3E2),
                                  width: 2.0,
                                ),
                              ),
                              child: Container(
                                height: 230.0,
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final listOfProj = _model.allProjectsList
                                        .map((e) => e)
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: listOfProj.length,
                                      itemBuilder: (context, listOfProjIndex) {
                                        final listOfProjItem =
                                            listOfProj[listOfProjIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 30.0, 30.0, 30.0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${listOfProjItem.client} are ',
                                                      style: const TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: listOfProjItem
                                                                  .clientSatisfaction !=
                                                              null
                                                          ? functions.convertFromIdToTextClientSatisfaction(
                                                              listOfProjItem
                                                                  .clientSatisfaction,
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode)
                                                          : ' ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FFAppState()
                                                                    .clintSatisfactionList[
                                                                        listOfProjItem.clientSatisfaction -
                                                                            1]
                                                                    .color,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 20.0),
                                              child: Container(
                                                decoration: const BoxDecoration(),
                                                child: wrapWithModel(
                                                  model: _model
                                                      .satisfactionComponentMainDashBoardModels
                                                      .getModel(
                                                    listOfProjItem.id
                                                        .toString(),
                                                    listOfProjIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child:
                                                      SatisfactionComponentMainDashBoardWidget(
                                                    key: Key(
                                                      'Key7sw_${listOfProjItem.id.toString()}',
                                                    ),
                                                    satisfactionType:
                                                        listOfProjItem
                                                            .clientSatisfaction,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).beyondBlueColor,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 20.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'hukx9i3h' /* Upcoming Milestones */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Almarai',
                                        color: const Color(0xFF032734),
                                        fontSize:
                                            MediaQuery.sizeOf(context).width <
                                                    400.0
                                                ? 14.0
                                                : 18.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 15.0),
                                  child: Container(
                                    height: 450.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final upcomingMilestoneItem = _model
                                            .listOfProirtes
                                            .map((e) => e)
                                            .toList();
                                        return DataTable2(
                                          columns: [
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'hcqxdz6s' /* Milestone */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jpikdprm' /* Description */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'r8ux98o7' /* Deadline */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                ),
                                              ),
                                            ),
                                            DataColumn2(
                                              label: DefaultTextStyle.merge(
                                                softWrap: true,
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ssp4fyq9' /* Status */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                ),
                                              ),
                                            ),
                                          ],
                                          rows: upcomingMilestoneItem
                                              .mapIndexed(
                                                  (upcomingMilestoneItemIndex,
                                                          upcomingMilestoneItemItem) =>
                                                      [
                                                        Text(
                                                          upcomingMilestoneItemItem
                                                              .title,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          upcomingMilestoneItemItem
                                                              .description,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          functions
                                                              .convertDateFromStamp(
                                                                  upcomingMilestoneItemItem
                                                                      .endDate),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                        Text(
                                                          FFAppState()
                                                              .mileStoneModelAppState[
                                                                  upcomingMilestoneItemItem
                                                                      .status]
                                                              .nameEn,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ]
                                                          .map((c) =>
                                                              DataCell(c))
                                                          .toList())
                                              .map((e) => DataRow(cells: e))
                                              .toList(),
                                          headingRowColor:
                                              MaterialStateProperty.all(
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          headingRowHeight: 56.0,
                                          dataRowColor:
                                              MaterialStateProperty.all(
                                            const Color(0x00000000),
                                          ),
                                          dataRowHeight: 56.0,
                                          border: TableBorder(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          dividerThickness: 0.0,
                                          showBottomBorder: false,
                                          minWidth: 49.0,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
