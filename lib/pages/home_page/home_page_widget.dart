import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/side_nav/side_nav_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
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
          _model.statisticsModel = GetStatisticsApiCall.statisticsJsonModel(
                        (_model.apiResult8gj?.jsonBody ?? ''),
                      ) !=
                      null &&
                  GetStatisticsApiCall.statisticsJsonModel(
                        (_model.apiResult8gj?.jsonBody ?? ''),
                      ) !=
                      ''
              ? StatisticsModelStruct.fromMap(
                  GetStatisticsApiCall.statisticsJsonModel(
                  (_model.apiResult8gj?.jsonBody ?? ''),
                ))
              : null;
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
        }
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF032734),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.format_list_bulleted_sharp,
                color: FlutterFlowTheme.of(context).info,
                size: 25.0,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.sideNavModel,
                          updateCallback: () => setState(() {}),
                          child: const SideNavWidget(
                            sideMenuEnum: SideMenuEnum.HOME,
                          ),
                        ),
                      ),
                      Expanded(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                        BorderRadius.circular(
                                                            200.0),
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
                                                        BorderRadius.circular(
                                                            200.0),
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
                                                getCurrentTimestamp
                                                    .secondsSinceEpoch),
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
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
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: 450.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF3F3F3),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Group_2114.svg',
                                                            width: 20.0,
                                                            height: 20.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${_model.statisticsModel?.beyonders.toString()}  ${FFLocalizations.of(context).getVariableText(
                                                              enText:
                                                                  'Beyonders',
                                                              arText: 'بيوندر',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                        color:
                                                            Color(0xFF81787A),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Group_2116_(1).svg',
                                                            width: 20.0,
                                                            height: 20.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${_model.statisticsModel?.teams.toString()}  ${FFLocalizations.of(context).getVariableText(
                                                              enText: 'Teams',
                                                              arText: 'فرق',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (MediaQuery.sizeOf(context)
                                                          .width >
                                                      400.0)
                                                    const Opacity(
                                                      opacity: 0.5,
                                                      child: SizedBox(
                                                        height: 50.0,
                                                        child: VerticalDivider(
                                                          thickness: 1.0,
                                                          indent: 5.0,
                                                          endIndent: 5.0,
                                                          color:
                                                              Color(0xFF81787A),
                                                        ),
                                                      ),
                                                    ),
                                                  if (MediaQuery.sizeOf(context)
                                                          .width >
                                                      400.0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              'assets/images/Group_2119_(1).svg',
                                                              width: 20.0,
                                                              height: 20.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${_model.statisticsModel?.projects.toString()}  ${FFLocalizations.of(context).getVariableText(
                                                                enText:
                                                                    'Projects',
                                                                arText:
                                                                    'مشاريع',
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  450.0)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Group_2119_(1).svg',
                                                          width: 20.0,
                                                          height: 20.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${_model.statisticsModel?.projects.toString()}  ${FFLocalizations.of(context).getVariableText(
                                                            enText: 'Projects',
                                                            arText: 'مشاريع',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 40.0, 10.0, 0.0),
                                          child: Container(
                                            height: 471.0,
                                            constraints: const BoxConstraints(
                                              maxWidth: 550.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              border: Border.all(
                                                color: const Color(0xFF01A3E2),
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 20.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '98mqarv5' /* My Priorities */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Almarai',
                                                                  color: const Color(
                                                                      0xFF01A3E2),
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
                                                Container(
                                                  height: 400.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 20.0),
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
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child:
                                                                    AutoSizeText(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0ll3yfl3' /* Upcoming */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Almarai',
                                                                        color: const Color(
                                                                            0xFF808080),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  minFontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child:
                                                                    AutoSizeText(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'l4kkia6u' /* Overdue */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: const Color(
                                                                            0xFF808080),
                                                                      ),
                                                                  minFontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child:
                                                                    AutoSizeText(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0jmhf24m' /* Completed */,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: const Color(
                                                                            0xFF808080),
                                                                      ),
                                                                  minFontSize:
                                                                      12.0,
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'fdhvt9kh' /*   */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          rows:
                                                              prioritiesDatatTable
                                                                  .mapIndexed((prioritiesDatatTableIndex,
                                                                          prioritiesDatatTableItem) =>
                                                                      [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if (prioritiesDatatTableItem.status != 5)
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/Group_2140.svg',
                                                                                      width: 22.0,
                                                                                      height: 22.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                if (prioritiesDatatTableItem.status == 5)
                                                                                  Icon(
                                                                                    Icons.done_all,
                                                                                    color: FlutterFlowTheme.of(context).beyondBlueColor,
                                                                                    size: 24.0,
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                prioritiesDatatTableItem.title.maybeHandleOverflow(maxChars: 14),
                                                                                maxLines: 1,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: const Color(0xFF032734),
                                                                                    ),
                                                                                minFontSize: 12.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              functions.calculateFutureDate(prioritiesDatatTableItem.startDate),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    color: const Color(0xFF032734),
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: const Color(0xFFB00612),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                      child: Text(
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
                                                                          functions
                                                                              .calculateFutureDate(prioritiesDatatTableItem.endDate),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: const Color(0xFF032734),
                                                                              ),
                                                                          minFontSize:
                                                                              12.0,
                                                                        ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final listOfProiritesImages =
                                                                                prioritiesDatatTableItem.members.map((e) => e).toList();
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: listOfProiritesImages.length,
                                                                              itemBuilder: (context, listOfProiritesImagesIndex) {
                                                                                final listOfProiritesImagesItem = listOfProiritesImages[listOfProiritesImagesIndex];
                                                                                return Container(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  decoration: const BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(25.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/Group_2111.svg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ]
                                                                          .map((c) => DataCell(
                                                                              c))
                                                                          .toList())
                                                                  .map((e) =>
                                                                      DataRow(
                                                                          cells:
                                                                              e))
                                                                  .toList(),
                                                          headingRowColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                            const Color(0x00000000),
                                                          ),
                                                          headingRowHeight:
                                                              40.0,
                                                          dataRowColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                            const Color(0x00000000),
                                                          ),
                                                          dataRowHeight: 56.0,
                                                          border: TableBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          dividerThickness: 0.0,
                                                          columnSpacing: 1.0,
                                                          showBottomBorder:
                                                              false,
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
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 40.0, 10.0, 0.0),
                                          child: Container(
                                            height: 471.0,
                                            constraints: const BoxConstraints(
                                              maxWidth: 550.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              border: Border.all(
                                                color: const Color(0xFFFFD600),
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 20.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'jheuilak' /* Projects */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Almarai',
                                                                  color: const Color(
                                                                      0xFF01A3E2),
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
                                                Container(
                                                  height: 400.0,
                                                  decoration: const BoxDecoration(),
                                                  child: ListView(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 75.0,
                                                                  height: 75.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            200.0),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/images/Group_2111.svg',
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
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'f6lfqs2u' /* Hello World */,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Almarai',
                                                                              color: const Color(0xFF808080),
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                      const Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                150.0,
                                                                            height:
                                                                                40.0,
                                                                            child:
                                                                                custom_widgets.PannerProgressParCustomWidget(
                                                                              width: 150.0,
                                                                              height: 40.0,
                                                                              progress: 80.0,
                                                                              color: Color(0xFF39D485),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                    child: SvgPicture
                                                                        .asset(
                                                                      'assets/images/Group_2111.svg',
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '1vgdp5lb' /* Hello World */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Almarai',
                                                                            color:
                                                                                const Color(0xFF032734),
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'iou0nblk' /* Hello World */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Almarai',
                                                                            color:
                                                                                const Color(0xFF032734),
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
          ),
        ),
      ),
    );
  }
}
