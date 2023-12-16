import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/cost_drop_component/cost_drop_component_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'cost_management_model.dart';
export 'cost_management_model.dart';

class CostManagementWidget extends StatefulWidget {
  const CostManagementWidget({
    super.key,
    required this.projectJsonObject,
  });

  final dynamic projectJsonObject;

  @override
  _CostManagementWidgetState createState() => _CostManagementWidgetState();
}

class _CostManagementWidgetState extends State<CostManagementWidget> {
  late CostManagementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CostManagementModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.projectModel =
            widget.projectJsonObject != null && widget.projectJsonObject != ''
                ? ProjectModelStruct.fromMap(widget.projectJsonObject)
                : null;
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
        backgroundColor: Colors.white,
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
                  _model.projectModel?.name != null &&
                          _model.projectModel?.name != ''
                      ? _model.projectModel!.name
                      : ' ',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 22.0,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                  30.0, 30.0, 0.0, 20.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  's298oagd' /* Collaborators */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Almarai',
                                      fontSize: 20.0,
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
                                  30.0, 30.0, 30.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(50.0),
                                      bottomRight: Radius.circular(50.0),
                                      topLeft: Radius.circular(50.0),
                                      topRight: Radius.circular(50.0),
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/748/600',
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '8mb1rhja' /* Hello World */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Almarai',
                                                color: const Color(0xFF032734),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'as0qwxrd' /* Hello World */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Almarai',
                                                color: const Color(0xFF032734),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 60.0, 30.0, 40.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF3F3F3),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      30.0, 20.0, 30.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '9932hy4l' /* Hello World */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(30.0),
                                              bottomRight:
                                                  Radius.circular(30.0),
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0),
                                            ),
                                            child: Image.network(
                                              'https://picsum.photos/seed/829/600',
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'bcrj3eno' /* Hello World */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Almarai',
                                                  fontSize: 18.0,
                                                  useGoogleFonts: false,
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
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
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
                                    30.0, 30.0, 0.0, 20.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '16m5oc28' /* CollaboratProject Financial De... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Almarai',
                                        fontSize: 20.0,
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
                                    30.0, 60.0, 30.0, 40.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF3F3F3),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.asset(
                                            'assets/images/Group_2052.svg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 15.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'w643ruv4' /* Estimated Cost */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Almarai',
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1.0,
                                        indent: 50.0,
                                        endIndent: 50.0,
                                        color: Color(0xFF339259),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 30.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9gkubrvi' /* Hello World */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Almarai',
                                                    color: const Color(0xFFEA0202),
                                                    fontSize: 25.0,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
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
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                  30.0, 30.0, 30.0, 30.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'aoyg0qx6' /* Collaborators */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'd1sboetb' /* Collaborators */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          color: const Color(0xFF9DCD5A),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 100.0, 30.0, 100.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'x5ely4t0' /* Gross Profit */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'uywbw1tn' /* Collaborators */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          color: const Color(0xFF9DCD5A),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 30.0, 30.0, 30.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'bgiqcti4' /* Gross Profit Margin */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '18qqdvdt' /* Collaborators */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          color: const Color(0xFF9DCD5A),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
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
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final localCostList = _model.projectModel?.costs
                              .map((e) => e)
                              .toList()
                              .toList() ??
                          [];
                      return DataTable2(
                        columns: [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '71093bt5' /* Item */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
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
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
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
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
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
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
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
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
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
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
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
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'e7u4kwtt' /* Status */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
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
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    localCostListItem.category,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    localCostListItem.unitCost.toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    localCostListItem.unit,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    localCostListItem.duration.toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    localCostListItem.durationUnit,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    localCostListItem.notes,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Stack(
                                    children: [
                                      if (() {
                                        if (FFAppState()
                                                .userModelAppState
                                                .accessRole
                                                .toString() ==
                                            '3') {
                                          return true;
                                        } else if (FFAppState()
                                                .userModelAppState
                                                .accessRole
                                                .toString() ==
                                            '4') {
                                          return true;
                                        } else if (FFAppState()
                                                .userModelAppState
                                                .accessRole
                                                .toString() ==
                                            '2') {
                                          return true;
                                        } else {
                                          return false;
                                        }
                                      }())
                                        Text(
                                          functions.getCostStatusName(
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                              localCostListItem.costStatus),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      wrapWithModel(
                                        model: _model.costDropComponentModels
                                            .getModel(
                                          localCostListItem.id.toString(),
                                          localCostListIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: CostDropComponentWidget(
                                          key: Key(
                                            'Keyjrz_${localCostListItem.id.toString()}',
                                          ),
                                          parameter1:
                                              functions.getCostStatusName(
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                                  localCostListItem.costStatus),
                                          costId: localCostListItem.id,
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
}
