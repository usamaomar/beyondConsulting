import 'package:beyond_consulting/pages/progect_pages/project_page/sync.dart';
import 'package:beyond_consulting/pages/progect_pages/project_page/test.dart';
import 'package:beyond_consulting/pages/progect_pages/project_page/test2.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';

import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/satisfaction_component_widget.dart';
import '/components/stick_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/read_member_cpacity/read_member_cpacity_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'milestone_chart_widget.dart';
import 'milestone_graph.dart';
import 'milestone_progress_graph.dart';
import 'project_page_model.dart';
export 'project_page_model.dart';

class ProjectPageWidget extends StatefulWidget {
  const ProjectPageWidget({
    super.key,
    required this.projectJaonModel,
  });

  final dynamic projectJaonModel;

  @override
  State<ProjectPageWidget> createState() => _ProjectPageWidgetState();
}

class _ProjectPageWidgetState extends State<ProjectPageWidget> {
  late ProjectPageModel _model;
  final ScrollController _scrollController = ScrollController();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.projectModel =
            ProjectModelStruct.maybeFromMap(widget.projectJaonModel);
      });
      setState(() {
        _model.addToTotalLableList(BarChartModelStruct(
          lable: FFLocalizations.of(context).getVariableText(
            enText: 'Total',
            arText: 'المجموع',
          ),
          number:  _model.projectModel?.costBudget.toInt(),
          color: const Color(0xFFFFD600),
        ));
        _model.addToSpentLableList(BarChartModelStruct(
          lable: FFLocalizations.of(context).getVariableText(
            enText: 'Spent',
            arText: 'أنفق',
          ),
          number:  _model.projectModel?.approvedCost.toInt(),
          color: const Color(0xFF2C8CB6),
        ));
        _model.addToRemainingLableList(BarChartModelStruct(
          lable: FFLocalizations.of(context).getVariableText(
            enText: 'Remaining',
            arText: 'متبقي',
          ),
          number:  (  (_model.projectModel
              ?.costBudget ?? 0 ) - (_model.projectModel?.approvedCost ?? 0) ).toInt(),
          color: const Color(0xFFC8C9CC),
        ));
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
              sideMenuEnum: SideMenuEnum.PROJECT_PAGE,
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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        25.0, 0.0, 25.0, 0.0),
                    child: Text(
                      _model.projectModel?.name != null &&
                              _model.projectModel?.name != ''
                          ? _model.projectModel!.name
                          : ' ',
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
              if ((FFAppState().userModelAppState.accessRole == 2) ||
                      (FFAppState().userModelAppState.accessRole == 3) ||
                      (FFAppState().userModelAppState.accessRole == 5) ||
                      (FFAppState().userModelAppState.accessRole == 1)
                  ? true
                  : false)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'UpdateProjectPage',
                      queryParameters: {
                        'projectLocalModel': serializeParam(
                          _model.projectModel?.toMap(),
                          ParamType.JSON,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Icon(
                    Icons.edit_square,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
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
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).info,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 45.0, 10.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .beyondBlueColor,
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 20.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '72aclu09' /* Projects Tracker */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Almarai',
                                              color: const Color(0xFF032734),
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          400.0
                                                      ? 14.0
                                                      : 18.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          _model.projectModel?.milestones.length
                                                          .toString() !=
                                                      null &&
                                                  _model.projectModel
                                                          ?.milestones.length
                                                          .toString() !=
                                                      ''
                                              ? _model.projectModel
                                                    ?.milestones.length
                                                  .toString()
                                              : '0',
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Almarai',
                                              color: const Color(0xFF01A3E2),
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          400.0
                                                      ? 15.0
                                                      : 30.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 20.0, 10.0, 10.0),
                                    child: Container(
                                      width: 450,
                                      height: 450,
                                      child: (_model.projectModel?.milestones ?? []).isEmpty ? Container() : test(
                                        milestones: _model.projectModel?.milestones ?? [],
                                      ),
                                    )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 0.0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(10.0, 30.0, 0.0, 20.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'lriocr9t' /* Collaborators */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Almarai',
                                                  fontSize:
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
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
                                          padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 20.0, 0.0, 20.0),
                                          child:_model.projectModel!=null ?  Container(
                                            height: 100.0,
                                            constraints: const BoxConstraints(
                                              minWidth: 350.0,
                                            ),
                                            decoration: const BoxDecoration(),
                                            child: Builder(
                                              builder: (context) {
                                                final listOfMemebersLocal =
                                                    functions
                                                        .addMemberItemsToList(
                                                            _model.projectModel!
                                                                .senior,
                                                            _model.projectModel!
                                                                .seniorId,
                                                            _model.projectModel!
                                                                .seniorPicture,
                                                            _model.projectModel!
                                                                .midManagers
                                                                .toList(),
                                                            _model.projectModel!
                                                                .associates
                                                                .toList())
                                                        .toList();
                                                return Scrollbar(
                                                  controller: _scrollController,
                                                  interactive: true,
                                                  trackVisibility: true,
                                                    thumbVisibility : true,
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    controller: _scrollController,
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    itemCount: listOfMemebersLocal
                                                        .length,
                                                    itemBuilder: (context,
                                                        listOfMemebersLocalIndex) {
                                                      final listOfMemebersLocalItem =
                                                          listOfMemebersLocal[
                                                              listOfMemebersLocalIndex];
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              child:
                                                                  ReadMemberCpacityWidget(
                                                                key: Key(
                                                                  'Keyl7c_${listOfMemebersLocalItem.id}',
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
                                                    }
                                                  ),
                                                );
                                              },
                                            ),
                                          ) : Container(),
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
                                    ),child: Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(30.0, 30.0, 30.0, 30.0),
                                          child: RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      '${_model.projectModel?.client} are ',
                                                  style: const TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: _model.projectModel
                                                              ?.clientSatisfaction !=
                                                          null
                                                      ? functions
                                                          .convertFromIdToTextClientSatisfaction(
                                                              _model
                                                                  .projectModel!
                                                                  .clientSatisfaction,
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode)
                                                      : ' ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: FFAppState().clintSatisfactionList[_model
                                                            .projectModel == null ? 0 : _model.projectModel!.clientSatisfaction - 1].color,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 1.0,
                                          indent: 30.0,
                                          endIndent: 30.0,
                                          color: Color(0xFFC8C9CC),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 20.0, 0.0, 20.0),
                                          child: Container(
                                            height: 100.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model: _model
                                                  .satisfactionComponentModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child:
                                                  SatisfactionComponentWidget(
                                                satisfactionType: _model.projectModel?.clientSatisfaction ?? 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .beyondBlueColor,
                                  width: 2.0,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'vokc4jta' /* Upcoming Milestones */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Almarai',
                                                color: const Color(0xFF032734),
                                                fontSize:
                                                    MediaQuery.sizeOf(context)
                                                                .width <
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
                                          padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 15.0, 0.0, 15.0),
                                          child: Container(
                                            height: 450.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final upcomingMilestoneItem =
                                                    _model.projectModel
                                                            ?.milestones
                                                            .toList() ??
                                                        [];
                                                return DataTable2(
                                                  columns: [
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'uu017afu' /* Milestone */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'k9kpljxf' /* Description */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'mmrwuywi' /* Deadline */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn2(
                                                      label: DefaultTextStyle
                                                          .merge(
                                                        softWrap: true,
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ab7ejsgk' /* Status */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  upcomingMilestoneItemItem
                                                                      .description,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  functions.convertDateFromStamp(
                                                                      upcomingMilestoneItemItem
                                                                          .endDate),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                                Text(
                                                                  FFAppState()
                                                                      .mileStoneModelAppState[
                                                                          upcomingMilestoneItemItem
                                                                              .status]
                                                                      .nameEn,
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
                                                        BorderRadius.circular(
                                                            0.0),
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
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 10.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 45.0, 0.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .beyondBlueColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 15.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '7ogjhx51' /* Financial Outlook */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Almarai',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SizedBox(
                                                  width: 390.0,
                                                  height: 400.0,
                                                  child: Sync(
                                                  width: 390.0,
                                                  height: 400.0,
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
                                      Row(
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
                                                      _model.projectModel
                                                          ?.costBudget
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
                                                      _model.projectModel
                                                          ?.approvedCost
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
                                                      (  (_model.projectModel
                                                          ?.costBudget ?? 0 ) - (_model.projectModel?.approvedCost ?? 0) )
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
                                      Material(
                                          color: Colors.transparent,
                                          elevation: 4.0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                              topLeft: Radius.circular(5.0),
                                              topRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          child:Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFBCD1AE),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5.0),
                                            bottomRight: Radius.circular(5.0),
                                            topLeft: Radius.circular(5.0),
                                            topRight: Radius.circular(5.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ofm4073h' /* Revenue */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: const Color(
                                                            0xFF339259),
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mhnpt9xj' /* JOD */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: const Color(
                                                            0xFF339259),
                                                      ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 56.0,
                                              child: VerticalDivider(
                                                thickness: 1.0,
                                                indent: 5.0,
                                                endIndent: 5.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'x8rgmtig' /* 30k/ */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: const Color(
                                                            0xFF339259),
                                                      ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '239ewb9m' /* 30k */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color: const Color(
                                                            0xFF339259),
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
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .beyondBlueColor,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 30.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .beyondBlueColor,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(25.0),
                                                  topRight:
                                                      Radius.circular(25.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        15.0, 15.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                        'MMMM',
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Almarai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        'yyyy',
                                                        getCurrentTimestamp,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Almarai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 16.0,
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
                                            ),
                                          ),
                                          Container(
                                            height: 65.0,
                                            decoration: const BoxDecoration(),
                                            child: ListView(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                15.0,
                                                0,
                                                15.0,
                                                0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                wrapWithModel(
                                                  model: _model.stickModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const StickWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.stickModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const StickWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.stickModel3,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const StickWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.stickModel4,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const StickWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.stickModel5,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const StickWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.stickModel6,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const StickWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.stickModel7,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const StickWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.stickModel8,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const StickWidget(),
                                                ),
                                              ].divide(
                                                  const SizedBox(width: 50.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 490.0,
                                        child:_model
                                            .projectModel !=null ?  custom_widgets
                                            .MilestoneCalendarWidget(
                                          width: double.infinity,
                                          height: 490.0,
                                          milestones:_model
                                              .projectModel !=null ?  functions
                                              .convertToDateTimeList(_model
                                                  .projectModel?.milestones
                                                  .toList() ?? []) : [],
                                        ) : Container(),
                                      ),
                                    ],),
                                  ),
                                ),
                              ),
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
