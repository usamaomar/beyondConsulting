import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
            ProjectModelStruct.maybeFromMap(widget.projectJsonObject);
      });
      setState(() {
        _model.listOfMemebrslocal = [];
      });
      setState(() {
        _model.listOfMemebrslocal = functions
            .addMemberItemsToList(
                _model.projectModel!.senior,
                _model.projectModel!.seniorId,
                _model.projectModel!.seniorPicture,
                _model.projectModel!.midManagers.toList(),
                _model.projectModel!.associates.toList())
            .toList()
            .cast<MemberModelStruct>();
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
              sideMenuEnum: SideMenuEnum.COST_MANAGEMENT,
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
          child: Stack(
            children: [
              if (MediaQuery.sizeOf(context).width > 450.0)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          15.0, 15.0, 15.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
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
                                        30.0, 20.0, 0.0, 0.0),
                                    child: Container(
                                      height: 100.0,
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final listOfMemebersLocal = _model
                                              .listOfMemebrslocal
                                              .map((e) => e)
                                              .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                listOfMemebersLocal.length,
                                            itemBuilder: (context,
                                                listOfMemebersLocalIndex) {
                                              final listOfMemebersLocalItem =
                                                  listOfMemebersLocal[
                                                      listOfMemebersLocalIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(50.0),
                                                      bottomRight:
                                                          Radius.circular(50.0),
                                                      topLeft:
                                                          Radius.circular(50.0),
                                                      topRight:
                                                          Radius.circular(50.0),
                                                    ),
                                                    child: Image.network(
                                                      functions.getFullImage(
                                                          listOfMemebersLocalItem
                                                              .picture)!,
                                                      width: 100.0,
                                                      height: 100.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listOfMemebersLocalItem
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Almarai',
                                                                color: const Color(
                                                                    0xFF032734),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            listOfMemebersLocalItem
                                                                .firstName,
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
                                                        ),
                                                      ],
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9932hy4l' /* Client */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(30.0),
                                                      bottomRight:
                                                          Radius.circular(30.0),
                                                      topLeft:
                                                          Radius.circular(30.0),
                                                      topRight:
                                                          Radius.circular(30.0),
                                                    ),
                                                    child: Image.network(
                                                      functions.getFullImage(_model
                                                                      .projectModel
                                                                      ?.clientLogo !=
                                                                  null &&
                                                              _model.projectModel
                                                                      ?.clientLogo !=
                                                                  ''
                                                          ? _model.projectModel!
                                                              .clientLogo
                                                          : ' ')!,
                                                      width: 40.0,
                                                      height: 40.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  _model.projectModel?.client !=
                                                              null &&
                                                          _model.projectModel
                                                                  ?.client !=
                                                              ''
                                                      ? _model
                                                          .projectModel!.client
                                                      : ' ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        textAlign: TextAlign.center,
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'w643ruv4' /* Estimated Cost */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Almarai',
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 30.0),
                                                  child: Text(
                                                    '${valueOrDefault<String>(
                                                      _model.projectModel
                                                          ?.costBudget
                                                          .toString(),
                                                      '0',
                                                    )} JOD',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Almarai',
                                                          color:
                                                              const Color(0xFFEA0202),
                                                          fontSize: 25.0,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                          '${valueOrDefault<String>(
                                            _model.projectModel?.approvedPricing
                                                .toString(),
                                            '0',
                                          )} JOD',
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
                                          '${valueOrDefault<String>(
                                            _model.projectModel?.profit
                                                .toString(),
                                            '0',
                                          )} JOD',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Almarai',
                                                color: const Color(0xFFE58A44),
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
                                                color: const Color(0xFFE58A44),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 0.0),
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
                                            color: FlutterFlowTheme.of(context)
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
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
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
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
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
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
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
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
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
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
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
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
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
                                        'e7u4kwtt' /* Status */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          localCostListItem.category,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          localCostListItem.unitCost.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          localCostListItem.unit,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          localCostListItem.duration.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          localCostListItem.durationUnit,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          localCostListItem.notes,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Stack(
                                          children: [
                                            Text(
                                              functions.getCostStatusName(
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                                  localCostListItem.costStatus),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
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
                                FlutterFlowTheme.of(context)
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
              if (MediaQuery.sizeOf(context).width < 450.0)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                                    'hjwlvl4n' /* Collaborators */,
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
                                    30.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  height: 100.0,
                                  decoration: const BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final listOfMemebersLocal = _model
                                          .listOfMemebrslocal
                                          .map((e) => e)
                                          .toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
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
                                              ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(50.0),
                                                  bottomRight:
                                                      Radius.circular(50.0),
                                                  topLeft:
                                                      Radius.circular(50.0),
                                                  topRight:
                                                      Radius.circular(50.0),
                                                ),
                                                child: Image.network(
                                                  functions.getFullImage(
                                                      listOfMemebersLocalItem
                                                          .picture)!,
                                                  width: 100.0,
                                                  height: 100.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listOfMemebersLocalItem
                                                          .name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Almarai',
                                                            color: const Color(
                                                                0xFF032734),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        listOfMemebersLocalItem
                                                            .firstName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              color: const Color(
                                                                  0xFF032734),
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
                                          );
                                        },
                                      );
                                    },
                                  ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'kdii3s5p' /* Client */,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30.0),
                                                  bottomRight:
                                                      Radius.circular(30.0),
                                                  topLeft:
                                                      Radius.circular(30.0),
                                                  topRight:
                                                      Radius.circular(30.0),
                                                ),
                                                child: Image.network(
                                                  functions.getFullImage(_model
                                                                  .projectModel
                                                                  ?.clientLogo !=
                                                              null &&
                                                          _model.projectModel
                                                                  ?.clientLogo !=
                                                              ''
                                                      ? _model.projectModel!
                                                          .clientLogo
                                                      : ' ')!,
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              _model.projectModel?.client !=
                                                          null &&
                                                      _model.projectModel
                                                              ?.client !=
                                                          ''
                                                  ? _model.projectModel!.client
                                                  : ' ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Almarai',
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 15.0, 10.0, 15.0),
                        child: Container(
                          height: 400.0,
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
                                    'lbe0phnu' /* CollaboratProject Financial De... */,
                                  ),
                                  textAlign: TextAlign.center,
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
                                    30.0, 60.0, 30.0, 0.0),
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
                                            'd51tj9o4' /* Estimated Cost */,
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
                                              '${valueOrDefault<String>(
                                                _model.projectModel?.costBudget
                                                    .toString(),
                                                '0',
                                              )} JOD',
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
                      Container(
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
                                      '40l9li6h' /* Collaborators */,
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
                                    '${valueOrDefault<String>(
                                      _model.projectModel?.approvedPricing
                                          .toString(),
                                      '0',
                                    )} JOD',
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
                                      'ec0usot4' /* Gross Profit */,
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
                                    '${valueOrDefault<String>(
                                      _model.projectModel?.profit.toString(),
                                      '0',
                                    )} JOD',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          color: const Color(0xFFE58A44),
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
                                      '278fk90p' /* Gross Profit Margin */,
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
                                      'mrp2gved' /* Collaborators */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Almarai',
                                          color: const Color(0xFFE58A44),
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
                      Container(
                        width: 390.0,
                        height: 400.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 0.0),
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
                                          'oshhm79q' /* Item */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                          '2he35hvm' /* Category */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                          'u9zt9j4c' /* Cost per Unit (JOD) */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                          'cckol1qx' /* Unit */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            localCostListItem.category,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            localCostListItem.unitCost
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            localCostListItem.unit,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ].map((c) => DataCell(c)).toList())
                                    .map((e) => DataRow(cells: e))
                                    .toList(),
                                headingRowColor: MaterialStateProperty.all(
                                  const Color(0xFF4D4D4D),
                                ),
                                headingRowHeight: 56.0,
                                dataRowColor: MaterialStateProperty.all(
                                  FlutterFlowTheme.of(context)
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
                      Container(
                        width: 390.0,
                        height: 400.0,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: MediaQuery.sizeOf(context).width < 450.0,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 0.0),
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
                                            'l0jly4l8' /* Note */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            'o3ivf3ho' /* Duration */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            'tnznvsnl' /* Duration Unit */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            'rhfm6z6m' /* Status */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                              localCostListItem.notes,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              localCostListItem.category,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Text(
                                              localCostListItem.durationUnit,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                            Stack(
                                              children: [
                                                Text(
                                                  functions.getCostStatusName(
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                      localCostListItem
                                                          .costStatus),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
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
                                    FlutterFlowTheme.of(context)
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
}
