import 'package:data_table_2/data_table_2.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/components/all_cost_drop_component/all_cost_drop_component_widget.dart';
import '/pages/components/note_components/view_component/view_component_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'all_costs_page_model.dart';
export 'all_costs_page_model.dart';

class AllCostsPageWidget extends StatefulWidget {
  const AllCostsPageWidget({super.key});

  @override
  _AllCostsPageWidgetState createState() => _AllCostsPageWidgetState();
}

class _AllCostsPageWidgetState extends State<AllCostsPageWidget> {
  late AllCostsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllCostsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResulttbe = await GetAllCostsApiCall.call(
        token: FFAppState().tokenModelAppState.token,
        fromDate: _model.fromDatePicked,
        toDate: _model.toDatePicked,
      );
      if ((_model.apiResulttbe?.succeeded ?? true)) {
        setState(() {
          _model.allCostsList = (getJsonField(
            (_model.apiResulttbe?.jsonBody ?? ''),
            r'''$.data''',
            true,
          )!
              .toList()
              .map<CostModelStruct?>(CostModelStruct.maybeFromMap)
              .toList() as Iterable<CostModelStruct?>)
              .withoutNulls
              .toList()
              .cast<CostModelStruct>();
        });
      }
    });

    _model.textControllerNote ??= TextEditingController();
    _model.textFieldFocusNodeNote ??= FocusNode();

    _model.textControllerAdminNote ??= TextEditingController();
    _model.textFieldFocusNodeAdminNote ??= FocusNode();

    _model.textControllerActualBilledAmount ??= TextEditingController();
    _model.textFieldFocusNodeActualBilledAmount ??= FocusNode();

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
          statusBarBrightness: Theme
              .of(context)
              .brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    return GestureDetector(
      onTap: () =>
      _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme
            .of(context)
            .primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => setState(() {}),
            child: const SideNavWidget(
              sideMenuEnum: SideMenuEnum.ALL_COSTS,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF032734),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                      color: FlutterFlowTheme
                          .of(context)
                          .info,
                      size: 25.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        25.0, 0.0, 25.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'zp0no3lu' /* All Costs */,
                      ),
                      style: FlutterFlowTheme
                          .of(context)
                          .bodyMedium
                          .override(
                        fontFamily: 'Almarai',
                        color: FlutterFlowTheme
                            .of(context)
                            .info,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15, 20, 15, 20),
                                child: InkWell(
                                  onTap: () async {
                                    final _datePickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: _model.fromDatePicked ??
                                          getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return wrapInMaterialDatePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .primary,
                                          headerForegroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .info,
                                          headerTextStyle: FlutterFlowTheme
                                              .of(context)
                                              .headlineLarge
                                              .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 32,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          pickerBackgroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .secondaryBackground,
                                          pickerForegroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .primaryText,
                                          selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .beyondBlueColor,
                                          selectedDateTimeForegroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .info,
                                          actionButtonForegroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .primaryText,
                                          iconSize: 24,
                                        );
                                      },
                                    );
                                    if (_datePickedDate != null) {
                                      safeSetState(() {
                                        _model.fromDatePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                        );
                                      });
                                    }
                                  },
                                  child: Row(children: [
                                    const Icon(
                                      Icons.date_range,
                                      size: 35,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Text(
                                        _model.fromDatePicked == null
                                            ? 'From Date'
                                            : formatDate(
                                            _model.fromDatePicked ??
                                                DateTime.now()),
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .labelLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color: _model.fromDatePicked != null
                                              ? FlutterFlowTheme
                                              .of(context)
                                              .beyondBlueColor
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15, 20, 15, 60),
                                child: InkWell(
                                  onTap: () async {
                                    final _datePickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: _model.toDatePicked ??
                                          getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return wrapInMaterialDatePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .primary,
                                          headerForegroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .info,
                                          headerTextStyle: FlutterFlowTheme
                                              .of(context)
                                              .headlineLarge
                                              .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 32,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          pickerBackgroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .secondaryBackground,
                                          pickerForegroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .primaryText,
                                          selectedDateTimeBackgroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .beyondBlueColor,
                                          selectedDateTimeForegroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .info,
                                          actionButtonForegroundColor:
                                          FlutterFlowTheme
                                              .of(context)
                                              .primaryText,
                                          iconSize: 24,
                                        );
                                      },
                                    );
                                    if (_datePickedDate != null) {
                                      safeSetState(() {
                                        _model.toDatePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                        );
                                      });
                                    }
                                  },
                                  child: Row(children: [
                                    const Icon(
                                      Icons.date_range,
                                      size: 35,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Text(
                                        _model.toDatePicked == null
                                            ? 'To Date'
                                            : formatDate(
                                            _model.toDatePicked ??
                                                DateTime.now()),
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .labelLarge
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color: _model.toDatePicked != null
                                              ? FlutterFlowTheme
                                              .of(context)
                                              .beyondBlueColor
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],),
                                ),
                              ),
                            ],),
                          InkWell(
                            onTap: () async {
                              CostModelStruct cost =
                              _model.allCostsList.firstWhere(
                                      (element) =>
                                  element
                                      .isUpdated ==
                                      true,
                                  orElse: () =>
                                      CostModelStruct(
                                          isUpdated:
                                          false));
                              if (cost.isUpdated) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: const Text(
                                          'Discard Updated Value'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(
                                                  alertDialogContext),
                                          child: const Text('Ok'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(
                                                  alertDialogContext),
                                          child: const Text('Cancel'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                _model.apiResulttbe =
                                await GetAllCostsApiCall.call(
                                  token: FFAppState().tokenModelAppState.token,
                                  fromDate: _model.fromDatePicked,
                                  toDate: _model.toDatePicked,
                                );
                                if ((_model.apiResulttbe?.succeeded ?? true)) {
                                  setState(() {
                                    _model.allCostsList = (getJsonField(
                                      (_model.apiResulttbe?.jsonBody ?? ''),
                                      r'''$.data''',
                                      true,
                                    )!
                                        .toList()
                                        .map<CostModelStruct?>(
                                        CostModelStruct.maybeFromMap)
                                        .toList() as Iterable<CostModelStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<CostModelStruct>();
                                  });
                                }
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Apply Filter',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .labelLarge
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    color: (_model.fromDatePicked != null &&
                                        _model.toDatePicked != null)
                                        ? FlutterFlowTheme
                                        .of(context)
                                        .beyondBlueColor
                                        : Color(0xFF868788),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      15.0, 15.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final localCostList =
                      _model.allCostsList.map((e) => e).toList().toList();
                      return DataTable2(
                        columns: [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '71093bt5' /* Item */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Creator',
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ly1zu7bn' /* Category */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '4qtx9pn2' /* Cost per Unit (JOD) */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'uag90mi3' /* Unit */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'zdb85tbu' /* Duration */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'nqugrs9i' /* Duration Unit */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ge0cegel' /* Note */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'admi' /* admi */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'adminstatus' /* adminstatus */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'adminInvoice' /* adminInvoice */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'Actual Billed Amount',
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gm' /* gmNote */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gmStatus' /* gmStatus */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gmInvoice' /* gmInvoice */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'date' /* date */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'control' /* control */,
                                ),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .labelLarge
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme
                                      .of(context)
                                      .info,
                                ),
                              ),
                            ),
                          ),
                        ],
                        rows: localCostList
                            .mapIndexed((localCostListIndex,
                            localCostListItem) =>
                            [
                              Text(
                                localCostListItem.title,
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              Text(
                                localCostListItem.creator,
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),

                              Text(
                                localCostListItem.category,
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              Text(
                                localCostListItem.unitCost.toString(),
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              Text(
                                localCostListItem.unit,
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              Text(
                                localCostListItem.duration.toString(),
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              Text(
                                localCostListItem.durationUnit,
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              Text(
                                localCostListItem.notes,
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              FFAppState().userModelAppState.accessRole == 5
                                  ? Stack(
                                children: [
                                  Visibility(
                                    visible:
                                    localCostListItem.isUpdated ==
                                        false &&
                                        FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            5,
                                    child: Text(
                                      localCostListItem
                                          .adminApprovalNotes,
                                      style:
                                      FlutterFlowTheme
                                          .of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Visibility(
                                    visible: FFAppState()
                                        .userModelAppState
                                        .accessRole ==
                                        5 &&
                                        localCostListItem.isUpdated ==
                                            true,
                                    child: Padding(
                                      padding:
                                      const EdgeInsetsDirectional
                                          .fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                        MediaQuery
                                            .sizeOf(context)
                                            .width <
                                            400.0
                                            ? 140.0
                                            : 500.0,
                                        decoration:
                                        const BoxDecoration(),
                                        child: TextFormField(
                                          controller: _model
                                              .textControllerAdminNote,
                                          focusNode: _model
                                              .textFieldFocusNodeAdminNote,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                            FFLocalizations.of(
                                                context)
                                                .getText(
                                              'admi' /* Title here... */,
                                            ),
                                            labelStyle:
                                            FlutterFlowTheme
                                                .of(
                                                context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme
                                                .of(
                                                context)
                                                .labelMedium,
                                            enabledBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(0.0),
                                            ),
                                            focusedBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .beyondBlueColor,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(0.0),
                                            ),
                                            errorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(0.0),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(0.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme
                                              .of(
                                              context)
                                              .bodyMedium,
                                          validator: _model
                                              .textController1ValidatorAdminNote
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  : Text(
                                localCostListItem.adminApprovalNotes,
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              FFAppState().userModelAppState.accessRole == 5
                                  ? Stack(
                                children: [
                                  Visibility(
                                    visible:
                                    localCostListItem.isUpdated ==
                                        false &&
                                        FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            5,
                                    child: Text(
                                      functions.getCostStatusName(
                                          FFLocalizations
                                              .of(context)
                                              .languageCode,
                                          localCostListItem
                                              .adminCostStatus),
                                      style:
                                      FlutterFlowTheme
                                          .of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                    localCostListItem.isUpdated ==
                                        true &&
                                        FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            5,
                                    child: Container(
                                      width: 310.0,
                                      decoration:
                                      const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize:
                                        MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0,
                                                  0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration:
                                                const BoxDecoration(),
                                                child:
                                                AllCostDropComponentWidget(
                                                  key: Key(
                                                      'Key8rm_${localCostListItem}_of_${localCostList
                                                          .length}'),
                                                  parameter1: functions
                                                      .getCostStatusName(
                                                      FFLocalizations
                                                          .of(
                                                          context)
                                                          .languageCode,
                                                      FFAppState()
                                                          .userModelAppState
                                                          .accessRole ==
                                                          5
                                                          ? localCostListItem
                                                          .adminCostStatus
                                                          : localCostListItem
                                                          .costStatus),
                                                  costId:
                                                  localCostListItem
                                                      .id,
                                                  action:
                                                      (value) async {
                                                    if (FFAppState()
                                                        .userModelAppState
                                                        .accessRole ==
                                                        5) {
                                                      _model.costModelStruct
                                                          .adminCostStatus =
                                                          functions
                                                              .getCostStatusId(
                                                              FFLocalizations
                                                                  .of(context)
                                                                  .languageCode,
                                                              value);
                                                    } else {
                                                      _model.costModelStruct
                                                          .costStatus =
                                                          functions
                                                              .getCostStatusId(
                                                              FFLocalizations
                                                                  .of(context)
                                                                  .languageCode,
                                                              value);
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                                  : Text(
                                functions.getCostStatusName(
                                    FFLocalizations
                                        .of(context)
                                        .languageCode,
                                    localCostListItem
                                        .adminCostStatus),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              InkWell(
                                onTap: () async {
                                  if (localCostListItem.isUpdated) {
                                    final selectedMedia = await selectMedia(
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() =>
                                      _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles =
                                            selectedMedia
                                                .map((m) =>
                                                FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions
                                                      ?.height,
                                                  width: m.dimensions
                                                      ?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                                .toList();
                                      } finally {
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }
                                    _model.outUpload =
                                    await UploadFileCall.call(
                                      token: FFAppState()
                                          .tokenModelAppState
                                          .token,
                                      file: _model.uploadedLocalFile,
                                    );
                                    if ((_model.outUpload?.succeeded ??
                                        true)) {
                                      setState(() {
                                        FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            1
                                            ? _model.costModelStruct
                                            .adminAttachmentUrl =
                                            getJsonField(
                                              (_model.outUpload
                                                  ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                            ).toString()
                                            : _model.costModelStruct
                                            .adminAttachmentUrl =
                                            getJsonField(
                                              (_model.outUpload
                                                  ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                            ).toString();
                                      });
                                      setState(() {});
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Error'),
                                            content: Text((_model
                                                .outUpload?.bodyText ??
                                                '')),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(
                                                        alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                    setState(() {});
                                  } else if (localCostListItem
                                      .adminAttachmentUrl !=
                                      'null' &&
                                      localCostListItem
                                          .adminAttachmentUrl.isNotEmpty) {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor:
                                          Colors.transparent,
                                          alignment:
                                          const AlignmentDirectional(
                                              0.0, 0.0)
                                              .resolve(
                                              Directionality.of(
                                                  context)),
                                          child: Material(
                                            child: GestureDetector(
                                              onTap: () =>
                                              _model
                                                  .unfocusNode
                                                  .canRequestFocus
                                                  ? FocusScope.of(context)
                                                  .requestFocus(_model
                                                  .unfocusNode)
                                                  : FocusScope.of(context)
                                                  .unfocus(),
                                              child: SizedBox(
                                                height: 500.0,
                                                width: 500.0,
                                                child: ViewComponentWidget(
                                                  imagePath: (getPath(
                                                      localCostListItem
                                                          .adminAttachmentUrl)
                                                      ?.contains(
                                                      'pdf') ??
                                                      true)
                                                      ? null
                                                      : getPath(
                                                      localCostListItem
                                                          .adminAttachmentUrl),
                                                  filePath: (getPath(
                                                      localCostListItem
                                                          .adminAttachmentUrl)
                                                      ?.contains(
                                                      'pdf') ??
                                                      false)
                                                      ? null
                                                      : getPath(
                                                      localCostListItem
                                                          .adminAttachmentUrl),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  }
                                },
                                child: FFAppState()
                                    .userModelAppState
                                    .accessRole ==
                                    5
                                    ? Container(
                                  child: localCostListItem.isUpdated
                                      ? Icon(
                                    Icons.upload_file_rounded,
                                    color: _model.costModelStruct
                                        .adminAttachmentUrl ==
                                        'null' ||
                                        _model
                                            .costModelStruct
                                            .adminAttachmentUrl
                                            .isEmpty
                                        ? FlutterFlowTheme
                                        .of(
                                        context)
                                        .secondaryText
                                        : Colors.green,
                                    size: 24.0,
                                  )
                                      : Icon(
                                    Icons.video_library,
                                    color: localCostListItem
                                        .adminAttachmentUrl ==
                                        'null' ||
                                        localCostListItem
                                            .adminAttachmentUrl
                                            .isEmpty
                                        ? FlutterFlowTheme
                                        .of(
                                        context)
                                        .secondaryText
                                        : Colors.green,
                                    size: 24.0,
                                  ),
                                )
                                    : Icon(
                                  Icons.video_library,
                                  color: localCostListItem
                                      .adminAttachmentUrl ==
                                      'null' ||
                                      localCostListItem
                                          .adminAttachmentUrl
                                          .isEmpty
                                      ? FlutterFlowTheme
                                      .of(context)
                                      .secondaryText
                                      : Colors.green,
                                  size: 24.0,
                                ),
                              ),
                              Stack(
                                children: [
                                  Visibility(
                                    visible: localCostListItem.isUpdated ==
                                        false,
                                    child: Text(
                                      localCostListItem.actualBilledAmount
                                          .toString(),
                                      style: FlutterFlowTheme
                                          .of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                    localCostListItem.isUpdated == true,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional
                                          .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: MediaQuery
                                            .sizeOf(context)
                                            .width <
                                            400.0
                                            ? 140.0
                                            : 500.0,
                                        decoration: const BoxDecoration(),
                                        child: TextFormField(
                                          controller: _model
                                              .textControllerActualBilledAmount,
                                          focusNode: _model
                                              .textFieldFocusNodeActualBilledAmount,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                            FlutterFlowTheme
                                                .of(context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme
                                                .of(context)
                                                .labelMedium,
                                            enabledBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  0.0),
                                            ),
                                            focusedBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .beyondBlueColor,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  0.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  0.0),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  0.0),
                                            ),
                                          ),
                                          style:
                                          FlutterFlowTheme
                                              .of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .textController1ValidatorActualBilledAmount
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              FFAppState().userModelAppState.accessRole == 1
                                  ? Stack(
                                children: [
                                  Visibility(
                                    visible:
                                    localCostListItem.isUpdated ==
                                        false &&
                                        FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            1,
                                    child: Text(
                                      localCostListItem.approvalNotes,
                                      style:
                                      FlutterFlowTheme
                                          .of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Visibility(
                                    visible: FFAppState()
                                        .userModelAppState
                                        .accessRole ==
                                        1 &&
                                        localCostListItem.isUpdated ==
                                            true,
                                    child: Padding(
                                      padding:
                                      const EdgeInsetsDirectional
                                          .fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                        MediaQuery
                                            .sizeOf(context)
                                            .width <
                                            400.0
                                            ? 140.0
                                            : 500.0,
                                        decoration:
                                        const BoxDecoration(),
                                        child: TextFormField(
                                          controller: _model
                                              .textControllerNote,
                                          focusNode: _model
                                              .textFieldFocusNodeNote,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                            FFLocalizations.of(
                                                context)
                                                .getText(
                                              'gm' /* Title here... */,
                                            ),
                                            labelStyle:
                                            FlutterFlowTheme
                                                .of(
                                                context)
                                                .labelMedium,
                                            hintStyle:
                                            FlutterFlowTheme
                                                .of(
                                                context)
                                                .labelMedium,
                                            enabledBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(0.0),
                                            ),
                                            focusedBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .beyondBlueColor,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(0.0),
                                            ),
                                            errorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(0.0),
                                            ),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: FlutterFlowTheme
                                                    .of(context)
                                                    .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                              BorderRadius
                                                  .circular(0.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme
                                              .of(
                                              context)
                                              .bodyMedium,
                                          validator: _model
                                              .textController1ValidatorNote
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  : Text(
                                localCostListItem.approvalNotes,
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              FFAppState().userModelAppState.accessRole == 1
                                  ? Stack(
                                children: [
                                  Visibility(
                                    visible:
                                    localCostListItem.isUpdated ==
                                        false &&
                                        FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            1,
                                    child: Text(
                                      functions.getCostStatusName(
                                          FFLocalizations
                                              .of(context)
                                              .languageCode,
                                          localCostListItem
                                              .costStatus),
                                      style:
                                      FlutterFlowTheme
                                          .of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                    localCostListItem.isUpdated ==
                                        true &&
                                        FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            1,
                                    child: Container(
                                      width: 310.0,
                                      decoration:
                                      const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize:
                                        MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0,
                                                  0.0, 0.0, 0.0),
                                              child: Container(
                                                decoration:
                                                const BoxDecoration(),
                                                child:
                                                AllCostDropComponentWidget(
                                                  key: Key(
                                                      'Key8rm_${localCostListItem}_of_${localCostList
                                                          .length}'),
                                                  parameter1: functions
                                                      .getCostStatusName(
                                                      FFLocalizations
                                                          .of(
                                                          context)
                                                          .languageCode,
                                                      FFAppState()
                                                          .userModelAppState
                                                          .accessRole ==
                                                          5
                                                          ? localCostListItem
                                                          .adminCostStatus
                                                          : localCostListItem
                                                          .costStatus),
                                                  costId:
                                                  localCostListItem
                                                      .id,
                                                  action:
                                                      (value) async {
                                                    if (FFAppState()
                                                        .userModelAppState
                                                        .accessRole ==
                                                        5) {
                                                      _model.costModelStruct
                                                          .adminCostStatus =
                                                          functions
                                                              .getCostStatusId(
                                                              FFLocalizations
                                                                  .of(context)
                                                                  .languageCode,
                                                              value);
                                                    } else {
                                                      _model.costModelStruct
                                                          .costStatus =
                                                          functions
                                                              .getCostStatusId(
                                                              FFLocalizations
                                                                  .of(context)
                                                                  .languageCode,
                                                              value);
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                                  : Text(
                                functions.getCostStatusName(
                                    FFLocalizations
                                        .of(context)
                                        .languageCode,
                                    localCostListItem.costStatus),
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),

                              InkWell(
                                onTap: () async {
                                  if (localCostListItem.isUpdated) {
                                    final selectedMedia = await selectMedia(
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() =>
                                      _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                      try {
                                        selectedUploadedFiles =
                                            selectedMedia
                                                .map((m) =>
                                                FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions
                                                      ?.height,
                                                  width: m.dimensions
                                                      ?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                                .toList();
                                      } finally {
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }
                                    _model.outUpload =
                                    await UploadFileCall.call(
                                      token: FFAppState()
                                          .tokenModelAppState
                                          .token,
                                      file: _model.uploadedLocalFile,
                                    );
                                    if ((_model.outUpload?.succeeded ??
                                        true)) {
                                      setState(() {
                                        FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            1
                                            ? _model.costModelStruct
                                            .attachmentUrl =
                                            getJsonField(
                                              (_model.outUpload
                                                  ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                            ).toString()
                                            : _model.costModelStruct
                                            .attachmentUrl =
                                            getJsonField(
                                              (_model.outUpload
                                                  ?.jsonBody ??
                                                  ''),
                                              r'''$.data''',
                                            ).toString();
                                      });
                                      setState(() {});
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Error'),
                                            content: Text((_model
                                                .outUpload?.bodyText ??
                                                '')),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(
                                                        alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  } else if (localCostListItem
                                      .attachmentUrl !=
                                      'null' &&
                                      localCostListItem
                                          .attachmentUrl.isNotEmpty) {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor:
                                            Colors.transparent,
                                            alignment:
                                            const AlignmentDirectional(
                                                0.0, 0.0)
                                                .resolve(
                                                Directionality.of(
                                                    context)),
                                            child: Material(
                                              child: GestureDetector(
                                                onTap: () =>
                                                _model
                                                    .unfocusNode
                                                    .canRequestFocus
                                                    ? FocusScope.of(context)
                                                    .requestFocus(_model
                                                    .unfocusNode)
                                                    : FocusScope.of(context)
                                                    .unfocus(),
                                                child: SizedBox(
                                                  height: 500.0,
                                                  width: 500.0,
                                                  child:
                                                  ViewComponentWidget(
                                                    imagePath: (getPath(
                                                        localCostListItem
                                                            .attachmentUrl)
                                                        ?.contains(
                                                        'pdf') ??
                                                        true)
                                                        ? null
                                                        : getPath(
                                                        localCostListItem
                                                            .attachmentUrl),
                                                    filePath: (getPath(
                                                        localCostListItem
                                                            .attachmentUrl)
                                                        ?.contains(
                                                        'pdf') ??
                                                        false)
                                                        ? null
                                                        : getPath(
                                                        localCostListItem
                                                            .attachmentUrl),
                                                  ),
                                                ),
                                              ),
                                            ));
                                      },
                                    ).then((value) => setState(() {}));
                                  }
                                },
                                child: FFAppState()
                                    .userModelAppState
                                    .accessRole ==
                                    1
                                    ? Container(
                                  child: localCostListItem.isUpdated
                                      ? Icon(
                                    Icons.upload_file_rounded,
                                    color: _model.costModelStruct
                                        .attachmentUrl ==
                                        'null' ||
                                        _model
                                            .costModelStruct
                                            .attachmentUrl
                                            .isEmpty
                                        ? FlutterFlowTheme
                                        .of(
                                        context)
                                        .secondaryText
                                        : Colors.green,
                                    size: 24.0,
                                  )
                                      : Icon(
                                    Icons.video_library,
                                    color: localCostListItem
                                        .attachmentUrl ==
                                        'null' ||
                                        localCostListItem
                                            .attachmentUrl.isEmpty
                                        ? FlutterFlowTheme
                                        .of(
                                        context)
                                        .secondaryText
                                        : Colors.green,
                                    size: 24.0,
                                  ),
                                )
                                    : Icon(
                                  Icons.video_library,
                                  color: localCostListItem
                                      .attachmentUrl ==
                                      'null' ||
                                      localCostListItem
                                          .attachmentUrl.isEmpty
                                      ? FlutterFlowTheme
                                      .of(context)
                                      .secondaryText
                                      : Colors.green,
                                  size: 24.0,
                                ),
                              ),
                              Text(
                                convertDateString(localCostListItem.date),
                                style:
                                FlutterFlowTheme
                                    .of(context)
                                    .bodyMedium,
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional
                                        .fromSTEB(0.0, 11.0, 0.0, 11.0),
                                    child:
                                    localCostListItem.isUpdated == false
                                        ? InkWell(
                                      onTap: () async {
                                        CostModelStruct cost =
                                        localCostList.firstWhere(
                                                (element) =>
                                            element
                                                .isUpdated ==
                                                true,
                                            orElse: () =>
                                                CostModelStruct(
                                                    isUpdated:
                                                    false));
                                        if (FFAppState()
                                            .userModelAppState
                                            .accessRole ==
                                            5) {
                                          _model.textControllerAdminNote
                                              ?.text =
                                              localCostListItem
                                                  .adminApprovalNotes;
                                          _model
                                              .textControllerActualBilledAmount
                                              ?.text =
                                              localCostListItem
                                                  .actualBilledAmount
                                                  .toString();
                                        } else {
                                          _model.textControllerNote
                                              ?.text =
                                              localCostListItem
                                                  .approvalNotes;
                                          _model
                                              .textControllerActualBilledAmount
                                              ?.text =
                                              localCostListItem
                                                  .actualBilledAmount
                                                  .toString();
                                        }
                                        if (cost.isUpdated ==
                                            true) {
                                          await showDialog(
                                            context: context,
                                            builder:
                                                (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    FFLocalizations.of(
                                                        context)
                                                        .getVariableText(
                                                      enText: 'Alert',
                                                      arText: 'تنبيه',
                                                    )),
                                                content: const Text(
                                                    'Are you sure you want to cancel last opration'),
                                                actions: [
                                                  TextButton(
                                                    onPressed:
                                                        () {
                                                      setState(
                                                              () {
                                                            localCostList
                                                                .map((e) =>
                                                            e.isUpdated = false)
                                                                .toList();
                                                            localCostListItem
                                                                .isUpdated =
                                                            true;
                                                            clear();
                                                          });
                                                      Navigator.pop(
                                                          alertDialogContext);
                                                    },
                                                    child: Text(
                                                        FFLocalizations.of(
                                                            context)
                                                            .getVariableText(
                                                          enText:
                                                          'Ok',
                                                          arText:
                                                          'حسنا',
                                                        )),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text(
                                                        FFLocalizations.of(
                                                            context)
                                                            .getVariableText(
                                                          enText:
                                                          'Cancel',
                                                          arText:
                                                          'الغاء',
                                                        )),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          return;
                                        } else {
                                          setState(() {
                                            localCostList
                                                .map((e) =>
                                            e.isUpdated =
                                            false)
                                                .toList();
                                            localCostListItem
                                                .isUpdated = true;
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.edit_note,
                                        color:
                                        FlutterFlowTheme
                                            .of(
                                            context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                    )
                                        : Row(
                                      children: [
                                        InkWell(
                                          //checkout
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder:
                                                  (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getVariableText(
                                                        enText:
                                                        'Alert',
                                                        arText:
                                                        'تنبيه',
                                                      )),
                                                  content: const Text(
                                                      'Are you sure you want to submit this operation'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed:
                                                          () async {
                                                        if (FFAppState()
                                                            .userModelAppState
                                                            .accessRole ==
                                                            5) {
                                                          _model.apiResultz7xm =
                                                          await UpdateAdminCostStatusApiCall
                                                              .call(
                                                              costId: localCostListItem
                                                                  .id,
                                                              isApproved: _model
                                                                  .costModelStruct
                                                                  .adminCostStatus ==
                                                                  1,
                                                              token: FFAppState()
                                                                  .tokenModelAppState
                                                                  .token,
                                                              notes: _model
                                                                  .textControllerAdminNote
                                                                  .text,
                                                              attachmentUrl: _model
                                                                  .costModelStruct
                                                                  .adminAttachmentUrl
                                                                  .isEmpty
                                                                  ? localCostListItem
                                                                  .adminAttachmentUrl
                                                                  : _model
                                                                  .costModelStruct
                                                                  .adminAttachmentUrl,
                                                              actualBilledAmount: double
                                                                  .tryParse(
                                                                  _model
                                                                      .textControllerActualBilledAmount
                                                                      .text)

                                                          );
                                                          if ((_model
                                                              .apiResultz7xm
                                                              ?.jsonBody['succeeded']) ==
                                                              true) {
                                                            clear();
                                                            _model
                                                                .apiResulttbe =
                                                            await GetAllCostsApiCall
                                                                .call(
                                                              token:
                                                              FFAppState()
                                                                  .tokenModelAppState
                                                                  .token,
                                                              fromDate: _model
                                                                  .fromDatePicked,
                                                              toDate: _model
                                                                  .toDatePicked,
                                                            );
                                                            if ((_model
                                                                .apiResulttbe
                                                                ?.succeeded ??
                                                                true)) {
                                                              setState(() {
                                                                _model
                                                                    .allCostsList =
                                                                    (getJsonField(
                                                                      (_model
                                                                          .apiResulttbe
                                                                          ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data''',
                                                                      true,
                                                                    )!
                                                                        .toList()
                                                                        .map<
                                                                        CostModelStruct?>(
                                                                        CostModelStruct
                                                                            .maybeFromMap)
                                                                        .toList() as Iterable<
                                                                        CostModelStruct?>)
                                                                        .withoutNulls
                                                                        .toList()
                                                                        .cast<
                                                                        CostModelStruct>();
                                                                // if (_model
                                                                //     .datePicked !=
                                                                //     null) {
                                                                //   //filter
                                                                //   if (_model
                                                                //       .savedAllCostsList
                                                                //       .isEmpty) {
                                                                //     _model
                                                                //         .savedAllCostsList =
                                                                //         _model
                                                                //             .allCostsList;
                                                                //   } else {
                                                                //     _model
                                                                //         .allCostsList =
                                                                //         _model
                                                                //             .savedAllCostsList;
                                                                //   }
                                                                //   _model
                                                                //       .allCostsList =
                                                                //       _model
                                                                //           .allCostsList
                                                                //           .where((
                                                                //           element) =>
                                                                //       convertDateString(
                                                                //           element
                                                                //               .date) ==
                                                                //           formatDate(
                                                                //               _model
                                                                //                   .datePicked ??
                                                                //                   DateTime
                                                                //                       .now()))
                                                                //           .toList();
                                                                // }
                                                                ScaffoldMessenger
                                                                    .of(context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content: Text(
                                                                      FFLocalizations
                                                                          .of(
                                                                          context)
                                                                          .getVariableText(
                                                                        enText: 'Updated Successfully',
                                                                        arText: 'تم التعديل بنجاح',
                                                                      ),
                                                                      style: TextStyle(
                                                                        color: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds: 4000),
                                                                    backgroundColor: Color(
                                                                        0xFF000000),
                                                                  ),
                                                                );
                                                              });
                                                              Navigator.pop(
                                                                  alertDialogContext);
                                                            }
                                                            setState(
                                                                    () {});
                                                          } else {
                                                            await showDialog(
                                                              context:
                                                              context,
                                                              builder:
                                                                  (
                                                                  alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      FFLocalizations
                                                                          .of(
                                                                          context)
                                                                          .getVariableText(
                                                                        enText: 'Error',
                                                                        arText: 'مشكله',
                                                                      )),
                                                                  content: Text(
                                                                      (_model
                                                                          .apiResultz7xm
                                                                          ?.bodyText ??
                                                                          '')),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () =>
                                                                          Navigator
                                                                              .pop(
                                                                              alertDialogContext),
                                                                      child: Text(
                                                                          FFLocalizations
                                                                              .of(
                                                                              context)
                                                                              .getVariableText(
                                                                            enText: 'Ok',
                                                                            arText: 'حسنا',
                                                                          )),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        } else {
                                                          _model.apiResultz7xm =
                                                          await UpdateCostStatusApiCall
                                                              .call(
                                                              costId: localCostListItem
                                                                  .id,
                                                              isApproved: _model
                                                                  .costModelStruct
                                                                  .costStatus ==
                                                                  1,
                                                              token: FFAppState()
                                                                  .tokenModelAppState
                                                                  .token,
                                                              notes: _model
                                                                  .textControllerNote
                                                                  .text,
                                                              attachmentUrl: _model
                                                                  .costModelStruct
                                                                  .attachmentUrl
                                                                  .isEmpty
                                                                  ? localCostListItem
                                                                  .attachmentUrl
                                                                  : _model
                                                                  .costModelStruct
                                                                  .attachmentUrl,
                                                              actualBilledAmount: double
                                                                  .tryParse(
                                                                  _model
                                                                      .textControllerActualBilledAmount
                                                                      .text)
                                                          );
                                                          if ((_model
                                                              .apiResultz7xm
                                                              ?.jsonBody['succeeded']) ==
                                                              true) {
                                                            clear();
                                                            _model
                                                                .apiResulttbe =
                                                            await GetAllCostsApiCall
                                                                .call(
                                                              token:
                                                              FFAppState()
                                                                  .tokenModelAppState
                                                                  .token,
                                                              fromDate: _model
                                                                  .fromDatePicked,
                                                              toDate: _model
                                                                  .toDatePicked,
                                                            );
                                                            if ((_model
                                                                .apiResulttbe
                                                                ?.succeeded ??
                                                                true)) {
                                                              setState(() {
                                                                _model
                                                                    .allCostsList =
                                                                    (getJsonField(
                                                                      (_model
                                                                          .apiResulttbe
                                                                          ?.jsonBody ??
                                                                          ''),
                                                                      r'''$.data''',
                                                                      true,
                                                                    )!
                                                                        .toList()
                                                                        .map<
                                                                        CostModelStruct?>(
                                                                        CostModelStruct
                                                                            .maybeFromMap)
                                                                        .toList() as Iterable<
                                                                        CostModelStruct?>)
                                                                        .withoutNulls
                                                                        .toList()
                                                                        .cast<
                                                                        CostModelStruct>();

                                                                // if (_model
                                                                //     .datePicked !=
                                                                //     null) {
                                                                //   //filter
                                                                //   if (_model
                                                                //       .savedAllCostsList
                                                                //       .isEmpty) {
                                                                //     _model
                                                                //         .savedAllCostsList =
                                                                //         _model
                                                                //             .allCostsList;
                                                                //   } else {
                                                                //     _model
                                                                //         .allCostsList =
                                                                //         _model
                                                                //             .savedAllCostsList;
                                                                //   }
                                                                //   _model
                                                                //       .allCostsList =
                                                                //       _model
                                                                //           .allCostsList
                                                                //           .where((
                                                                //           element) =>
                                                                //       convertDateString(
                                                                //           element
                                                                //               .date) ==
                                                                //           formatDate(
                                                                //               _model
                                                                //                   .datePicked ??
                                                                //                   DateTime
                                                                //                       .now()))
                                                                //           .toList();
                                                                // }
                                                                ScaffoldMessenger
                                                                    .of(context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content: Text(
                                                                      FFLocalizations
                                                                          .of(
                                                                          context)
                                                                          .getVariableText(
                                                                        enText: 'Updated Successfully',
                                                                        arText: 'تم التعديل بنجاح',
                                                                      ),
                                                                      style: TextStyle(
                                                                        color: FlutterFlowTheme
                                                                            .of(
                                                                            context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds: 4000),
                                                                    backgroundColor: Color(
                                                                        0xFF000000),
                                                                  ),
                                                                );
                                                              });
                                                              Navigator.pop(
                                                                  alertDialogContext);
                                                            }
                                                            setState(
                                                                    () {});
                                                          } else {
                                                            await showDialog(
                                                              context:
                                                              context,
                                                              builder:
                                                                  (
                                                                  alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      FFLocalizations
                                                                          .of(
                                                                          context)
                                                                          .getVariableText(
                                                                        enText: 'Error',
                                                                        arText: 'مشكله',
                                                                      )),
                                                                  content: Text(
                                                                      (_model
                                                                          .apiResultz7xm
                                                                          ?.bodyText ??
                                                                          '')),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () =>
                                                                          Navigator
                                                                              .pop(
                                                                              alertDialogContext),
                                                                      child: Text(
                                                                          FFLocalizations
                                                                              .of(
                                                                              context)
                                                                              .getVariableText(
                                                                            enText: 'Ok',
                                                                            arText: 'حسنا',
                                                                          )),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }
                                                        }
                                                      },
                                                      child: Text(
                                                          FFLocalizations.of(
                                                              context)
                                                              .getVariableText(
                                                            enText:
                                                            'Ok',
                                                            arText:
                                                            'حسنا',
                                                          )),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text(
                                                          FFLocalizations.of(
                                                              context)
                                                              .getVariableText(
                                                            enText:
                                                            'Cancel',
                                                            arText:
                                                            'كلا',
                                                          )),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.save,
                                            color: Colors.green,
                                            size: 24.0,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder:
                                                  (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      FFLocalizations.of(
                                                          context)
                                                          .getVariableText(
                                                        enText:
                                                        'Alert',
                                                        arText:
                                                        'تنبيه',
                                                      )),
                                                  content: const Text(
                                                      'Are you sure you want to cancel this operation'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed:
                                                          () {
                                                        setState(
                                                                () {
                                                              localCostList
                                                                  .map((e) =>
                                                              e.isUpdated =
                                                              false)
                                                                  .toList();
                                                              localCostListItem
                                                                  .isUpdated =
                                                              false;
                                                              clear();
                                                            });
                                                        Navigator.pop(
                                                            alertDialogContext);
                                                      },
                                                      child: Text(
                                                          FFLocalizations.of(
                                                              context)
                                                              .getVariableText(
                                                            enText:
                                                            'Ok',
                                                            arText:
                                                            'حسنا',
                                                          )),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text(
                                                          FFLocalizations.of(
                                                              context)
                                                              .getVariableText(
                                                            enText:
                                                            'Cancel',
                                                            arText:
                                                            'كلا',
                                                          )),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(
                                                10.0,
                                                0.0,
                                                10.0,
                                                0.0),
                                            child: Icon(
                                              Icons
                                                  .cancel_outlined,
                                              color: Colors.red,
                                              size: 24.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ].map((c) => DataCell(c)).toList())
                            .map((e) => DataRow(cells: e))
                            .toList(),
                        headingRowColor: MaterialStateProperty.all(
                          const Color(0xFF4D4D4D),
                        ),
                        headingRowHeight: 56.0,
                        dataRowColor: MaterialStateProperty.all(
                          FlutterFlowTheme
                              .of(context)
                              .secondaryBackground,
                        ),
                        dataRowHeight: 56.0,
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        dividerThickness: 1.0,
                        columnSpacing: 1.0,
                        showBottomBorder: true,
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
    );
  }

  void clear() {
    _model.costModelStruct.attachmentUrl = "";
    _model.costModelStruct.adminAttachmentUrl = "";
    _model.costModelStruct.adminCostStatus = 0;
    _model.costModelStruct.costStatus = 0;
    _model.costModelStruct.approvalNotes = '';
    _model.costModelStruct.adminApprovalNotes = '';
    _model.textControllerNote?.clear();
    _model.textControllerAdminNote?.clear();
    _model.textControllerActualBilledAmount?.clear();
  }

  String convertDateString(String dateString) {
    // Parse the input string
    DateTime dateTime = DateTime.parse(dateString);

    // Format the date
    String formattedDate =
        "${dateTime.year}/${_addLeadingZero(dateTime.month)}/${_addLeadingZero(
        dateTime.day)}";

    return formattedDate;
  }

  String _addLeadingZero(int number) {
    // Add leading zero if number is less than 10
    return number.toString().padLeft(2, '0');
  }

  String formatDate(DateTime dateTime) {
    // Define the date format
    final formatter = DateFormat('yyyy/MM/dd');

    // Format the DateTime object
    final formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  String? getPath(String url) {
    if (url.isNotEmpty) {
      return "https://api.beyond.matterhr.com/${url}";
    } else {
      return null;
    }
  }
}
