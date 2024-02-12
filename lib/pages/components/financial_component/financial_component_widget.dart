import 'package:flutter/scheduler.dart';

import '../../progect_pages/project_page/sync.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'financial_component_model.dart';
export 'financial_component_model.dart';

class FinancialComponentWidget extends StatefulWidget {
  const FinancialComponentWidget({
    super.key,
    required this.financialStatisticsModel,
  });

  final FinancialStatisticsOutputModelStruct? financialStatisticsModel;

  @override
  State<FinancialComponentWidget> createState() =>
      _FinancialComponentWidgetState();
}

class _FinancialComponentWidgetState extends State<FinancialComponentWidget>
    with TickerProviderStateMixin {
  late FinancialComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinancialComponentModel());
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.addToTotalLableList(BarChartModelStruct(
          lable: FFLocalizations.of(context).getVariableText(
            enText: 'Total',
            arText: 'المجموع',
          ),
          number: widget.financialStatisticsModel?.data.totalBudget.toInt(),
          color: const Color(0xFFFFD600),
        ));
        _model.addToSpentLableList(BarChartModelStruct(
          lable: FFLocalizations.of(context).getVariableText(
            enText: 'Spent',
            arText: 'أنفق',
          ),
          number: widget.financialStatisticsModel?.data.spentBudget.toInt(),
          color: const Color(0xFF2C8CB6),
        ));
        _model.addToRemainingLableList(BarChartModelStruct(
          lable: FFLocalizations.of(context).getVariableText(
            enText: 'Remaining',
            arText: 'متبقي',
          ),
          number: widget.financialStatisticsModel?.data.remainingBudget.toInt(),
          color: const Color(0xFFC8C9CC),
        ));
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 10.0, 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          border: Border.all(
            color: const Color(0xFFF0E29D),
            width: 2.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'btlxbbgn' /* Financial Targets */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: false,
                        ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                if ((FFAppState().userModelAppState.accessRole == 2) ||
                    (FFAppState().userModelAppState.accessRole == 3) ||
                    (FFAppState().userModelAppState.accessRole == 4)
                    ? true
                    : false)
                Container(

                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 390.0,
                                height: 370.0,
                                child: Sync(
                                  width: 390.0,
                                  listOfTotal:
                                  _model.totalLableList,
                                  listOfSpent:
                                  _model.spentLableList,
                                  listOfRemainingBudget:
                                  _model.remainingLableList,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional
                                .fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context)
                                      .getText(
                                    'hki296sc' /* Total Budgets */,
                                  ),
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
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional
                                      .fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    '${valueOrDefault<String>(
                                      widget.financialStatisticsModel?.data.totalBudget.toString(),
                                      '0',
                                    )} ${FFLocalizations.of(context).getVariableText(
                                      enText: 'JOD',
                                      arText: 'د.أ',
                                    )}',
                                    style: FlutterFlowTheme.of(
                                        context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Almarai',
                                      color: const Color(
                                          0xFFFFD600),
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
                            padding: const EdgeInsetsDirectional
                                .fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context)
                                      .getText(
                                    '6g45g0s6' /* Spent Budgets */,
                                  ),
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
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional
                                      .fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    '${valueOrDefault<String>(
                                      widget.financialStatisticsModel?.data.spentBudget
                                          .toString(),
                                      '0',
                                    )} ${FFLocalizations.of(context).getVariableText(
                                      enText: 'JOD',
                                      arText: 'د.أ',
                                    )}',
                                    style: FlutterFlowTheme.of(
                                        context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Almarai',
                                      color: const Color(
                                          0xFF2C8CB6),
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
                            padding: const EdgeInsetsDirectional
                                .fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context)
                                      .getText(
                                    '69xkzumz' /* Remaining Budgets */,
                                  ),
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
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional
                                      .fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                       widget.financialStatisticsModel?.data.remainingBudget
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme
                                        .of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Almarai',
                                      color: const Color(
                                          0xFFC8C9CC),
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
                        ],
                      ),
                    ],
                  ),
                ),
                if ((FFAppState().userModelAppState.accessRole == 0) ||
                        (FFAppState().userModelAppState.accessRole == 1) ||
                        (FFAppState().userModelAppState.accessRole == 5)
                    ? true
                    : false)
                  Container(
                    height: 400.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).beyondBlueColor,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 14.0,
                                ),
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor: const Color(0xFFC3C1C1),
                            padding: const EdgeInsets.all(4.0),
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'eosq15nx' /* Revenue */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  '0807zsfx' /* Cost */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'z1bs29u2' /* Targeted Gp */,
                                ),
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFDED9D9),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                            10.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rd42138o' /* Total Revenue */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                            10.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '2e97cjeu' /* Actual */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .financialStatisticsModel
                                                                    ?.data
                                                                    .actualRevenue
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '6pev49f6' /* Planned */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          10.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .financialStatisticsModel
                                                                    ?.data
                                                                    .plannedRevenue
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        10.0,
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
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      10.0, 10.0, 10.0, 10.0),
                                              child: LinearPercentIndicator(
                                                percent: (getPercentage(
                                                                widget
                                                                        .financialStatisticsModel
                                                                        ?.data
                                                                        .actualRevenue ??
                                                                    0,
                                                                widget
                                                                        .financialStatisticsModel
                                                                        ?.data
                                                                        .plannedRevenue ??
                                                                    0) *
                                                            0.01) <
                                                        0
                                                    ? 0
                                                    : (getPercentage(
                                                            widget
                                                                    .financialStatisticsModel
                                                                    ?.data
                                                                    .actualRevenue ??
                                                                0,
                                                            widget
                                                                    .financialStatisticsModel
                                                                    ?.data
                                                                    .plannedRevenue ??
                                                                0) *
                                                        0.01),
                                                lineHeight: 16.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    FlutterFlowTheme.of(context)
                                                        .beyondBlueColor,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                center: Text(
                                                  '${gFl(getPercentage(widget.financialStatisticsModel?.data.actualRevenue ?? 0, widget.financialStatisticsModel?.data.plannedRevenue ?? 0))}%',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                                barRadius:
                                                    const Radius.circular(15.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 15.0, 0.0, 15.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFDED9D9),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
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
                                                              .fromSTEB(10.0,
                                                              0.0, 10.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'yv0eg8ve' /* Total Cost */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(10.0,
                                                              0.0, 10.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0sunwcw3' /* Actual */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .financialStatisticsModel
                                                                      ?.data
                                                                      .actualCost
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'v8pgebya' /* Planned */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            10.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .financialStatisticsModel
                                                                      ?.data
                                                                      .plannedCost
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          10.0,
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
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: LinearPercentIndicator(
                                                  percent: (getPercentage(
                                                                  widget
                                                                          .financialStatisticsModel
                                                                          ?.data
                                                                          .actualCost ??
                                                                      0,
                                                                  widget
                                                                          .financialStatisticsModel
                                                                          ?.data
                                                                          .plannedCost ??
                                                                      0) *
                                                              0.01) <
                                                          0
                                                      ? 0
                                                      : (getPercentage(
                                                              widget
                                                                      .financialStatisticsModel
                                                                      ?.data
                                                                      .actualCost ??
                                                                  0,
                                                              widget
                                                                      .financialStatisticsModel
                                                                      ?.data
                                                                      .plannedCost ??
                                                                  0) *
                                                          0.01),
                                                  lineHeight: 16.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                  center: Text(
                                                    '${gFl(getPercentage(widget.financialStatisticsModel?.data.actualCost ?? 0, widget.financialStatisticsModel?.data.plannedCost ?? 0))}%',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .beyondBlueColor,
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                  barRadius:
                                                      const Radius.circular(
                                                          15.0),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 15.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFDED9D9),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
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
                                                              .fromSTEB(10.0,
                                                              0.0, 10.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '3j940jsh' /* Gross Profit */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(10.0,
                                                              0.0, 10.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'dzozq018' /* Actual */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .financialStatisticsModel
                                                                      ?.data
                                                                      .actualProfit
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '884ipkiw' /* Planned */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            10.0,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .financialStatisticsModel
                                                                      ?.data
                                                                      .plannedProfit
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          10.0,
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
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: LinearPercentIndicator(
                                                  percent: (getPercentage(
                                                                  widget
                                                                          .financialStatisticsModel
                                                                          ?.data
                                                                          .actualProfit ??
                                                                      0,
                                                                  widget
                                                                          .financialStatisticsModel
                                                                          ?.data
                                                                          .plannedProfit ??
                                                                      0) *
                                                              0.01) <
                                                          0
                                                      ? 0
                                                      : (getPercentage(
                                                              widget
                                                                      .financialStatisticsModel
                                                                      ?.data
                                                                      .actualProfit ??
                                                                  0,
                                                              widget
                                                                      .financialStatisticsModel
                                                                      ?.data
                                                                      .plannedProfit ??
                                                                  0) *
                                                          0.01) % 1,
                                                  lineHeight: 16.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .warning,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                  center: Text(
                                                    '${gFl(getPercentage(widget.financialStatisticsModel?.data.actualProfit ?? 0, widget.financialStatisticsModel?.data.plannedProfit ?? 0))}%',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .beyondBlueColor,
                                                          fontSize: 12.0,
                                                        ),
                                                  ),
                                                  barRadius:
                                                      const Radius.circular(
                                                          15.0),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          SizedBox(
                                            width: 390.0,
                                            child: Sync(
                                              width: 390.0,
                                              listOfTotal:
                                                  _model.totalLableList,
                                              listOfSpent:
                                                  _model.spentLableList,
                                              listOfRemainingBudget:
                                                  _model.remainingLableList,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '23vk76c1' /* Actual Gp */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  fontSize: 32.0,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'h6le3gr0' /* / */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  fontSize: 32.0,
                                                ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '8n2mayaq' /* Target Gp */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .beyondBlueColor,
                                                  fontSize: 32.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                widget.financialStatisticsModel
                                                    ?.data.targetGP
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                    fontSize: 32.0,
                                                  ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'oa5r825a' /* / */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                    fontSize: 32.0,
                                                  ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                widget.financialStatisticsModel
                                                    ?.data.actualGP
                                                    .toString(),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .beyondBlueColor,
                                                    fontSize: 32.0,
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
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double getPercentage(double actual, double planned) {
    return (actual / planned) * 100;
  }

  String gFl(double? inputVal) {
    String input = inputVal.toString();
    input = input.replaceAll('null', '0');
    if (input.length >= 2) {
      return input.substring(0, 2);
    } else {
      return input;
    }
  }
}
