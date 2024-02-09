import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'home_page_see_all_model.dart';
export 'home_page_see_all_model.dart';

class HomePageSeeAllWidget extends StatefulWidget {
  const HomePageSeeAllWidget({super.key});

  @override
  State<HomePageSeeAllWidget> createState() => _HomePageSeeAllWidgetState();
}

class _HomePageSeeAllWidgetState extends State<HomePageSeeAllWidget> {
  late HomePageSeeAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageSeeAllModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultbod = await GetAllProjectsApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResultbod?.succeeded ?? true)) {
        setState(() {
          _model.listOfProjects = functions
              .fromProjectJsonToModelList(getJsonField(
                (_model.apiResultbod?.jsonBody ?? ''),
                r'''$.data''',
              ))!
              .toList()
              .cast<ProjectModelStruct>();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left_sharp,
                  color: FlutterFlowTheme.of(context).info,
                  size: 25.0,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'i6acbjzx' /* Projects */,
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).info,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).beyondBlueColor,
                    width: 1.0,
                  ),
                ),
                child: Builder(
                  builder: (context) {
                    final listOfProjectsLocal =
                        _model.listOfProjects.map((e) => e).toList();
                    return DataTable2(
                      columns: [
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'i9iws4tw' /* Projects */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'qjt01qp3' /* Type of Projects */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'sl19nb58' /* Client */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'gkxp4m94' /* Original Estimate */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'qcbtalbt' /* Remaining */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'b3yvqi4n' /* Remaining(%) */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'kolof0nk' /* Lead */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                      rows: listOfProjectsLocal
                          .mapIndexed((listOfProjectsLocalIndex,
                                  listOfProjectsLocalItem) =>
                              [
                                Text(
                                  listOfProjectsLocalItem.name,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Almarai',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (listOfProjectsLocalItem.type == 1) {
                                        return const Color(0xFF008000);
                                      } else if (listOfProjectsLocalItem.type ==
                                          2) {
                                        return const Color(0xFFFFBD59);
                                      } else {
                                        return const Color(0xFFEA0202);
                                      }
                                    }(),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 15.0, 15.0),
                                    child: Text(
                                      () {
                                        if (listOfProjectsLocalItem.type == 1) {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'C',
                                            arText: 'سي',
                                          );
                                        } else if (listOfProjectsLocalItem
                                                .type ==
                                            2) {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'B',
                                            arText: 'بي',
                                          );
                                        } else {
                                          return FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: 'A',
                                            arText: 'أ',
                                          );
                                        }
                                      }(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Almarai',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Text(
                                  listOfProjectsLocalItem.client,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  functions.fromStartEndToConcat(
                                      listOfProjectsLocalItem.startDate,
                                      listOfProjectsLocalItem.endDate),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  functions.fromStartEndToConcatCurrentDate(
                                      listOfProjectsLocalItem.startDate,
                                      listOfProjectsLocalItem.endDate),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: custom_widgets
                                              .CircularProgressParCustomSmallWidget(
                                            width: 50.0,
                                            height: 50.0,
                                            progress: functions
                                                .calculateRemainingPercentage(
                                                    listOfProjectsLocalItem
                                                        .startDate,
                                                    listOfProjectsLocalItem
                                                        .endDate)
                                                .toDouble(),
                                            color: () {
                                              if (listOfProjectsLocalItem
                                                      .type ==
                                                  1) {
                                                return const Color(0xFF008000);
                                              } else if (listOfProjectsLocalItem
                                                      .type ==
                                                  2) {
                                                return const Color(0xFFFFBD59);
                                              } else {
                                                return const Color(0xFFEA0202);
                                              }
                                            }(),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '${functions.calculateRemainingPercentage(listOfProjectsLocalItem.startDate, listOfProjectsLocalItem.endDate).toString()}%',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Image.network(
                                            functions.getFullImage(
                                                listOfProjectsLocalItem
                                                    .seniorPicture)!,
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Text(
                                        listOfProjectsLocalItem.senior,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ].map((c) => DataCell(c)).toList())
                          .map((e) => DataRow(cells: e))
                          .toList(),
                      headingRowColor: MaterialStateProperty.all(
                        const Color(0xFF4D4D4D),
                      ),
                      headingRowHeight: 56.0,
                      dataRowColor: MaterialStateProperty.all(
                        FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      dataRowHeight: 56.0,
                      border: const TableBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      dividerThickness: 2.0,
                      showBottomBorder: true,
                      minWidth: 49.0,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
