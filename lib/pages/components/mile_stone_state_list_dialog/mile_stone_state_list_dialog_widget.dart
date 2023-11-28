import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'mile_stone_state_list_dialog_model.dart';
export 'mile_stone_state_list_dialog_model.dart';

class MileStoneStateListDialogWidget extends StatefulWidget {
  const MileStoneStateListDialogWidget({super.key});

  @override
  _MileStoneStateListDialogWidgetState createState() =>
      _MileStoneStateListDialogWidgetState();
}

class _MileStoneStateListDialogWidgetState
    extends State<MileStoneStateListDialogWidget> {
  late MileStoneStateListDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MileStoneStateListDialogModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().updateSelectedMileStoneModelStruct(
          (e) => e..mileStoneStateModel = null,
        );
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
            Expanded(
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
                              'dvqpa2xr' /* Select State */,
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
                                _model.updatePage(() {});
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
                    child: Builder(
                      builder: (context) {
                        final stateListModel = FFAppState()
                            .mileStoneModelAppState
                            .map((e) => e)
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: stateListModel.length,
                          itemBuilder: (context, stateListModelIndex) {
                            final stateListModelItem =
                                stateListModel[stateListModelIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState()
                                      .updateSelectedMileStoneModelStruct(
                                    (e) => e
                                      ..mileStoneStateModel =
                                          stateListModelItem,
                                  );
                                });
                                Navigator.pop(context);
                                _model.updatePage(() {});
                              },
                              child: Container(
                                width: 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).info,
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 15.0, 20.0, 15.0),
                                        child: Text(
                                          FFLocalizations.of(context)
                                              .getVariableText(
                                            enText: stateListModelItem.nameEn,
                                            arText: stateListModelItem.nameAr,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Almarai',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
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
