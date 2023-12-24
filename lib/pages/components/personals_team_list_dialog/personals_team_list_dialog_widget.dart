import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'personals_team_list_dialog_model.dart';
export 'personals_team_list_dialog_model.dart';

class PersonalsTeamListDialogWidget extends StatefulWidget {
  const PersonalsTeamListDialogWidget({
    super.key,
    this.startDate,
  });

  final String? startDate;

  @override
  _PersonalsTeamListDialogWidgetState createState() =>
      _PersonalsTeamListDialogWidgetState();
}

class _PersonalsTeamListDialogWidgetState
    extends State<PersonalsTeamListDialogWidget> {
  late PersonalsTeamListDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalsTeamListDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult4a6 = await GetPersonalsApiCall.call(
        token: FFAppState().tokenModelAppState.token,
        startDate: functions.convertDateString(dateTimeFormat(
          'yyyy-mm-ddT00:00:00.000Z',
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        )),
      );
      if ((_model.apiResult4a6?.succeeded ?? true)) {
        setState(() {
          _model.seniorModel = UserModelStruct.maybeFromMap(getJsonField(
            (_model.apiResult4a6?.jsonBody ?? ''),
            r'''$.data.senior''',
          ));
          _model.midManagersModelList = functions
              .fromJsonToUserList(getJsonField(
                (_model.apiResult4a6?.jsonBody ?? ''),
                r'''$.data.midManagers''',
              ))
              .toList()
              .cast<UserModelStruct>();
          _model.associatesModelList = functions
              .fromJsonToUserList(getJsonField(
                (_model.apiResult4a6?.jsonBody ?? ''),
                r'''$.data.associates''',
              ))
              .toList()
              .cast<UserModelStruct>();
        });
        setState(() {
          _model.midManagersModelList = functions
              .addIsSelectedValue(
                  FFAppState().newProjectCreatedModel.midManagers.toList(),
                  _model.midManagersModelList.toList())
              .toList()
              .cast<UserModelStruct>();
          _model.associatesModelList = functions
              .addIsSelectedValue(
                  FFAppState().newProjectCreatedModel.associates.toList(),
                  _model.associatesModelList.toList())
              .toList()
              .cast<UserModelStruct>();
        });
      }
      _model.apiResultzeq = await GetMyTeamApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResultzeq?.succeeded ?? true)) {
        setState(() {
          FFAppState().updateNewProjectCreatedModelStruct(
            (e) => e
              ..teamId = getJsonField(
                (_model.apiResultzeq?.jsonBody ?? ''),
                r'''$.data.id''',
              ),
          );
        });
      }
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 100.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width < 400.0 ? 310.0 : 520.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '62b9b7qt' /* Select Project Team */,
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 15.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 10.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width < 400.0
                                          ? 310.0
                                          : 520.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE2E2E2),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  15.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '96fq2z21' /* Senior */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if ('${_model.seniorModel?.firstName == 'null' ? ' ' : _model.seniorModel?.firstName} ${_model.seniorModel?.lastName == 'null' ? ' ' : _model.seniorModel?.lastName}' !=
                                                    '')
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFF9F7F7),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
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
                                                                    20.0,
                                                                    15.0,
                                                                    20.0,
                                                                    15.0),
                                                        child: Text(
                                                          '${_model.seniorModel?.firstName == 'null' ? ' ' : _model.seniorModel?.firstName} ${_model.seniorModel?.lastName == 'null' ? ' ' : _model.seniorModel?.lastName}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Almarai',
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 10.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width < 400.0
                                          ? 310.0
                                          : 520.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE2E2E2),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  15.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'a5dxvek5' /* Medmanagers */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final listOfMedmanagersModel =
                                                    _model.midManagersModelList
                                                        .map((e) => e)
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listOfMedmanagersModel
                                                          .length,
                                                  itemBuilder: (context,
                                                      listOfMedmanagersModelIndex) {
                                                    final listOfMedmanagersModelItem =
                                                        listOfMedmanagersModel[
                                                            listOfMedmanagersModelIndex];
                                                    return Container(
                                                      width: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFFF9F7F7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
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
                                                                          20.0,
                                                                          15.0,
                                                                          20.0,
                                                                          15.0),
                                                              child: Text(
                                                                '${listOfMedmanagersModelItem.firstName} ${listOfMedmanagersModelItem.lastName}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Almarai',
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .compact,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                              ),
                                                              child: Checkbox(
                                                                value: _model
                                                                            .checkboxValueMap1[
                                                                        listOfMedmanagersModelItem] ??=
                                                                    listOfMedmanagersModelItem
                                                                        .isSelected,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  setState(() =>
                                                                      _model.checkboxValueMap1[
                                                                              listOfMedmanagersModelItem] =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .updateMidManagersModelListAtIndex(
                                                                        listOfMedmanagersModelIndex,
                                                                        (e) => e
                                                                          ..isSelected =
                                                                              true,
                                                                      );
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .updateMidManagersModelListAtIndex(
                                                                        listOfMedmanagersModelIndex,
                                                                        (e) => e
                                                                          ..isSelected =
                                                                              !true,
                                                                      );
                                                                    });
                                                                  }
                                                                },
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .beyondBlueColor,
                                                                checkColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 10.0),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width < 400.0
                                          ? 310.0
                                          : 520.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE2E2E2),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  15.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ibsbdvsu' /* Assosites */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final listOfAssositesModel =
                                                    _model.associatesModelList
                                                        .map((e) => e)
                                                        .toList();
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listOfAssositesModel
                                                          .length,
                                                  itemBuilder: (context,
                                                      listOfAssositesModelIndex) {
                                                    final listOfAssositesModelItem =
                                                        listOfAssositesModel[
                                                            listOfAssositesModelIndex];
                                                    return Container(
                                                      width: 2.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFFF9F7F7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
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
                                                                          20.0,
                                                                          15.0,
                                                                          20.0,
                                                                          15.0),
                                                              child: Text(
                                                                '${listOfAssositesModelItem.firstName} ${listOfAssositesModelItem.lastName}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Almarai',
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .compact,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                              ),
                                                              child: Checkbox(
                                                                value: _model
                                                                            .checkboxValueMap2[
                                                                        listOfAssositesModelItem] ??=
                                                                    listOfAssositesModelItem
                                                                        .isSelected,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  setState(() =>
                                                                      _model.checkboxValueMap2[
                                                                              listOfAssositesModelItem] =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .updateAssociatesModelListAtIndex(
                                                                        listOfAssositesModelIndex,
                                                                        (e) => e
                                                                          ..isSelected =
                                                                              true,
                                                                      );
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .updateAssociatesModelListAtIndex(
                                                                        listOfAssositesModelIndex,
                                                                        (e) => e
                                                                          ..isSelected =
                                                                              !true,
                                                                      );
                                                                    });
                                                                  }
                                                                },
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .beyondBlueColor,
                                                                checkColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            _model.updatePage(() {
                              FFAppState().updateNewProjectCreatedModelStruct(
                                (e) => e
                                  ..midManagers = functions
                                      .convertFomrUserToMembersCheck(
                                          _model.midManagersModelList.toList())
                                      .toList(),
                              );
                            });
                            FFAppState().update(() {
                              FFAppState().updateNewProjectCreatedModelStruct(
                                (e) => e
                                  ..associates = functions
                                      .convertFomrUserToMembersCheck(
                                          _model.associatesModelList.toList())
                                      .toList(),
                              );
                            });
                            setState(() {
                              FFAppState().listOfRols = functions
                                  .addMidsAndAssositsToRoleList(
                                      FFAppState()
                                          .newProjectCreatedModel
                                          .midManagers
                                          .toList(),
                                      FFAppState()
                                          .newProjectCreatedModel
                                          .associates
                                          .toList())
                                  .toList()
                                  .cast<MemberModelStruct>();
                            });
                            setState(() {
                              FFAppState().updateNewProjectCreatedModelStruct(
                                (e) => e..seniorId = _model.seniorModel?.id,
                              );
                            });
                            Navigator.pop(context);
                          },
                          text: FFLocalizations.of(context).getText(
                            'mm1varod' /* Add */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                34.0, 0.0, 34.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF01A3E2),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
