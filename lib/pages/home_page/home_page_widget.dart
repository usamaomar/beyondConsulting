import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/ask_for_help_component/ask_for_help_component_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult8gj = await GetStatisticsApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResult8gj?.statusCode ?? 200) == 200) {
        setState(() {
          _model.statisticsModel = StatisticsModelStruct.maybeFromMap(
              GetStatisticsApiCall.statisticsJsonModel(
            (_model.apiResult8gj?.jsonBody ?? ''),
          ));
        });
        _model.apiResultscn = await GetMyPrioritiesApiCall.call(
          token: FFAppState().tokenModelAppState.token,
        );
        if ((_model.apiResultscn?.statusCode ?? 200) == 200) {
          setState(() {
            FFAppState().prioritiesListAppState = functions
                .fromJsonToModelList(getJsonField(
                  (_model.apiResultscn?.jsonBody ?? ''),
                  r'''$.data''',
                ))
                .toList()
                .cast<PrioritieModelStruct>();
          });
          _model.apiProjectResultscn = await GetMyProjectsApiCall.call(
            token: FFAppState().tokenModelAppState.token,
          );
          if ((_model.apiProjectResultscn?.statusCode ?? 200) == 200) {
            setState(() {
              FFAppState().projectsListAppState = functions
                  .fromProjectJsonToModelList(getJsonField(
                    (_model.apiProjectResultscn?.jsonBody ?? ''),
                    r'''$.data''',
                  ))!
                  .toList()
                  .cast<ProjectModelStruct>();
            });
            _model.apiProjectStats = await GetProjectStatisticsApiCall.call(
              token: FFAppState().tokenModelAppState.token,
            );
            if ((_model.apiProjectStats?.statusCode ?? 200) == 200) {
              setState(() {
                FFAppState().ProjectStatisticsModel =
                    ProjectStatisticModelStruct.maybeFromMap(getJsonField(
                  (_model.apiProjectStats?.jsonBody ?? ''),
                  r'''$.data''',
                ))!;
              });
            }
          }
        }
      }

      FirebaseMessaging.instance.getToken().then((value) async{
        _model.apiResult9gl = await SetNotificationTokenApiCall.call(
          token: FFAppState().tokenModelAppState.token,
          notificationToken: value,
        );
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => setState(() {}),
            child: const SideNavWidget(
              sideMenuEnum: SideMenuEnum.HOME,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF032734),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '33fu4n6u' /* Home */,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if ((FFAppState().userModelAppState.accessRole != 0) &&
                      (FFAppState().userModelAppState.accessRole != 1) &&
                      (FFAppState().userModelAppState.accessRole != 5))
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showAlignedDialog(
                            context: context,
                            isGlobal: true,
                            avoidOverflow: false,
                            targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: const AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: const SizedBox(
                                    height: 220.0,
                                    width: 390.0,
                                    child: AskForHelpComponentWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Icon(
                          Icons.help_center,
                          color: FlutterFlowTheme.of(context).accent4,
                          size: 35.0,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).info,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  children: [
                                    if (valueOrDefault<bool>(
                                      FFAppState()
                                                  .userModelAppState
                                                  .profilePictureDataUrl ==
                                              '',
                                      false,
                                    ))
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200.0),
                                        child: SvgPicture.asset(
                                          'assets/images/Group_2111.svg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      FFAppState()
                                                  .userModelAppState
                                                  .profilePictureDataUrl !=
                                              '',
                                      false,
                                    ))
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200.0),
                                        child: Image.network(
                                          FFAppState()
                                              .userModelAppState
                                              .profilePictureDataUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              dateTimeFormat(
                                'EEEE, MMM d',
                                dateTimeFromSecondsSinceEpoch(
                                    getCurrentTimestamp.secondsSinceEpoch),
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Almarai',
                                  color: const Color(0xFF032734),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            '${FFLocalizations.of(context).getVariableText(
                              enText: 'Good Morning, ',
                              arText: ', صباح الخير',
                            )}${FFAppState().userModelAppState.firstName} ${FFAppState().userModelAppState.lastName}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Almarai',
                                  color: const Color(0xFF032734),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 22.0, 10.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 450.0,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F3F3),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/Group_2114.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                '${_model.statisticsModel?.beyonders.toString()}  ${FFLocalizations.of(context).getVariableText(
                                                  enText: 'Beyonders',
                                                  arText: 'بيوندر',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Opacity(
                                        opacity: 0.5,
                                        child: SizedBox(
                                          height: 50.0,
                                          child: VerticalDivider(
                                            thickness: 1.0,
                                            indent: 5.0,
                                            endIndent: 5.0,
                                            color: Color(0xFF81787A),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/Group_2116_(1).svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                '${_model.statisticsModel?.teams.toString()}  ${FFLocalizations.of(context).getVariableText(
                                                  enText: 'Teams',
                                                  arText: 'فرق',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (MediaQuery.sizeOf(context).width >
                                          400.0)
                                        const Opacity(
                                          opacity: 0.5,
                                          child: SizedBox(
                                            height: 50.0,
                                            child: VerticalDivider(
                                              thickness: 1.0,
                                              indent: 5.0,
                                              endIndent: 5.0,
                                              color: Color(0xFF81787A),
                                            ),
                                          ),
                                        ),
                                      if (MediaQuery.sizeOf(context).width >
                                          400.0)
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Group_2119_(1).svg',
                                                  width: 20.0,
                                                  height: 20.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Text(
                                                  '${_model.statisticsModel?.projects.toString()}  ${FFLocalizations.of(context).getVariableText(
                                                    enText: 'Projects',
                                                    arText: 'مشاريع',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  if (MediaQuery.sizeOf(context).width < 450.0)
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Group_2119_(1).svg',
                                              width: 20.0,
                                              height: 20.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              '${_model.statisticsModel?.projects.toString()}  ${FFLocalizations.of(context).getVariableText(
                                                enText: 'Projects',
                                                arText: 'مشاريع',
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 40.0, 10.0, 0.0),
                                child: Container(
                                  height: 471.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      color: const Color(0xFF01A3E2),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ra0xsiiu' /* My Priorities */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Almarai',
                                                    color: const Color(0xFF01A3E2),
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 400.0,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: Builder(
                                            builder: (context) {
                                              final prioritiesDatatTable =
                                                  FFAppState()
                                                      .prioritiesListAppState
                                                      .map((e) => e)
                                                      .toList();
                                              return DataTable2(
                                                columns: [
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ohwwc2sp' /* Upcoming */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Almarai',
                                                                  color: const Color(
                                                                      0xFF808080),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        minFontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'y3hqn22l' /* Overdue */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: const Color(
                                                                      0xFF808080),
                                                                ),
                                                        minFontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '5v6lf3da' /* Completed */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: const Color(
                                                                      0xFF808080),
                                                                ),
                                                        minFontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn2(
                                                    label:
                                                        DefaultTextStyle.merge(
                                                      softWrap: true,
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'q3lp8obk' /*   */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                rows: prioritiesDatatTable
                                                    .mapIndexed(
                                                        (prioritiesDatatTableIndex,
                                                                prioritiesDatatTableItem) =>
                                                            [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      if (prioritiesDatatTableItem
                                                                              .status !=
                                                                          5)
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/Group_2140.svg',
                                                                            width:
                                                                                22.0,
                                                                            height:
                                                                                22.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (prioritiesDatatTableItem
                                                                              .status ==
                                                                          5)
                                                                        Icon(
                                                                          Icons
                                                                              .done_all,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).beyondBlueColor,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      prioritiesDatatTableItem
                                                                          .title
                                                                          .maybeHandleOverflow(
                                                                              maxChars: 14),
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                const Color(0xFF032734),
                                                                          ),
                                                                      minFontSize:
                                                                          12.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    functions.calculateFutureDate(
                                                                        prioritiesDatatTableItem
                                                                            .startDate),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              const Color(0xFF032734),
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            5.0),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0xFFB00612),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(5.0),
                                                                            child:
                                                                                Text(
                                                                              prioritiesDatatTableItem.projectName,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    fontSize: 9.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              AutoSizeText(
                                                                functions.calculateFutureDate(
                                                                    prioritiesDatatTableItem
                                                                        .endDate),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: const Color(
                                                                          0xFF032734),
                                                                    ),
                                                                minFontSize:
                                                                    12.0,
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final listOfProiritesImages = prioritiesDatatTableItem
                                                                      .members
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList();
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    itemCount:
                                                                        listOfProiritesImages
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listOfProiritesImagesIndex) {
                                                                      final listOfProiritesImagesItem =
                                                                          listOfProiritesImages[
                                                                              listOfProiritesImagesIndex];
                                                                      return Container(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              25.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            functions.getFullImage(listOfProiritesImagesItem.picture)!,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ]
                                                                .map((c) =>
                                                                    DataCell(c))
                                                                .toList())
                                                    .map((e) =>
                                                        DataRow(cells: e))
                                                    .toList(),
                                                headingRowColor:
                                                    MaterialStateProperty.all(
                                                  const Color(0x00000000),
                                                ),
                                                headingRowHeight: 40.0,
                                                dataRowColor:
                                                    MaterialStateProperty.all(
                                                  const Color(0x00000000),
                                                ),
                                                dataRowHeight: 56.0,
                                                border: TableBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                dividerThickness: 0.0,
                                                columnSpacing: 1.0,
                                                showBottomBorder: false,
                                                minWidth: 49.0,
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
                            if (MediaQuery.sizeOf(context).width > 450.0)
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 40.0, 10.0, 0.0),
                                  child: Container(
                                    height: 471.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(25.0),
                                      border: Border.all(
                                        color: const Color(0xFFFFD600),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6pv65e2v' /* Projects */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Almarai',
                                                          color:
                                                              const Color(0xFF01A3E2),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 380.0,
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final listOfProjects =
                                                  FFAppState()
                                                      .projectsListAppState
                                                      .map((e) => e)
                                                      .toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listOfProjects.length,
                                                itemBuilder: (context,
                                                    listOfProjectsIndex) {
                                                  final listOfProjectsItem =
                                                      listOfProjects[
                                                          listOfProjectsIndex];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              200.0),
                                                                  child: Image
                                                                      .network(
                                                                    functions.getFullImage(
                                                                        listOfProjectsItem
                                                                            .clientLogo)!,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      listOfProjectsItem
                                                                          .name,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Almarai',
                                                                            color:
                                                                                const Color(0xFF808080),
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              150.0,
                                                                          height:
                                                                              40.0,
                                                                          child:
                                                                              custom_widgets.PannerProgressParCustomWidget(
                                                                            width:
                                                                                150.0,
                                                                            height:
                                                                                40.0,
                                                                            progress:
                                                                                valueOrDefault<double>(
                                                                              listOfProjectsItem.progress,
                                                                              0.0,
                                                                            ),
                                                                            color:
                                                                                const Color(0xFF39D485),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.0),
                                                                child: Image
                                                                    .network(
                                                                  functions.getFullImage(
                                                                      listOfProjectsItem
                                                                          .seniorPicture)!,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  listOfProjectsItem
                                                                      .senior,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Almarai',
                                                                        color: const Color(
                                                                            0xFF032734),
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  listOfProjectsItem
                                                                      .team,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Almarai',
                                                                        color: const Color(
                                                                            0xFF032734),
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'HomePageSeeAll',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'l3ntj3oh' /* See More >> */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
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
                        if (MediaQuery.sizeOf(context).width < 450.0)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 40.0, 10.0, 0.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                minWidth: 370.0,
                                maxWidth: 550.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                  color: const Color(0xFFFFD600),
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'a5wbit0k' /* Projects */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Almarai',
                                                color: const Color(0xFF01A3E2),
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 380.0,
                                    decoration: const BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final listOfProjects = FFAppState()
                                            .projectsListAppState
                                            .map((e) => e)
                                            .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: listOfProjects.length,
                                          itemBuilder:
                                              (context, listOfProjectsIndex) {
                                            final listOfProjectsItem =
                                                listOfProjects[
                                                    listOfProjectsIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 60.0,
                                                          height: 60.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        200.0),
                                                            child:
                                                                Image.network(
                                                              functions.getFullImage(
                                                                  listOfProjectsItem
                                                                      .clientLogo)!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                listOfProjectsItem
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Almarai',
                                                                      color: const Color(
                                                                          0xFF808080),
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        40.0,
                                                                    child: custom_widgets
                                                                        .PannerProgressParCustomWidget(
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          40.0,
                                                                      progress:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        listOfProjectsItem
                                                                            .progress,
                                                                        0.0,
                                                                      ),
                                                                      color: const Color(
                                                                          0xFF39D485),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          child: Image.network(
                                                            functions.getFullImage(
                                                                listOfProjectsItem
                                                                    .seniorPicture)!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            listOfProjectsItem
                                                                .senior,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Almarai',
                                                                  color: const Color(
                                                                      0xFF032734),
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Text(
                                                            listOfProjectsItem
                                                                .team,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Almarai',
                                                                  color: const Color(
                                                                      0xFF032734),
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'bwv8f0k5' /* See More >> */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (MediaQuery.sizeOf(context).width > 450.0)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 30.0, 15.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                  color: const Color(0xFF808080),
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'zv1tgsjl' /* Targets */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Almarai',
                                                color: const Color(0xFF01A3E2),
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 200.0,
                                            height: 200.0,
                                            child: custom_widgets
                                                .CircularProgressParCustomWidget(
                                              width: 200.0,
                                              height: 200.0,
                                              progress: FFAppState()
                                                  .ProjectStatisticsModel
                                                  .profitPercentage,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .beyondBlueColor,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'q87jn3s3' /* Financial Target */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Almarai',
                                                          color:
                                                              const Color(0xFF808080),
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '${FFAppState().ProjectStatisticsModel.profit.toString()}${FFLocalizations.of(context).getVariableText(
                                                        enText: ' K ',
                                                        arText: ' الف ',
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Almarai',
                                                            color: const Color(
                                                                0xFF01A3E2),
                                                            fontSize: 35.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    Text(
                                                      '/ ${functions.calculateRatio(valueOrDefault<double>(
                                                            FFAppState()
                                                                .ProjectStatisticsModel
                                                                .profit,
                                                            0.0,
                                                          ), valueOrDefault<double>(
                                                            FFAppState()
                                                                .ProjectStatisticsModel
                                                                .profitPercentage,
                                                            0.0,
                                                          )).toString()}${FFLocalizations.of(context).getVariableText(
                                                        enText: 'K',
                                                        arText: 'الف',
                                                      )}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Almarai',
                                                            color: const Color(
                                                                0xFF808080),
                                                            fontSize: 25.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatLastUpdated(
                                                      FFAppState()
                                                          .ProjectStatisticsModel
                                                          .lastUpdated,
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode),
                                                  'null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 200.0,
                                            height: 200.0,
                                            child: custom_widgets
                                                .CircularProgressParCustomWidget(
                                              width: 200.0,
                                              height: 200.0,
                                              progress: FFAppState()
                                                  .ProjectStatisticsModel
                                                  .averageClientSatisfaction
                                                  .toDouble(),
                                              color: const Color(0xFFB1D77B),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'zwtl76zx' /* Client Satisfaction */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Almarai',
                                                          color:
                                                              const Color(0xFF808080),
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '${FFAppState().ProjectStatisticsModel.averageClientSatisfaction.toString()}٪',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Almarai',
                                                            color: const Color(
                                                                0xFFB1D77B),
                                                            fontSize: 35.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  functions.formatLastUpdated(
                                                      FFAppState()
                                                          .ProjectStatisticsModel
                                                          .lastUpdated,
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode),
                                                  'null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (MediaQuery.sizeOf(context).width < 450.0)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 30.0, 15.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                  color: const Color(0xFF808080),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'bhxknzuf' /* Targets */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Almarai',
                                                  color: const Color(0xFF01A3E2),
                                                  fontWeight: FontWeight.bold,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: 150.0,
                                              height: 150.0,
                                              child: custom_widgets
                                                  .CircularProgressParCustomWidget(
                                                width: 150.0,
                                                height: 150.0,
                                                progress: FFAppState()
                                                    .ProjectStatisticsModel
                                                    .profitPercentage,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .beyondBlueColor,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nhgqpzos' /* Financial Target */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        color:
                                                            const Color(0xFF808080),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '${FFAppState().ProjectStatisticsModel.profit.toString()}${FFLocalizations.of(context).getVariableText(
                                                          enText: ' K ',
                                                          arText: ' الف ',
                                                        )}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              color: const Color(
                                                                  0xFF01A3E2),
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                      Text(
                                                        '/ ${functions.calculateRatio(valueOrDefault<double>(
                                                              FFAppState()
                                                                  .ProjectStatisticsModel
                                                                  .profit,
                                                              0.0,
                                                            ), valueOrDefault<double>(
                                                              FFAppState()
                                                                  .ProjectStatisticsModel
                                                                  .profitPercentage,
                                                              0.0,
                                                            )).toString()}${FFLocalizations.of(context).getVariableText(
                                                          enText: 'K',
                                                          arText: 'الف',
                                                        )}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              color: const Color(
                                                                  0xFF808080),
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.formatLastUpdated(
                                                        FFAppState()
                                                            .ProjectStatisticsModel
                                                            .lastUpdated,
                                                        FFLocalizations.of(
                                                                context)
                                                            .languageCode),
                                                    'null',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: 150.0,
                                              height: 150.0,
                                              child: custom_widgets
                                                  .CircularProgressParCustomWidget(
                                                width: 150.0,
                                                height: 150.0,
                                                progress: FFAppState()
                                                    .ProjectStatisticsModel
                                                    .averageClientSatisfaction
                                                    .toDouble(),
                                                color: const Color(0xFFB1D77B),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1cdtx7kp' /* Client Satisfaction */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        color:
                                                            const Color(0xFF808080),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '${FFAppState().ProjectStatisticsModel.averageClientSatisfaction.toString()}٪',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              color: const Color(
                                                                  0xFFB1D77B),
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.formatLastUpdated(
                                                        FFAppState()
                                                            .ProjectStatisticsModel
                                                            .lastUpdated,
                                                        FFLocalizations.of(
                                                                context)
                                                            .languageCode),
                                                    'null',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ].addToEnd(const SizedBox(height: 50.0)),
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
