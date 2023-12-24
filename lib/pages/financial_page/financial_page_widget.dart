import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart' as excelOne;
// import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'financial_page_model.dart';
export 'financial_page_model.dart';
import 'dart:html' as html;

class FinancialPageWidget extends StatefulWidget {
  const FinancialPageWidget({super.key});

  @override
  _FinancialPageWidgetState createState() => _FinancialPageWidgetState();
}

class _FinancialPageWidgetState extends State<FinancialPageWidget>
    with TickerProviderStateMixin {
  late FinancialPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinancialPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.currentYear = valueOrDefault<String>(
          dateTimeFormat(
            'yyyy',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ),
          'yyyy',
        );
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              sideMenuEnum: SideMenuEnum.FINANCIALS,
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
                        '3y6h8kqm' /* Financials */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'nzurunjw' /* 2015 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'nh2h6kal' /* 2016 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'q7j9xn8x' /* 2017 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '69u7odmo' /* 2018 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'c0hkztkb' /* 2019 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'f0x5vl8i' /* 2020 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'tag3mc9k' /* 2021 */,
                      ),
                      FFLocalizations.of(context).getText(
                        '2shja1zg' /* 2022 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xelddykb' /* 2023 */,
                      ),
                      FFLocalizations.of(context).getText(
                        'og39t28a' /* 2024 */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue = val);
                      setState(() {
                        _model.currentYear = _model.dropDownValue!;
                      });
                    },
                    width: 300.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: _model.currentYear,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderWidth: 2.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: true,
                    isSearchable: false,
                    isMultiSelect: false,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).info,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            border: Border.all(
                              color:
                                  FlutterFlowTheme.of(context).beyondBlueColor,
                              width: 2.0,
                            ),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 30.0, 30.0, 30.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: const Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                      unselectedLabelStyle: const TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .beyondBlueColor,
                                      padding: const EdgeInsets.all(4.0),
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'fzm9nlbq' /* Financial Budget */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'wdxq142a' /* Financial Project Summary */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ohjad6wp' /* Cost Management Actual Income */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'less2tef' /* Financial Results */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Stack(
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetFinancialBudgetReportApiCall
                                                      .call(
                                                token: FFAppState()
                                                    .tokenModelAppState
                                                    .token,
                                                year: _model.currentYear,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .beyondBlueColor,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final dataTableGetFinancialBudgetReportApiResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final financialBudgetLocalList =
                                                        getJsonField(
                                                      dataTableGetFinancialBudgetReportApiResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                    ).toList();
                                                    return DataTable2(
                                                      columns: [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'b16czbs9' /* Description */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'tlbo4blx' /* Category */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                '0bseo92z' /* Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'osir63vv' /* Annual Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'ggdha5hj' /* Monthly Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      rows: (financialBudgetLocalList
                                                              as Iterable)
                                                          .mapIndexed((financialBudgetLocalListIndex,
                                                                  financialBudgetLocalListItem) =>
                                                              [
                                                                Text(
                                                                  getJsonField(
                                                                    financialBudgetLocalListItem,
                                                                    r'''$.description''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    financialBudgetLocalListItem,
                                                                    r'''$.category''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    financialBudgetLocalListItem,
                                                                    r'''$.percentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    financialBudgetLocalListItem,
                                                                    r'''$.annualAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    financialBudgetLocalListItem,
                                                                    r'''$.monthlyAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ]
                                                                  .map((c) =>
                                                                      DataCell(
                                                                          c))
                                                                  .toList())
                                                          .map((e) =>
                                                              DataRow(cells: e))
                                                          .toList(),
                                                      headingRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                      headingRowHeight: 56.0,
                                                      dataRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                      dataRowHeight: 56.0,
                                                      border: TableBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      dividerThickness: 1.0,
                                                      showBottomBorder: true,
                                                      minWidth: 49.0,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.apiResultrqd =
                                                      await GetFinancialBudgetExcelApiCall
                                                          .call(
                                                    token: FFAppState()
                                                        .tokenModelAppState
                                                        .token,
                                                    year: _model.currentYear,
                                                  );
                                                  if ((_model.apiResultrqd
                                                          ?.succeeded ??
                                                      true)) {
                                                    await convertAndDownload(
                                                      (_model.apiResultrqd
                                                              ?.bodyText ??
                                                          ''),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '6tq8uias' /* Download Report */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .beyondBlueColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetFinancialProjectSummaryReportApiCall
                                                      .call(
                                                token: FFAppState()
                                                    .tokenModelAppState
                                                    .token,
                                                year: _model.currentYear,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final dataTableGetFinancialProjectSummaryReportApiResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final listOfFinancialProjectSummaryLocal =
                                                        getJsonField(
                                                      dataTableGetFinancialProjectSummaryReportApiResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                    ).toList();
                                                    return DataTable2(
                                                      columns: [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'jm2q5r4p' /* Client Name */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                '5ar1cv1m' /* Project Name */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                '05jrgrh4' /* Country */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'w4spmb0g' /* Revenues */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'v52eofou' /* Cost Of Sales */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'jfdaq7zu' /* Cost Of Sales Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                '47a8kuz5' /* Optimal Cost Of Sales */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'rj3w140m' /* Gross Profit */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'u0aipz83' /* Gross Profit Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'qx8695q8' /* Client Satisfaction */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'ahjakgux' /* Project Management */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      rows: (listOfFinancialProjectSummaryLocal
                                                              as Iterable)
                                                          .mapIndexed((listOfFinancialProjectSummaryLocalIndex,
                                                                  listOfFinancialProjectSummaryLocalItem) =>
                                                              [
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.clientName''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.projectName''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.country''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.revenues''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.costOfSales''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.costOfSalesPercentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.optimalCostOfSales''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.grossProfit''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.grossProfitPercentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.clientSatisfaction''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinancialProjectSummaryLocalItem,
                                                                    r'''$.projectManagement''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ]
                                                                  .map((c) =>
                                                                      DataCell(
                                                                          c))
                                                                  .toList())
                                                          .map((e) =>
                                                              DataRow(cells: e))
                                                          .toList(),
                                                      headingRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                      headingRowHeight: 56.0,
                                                      dataRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                      dataRowHeight: 56.0,
                                                      border: TableBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      dividerThickness: 1.0,
                                                      showBottomBorder: true,
                                                      minWidth: 49.0,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.apiResultrqd2 =
                                                      await GetFinancialProjectSummaryExcelApiCall
                                                          .call(
                                                    token: FFAppState()
                                                        .tokenModelAppState
                                                        .token,
                                                    year: _model.currentYear,
                                                  );
                                                  if ((_model.apiResultrqd2
                                                          ?.succeeded ??
                                                      true)) {
                                                    await convertAndDownload(
                                                      getJsonField(
                                                        (_model.apiResultrqd2
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$''',
                                                      ).toString(),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '4607co4d' /* Download Report */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .beyondBlueColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetCostManagementActualIncomeReportApiCall
                                                      .call(
                                                token: FFAppState()
                                                    .tokenModelAppState
                                                    .token,
                                                year: _model.currentYear,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .beyondBlueColor,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final dataTableGetCostManagementActualIncomeReportApiResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final listOfLocalsReps =
                                                        getJsonField(
                                                      dataTableGetCostManagementActualIncomeReportApiResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                    ).toList();
                                                    return DataTable2(
                                                      columns: [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'urptt7ge' /* Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                '0sbhcthc' /* Annual Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'hdpcp8k4' /* Monthly Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                '34a0ir1k' /* Description */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'xcesashc' /* Category */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'gk2c8nlk' /* Up To Date Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'yhurnlwd' /* Up To Date Annual Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'la2r253y' /* Up To Date Monthly Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'dyp4qn6y' /* Variance */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                '884ntu0s' /* Variance Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      rows: (listOfLocalsReps
                                                              as Iterable)
                                                          .mapIndexed((listOfLocalsRepsIndex,
                                                                  listOfLocalsRepsItem) =>
                                                              [
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.percentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.annualAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.monthlyAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.description''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.category''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.upToDatePercentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.upToDateAnnualAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.upToDateMonthlyAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.variance''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfLocalsRepsItem,
                                                                    r'''$.variancePercentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ]
                                                                  .map((c) =>
                                                                      DataCell(
                                                                          c))
                                                                  .toList())
                                                          .map((e) =>
                                                              DataRow(cells: e))
                                                          .toList(),
                                                      headingRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                      headingRowHeight: 56.0,
                                                      dataRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                      dataRowHeight: 56.0,
                                                      border: TableBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      dividerThickness: 1.0,
                                                      showBottomBorder: true,
                                                      minWidth: 49.0,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.apiResultrqd24 =
                                                      await GetCostManagementActualIncomeExcelApiCall
                                                          .call(
                                                    token: FFAppState()
                                                        .tokenModelAppState
                                                        .token,
                                                    year: _model.currentYear,
                                                  );
                                                  if ((_model.apiResultrqd24
                                                          ?.succeeded ??
                                                      true)) {
                                                    await convertAndDownload(
                                                      getJsonField(
                                                        (_model.apiResultrqd24
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$''',
                                                      ).toString(),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'pj3e3mo7' /* Download Report */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .beyondBlueColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetFinancialResultsReportApiCall
                                                      .call(
                                                token: FFAppState()
                                                    .tokenModelAppState
                                                    .token,
                                                year: _model.currentYear,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 20.0,
                                                      height: 20.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .beyondBlueColor,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final dataTableGetFinancialResultsReportApiResponse =
                                                    snapshot.data!;
                                                return Builder(
                                                  builder: (context) {
                                                    final listOfFinReops =
                                                        getJsonField(
                                                      dataTableGetFinancialResultsReportApiResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                    ).toList();
                                                    return DataTable2(
                                                      columns: [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'sq33tzvj' /* Description */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'khwf0mao' /* Category */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'vqwz0gb6' /* Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'f4z49yty' /* Annual Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'k7n1omej' /* Monthly Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'adc9qw7y' /* Initial Annual Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'ebpinxlc' /* Up To Date Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'r3cw119o' /* Up To Date Annual Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'y8dw8aw0' /* Up To Date Monthly Amount */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'buqagv4a' /* Variance */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
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
                                                                'j59qaau4' /* Variance Percentage */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      rows: (listOfFinReops
                                                              as Iterable)
                                                          .mapIndexed((listOfFinReopsIndex,
                                                                  listOfFinReopsItem) =>
                                                              [
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.description''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.category''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.percentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.annualAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.monthlyAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.initialAnnualAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.upToDatePercentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.upToDateAnnualAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.upToDateMonthlyAmount''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.variance''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    listOfFinReopsItem,
                                                                    r'''$.variancePercentage''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ]
                                                                  .map((c) =>
                                                                      DataCell(
                                                                          c))
                                                                  .toList())
                                                          .map((e) =>
                                                              DataRow(cells: e))
                                                          .toList(),
                                                      headingRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                      ),
                                                      headingRowHeight: 56.0,
                                                      dataRowColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                      dataRowHeight: 56.0,
                                                      border: TableBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                      dividerThickness: 1.0,
                                                      showBottomBorder: true,
                                                      minWidth: 49.0,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.apiResultrqd245 =
                                                      await GetFinancialResultsExcelApiCall
                                                          .call();
                                                  if ((_model.apiResultrqd245
                                                          ?.succeeded ??
                                                      true)) {
                                                    await convertAndDownload(
                                                      getJsonField(
                                                        (_model.apiResultrqd245
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$''',
                                                      ).toString(),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'flhyevtf' /* Download Report */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .beyondBlueColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future convertAndDownload(String text) async {
    var excel = excelOne.Excel.createExcel();
    var sheet = excel['Sheet1'];
    List<String> lines = LineSplitter.split(text).toList();
    for (var i = 0; i < lines.length; i++) {
      sheet.cell(excelOne.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i)).value = lines[i]  ;
    }
    List<int>? excelBytes = excel.encode();
    Uint8List uint8List = Uint8List.fromList(excelBytes!);
    String base64String = base64Encode(uint8List);
    final blob = html.Blob([Uint8List.fromList(base64Decode(base64String))]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'output.xlsx' // Change the filename as needed
      ..click();

    // Clean up
    html.Url.revokeObjectUrl(url);
  }

}
