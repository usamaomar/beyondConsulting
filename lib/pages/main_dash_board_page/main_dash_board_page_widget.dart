import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/note_components/back_view_component/back_view_component_widget.dart';
import '/pages/components/note_components/creat_new_not_component/creat_new_not_component_widget.dart';
import '/pages/components/note_components/front_view_component/front_view_component_widget.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'main_dash_board_page_model.dart';
export 'main_dash_board_page_model.dart';

class MainDashBoardPageWidget extends StatefulWidget {
  const MainDashBoardPageWidget({super.key});

  @override
  _MainDashBoardPageWidgetState createState() =>
      _MainDashBoardPageWidgetState();
}

class _MainDashBoardPageWidgetState extends State<MainDashBoardPageWidget> {
  late MainDashBoardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainDashBoardPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

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
                  FFLocalizations.of(context).getText(
                    '8bj5guab' /* Main DashBoard */,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Container(
                          height: 350.0,
                          decoration: const BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final listOfLocalCards = FFAppState()
                                  .listOfNotes
                                  .map((e) => e)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: listOfLocalCards.length,
                                itemBuilder: (context, listOfLocalCardsIndex) {
                                  final listOfLocalCardsItem =
                                      listOfLocalCards[listOfLocalCardsIndex];
                                  return FlipCard(
                                    fill: Fill.fillBack,
                                    direction: FlipDirection.HORIZONTAL,
                                    speed: 400,
                                    front: FrontViewComponentWidget(
                                      key: Key(
                                          'Keyuf1_${listOfLocalCardsIndex}_of_${listOfLocalCards.length}'),
                                      title: listOfLocalCardsItem.title,
                                      color: listOfLocalCardsItem.backColor!,
                                      createdDate:
                                          listOfLocalCardsItem.createdDate!,
                                    ),
                                    back: BackViewComponentWidget(
                                      key: Key(
                                          'Keyw6a_${listOfLocalCardsIndex}_of_${listOfLocalCards.length}'),
                                      title: listOfLocalCardsItem.title,
                                      date: dateTimeFormat(
                                        'yMd',
                                        listOfLocalCardsItem.achievementData!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      note: listOfLocalCardsItem.note,
                                      color: listOfLocalCardsItem.frontColor!,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showAlignedDialog(
                              context: context,
                              isGlobal: true,
                              avoidOverflow: false,
                              targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: const CreatNewNotComponentWidget(),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ezus85f3' /* Add New Note */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Almarai',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Icon(
                                Icons.add_circle,
                                color: FlutterFlowTheme.of(context)
                                    .beyondBlueColor,
                                size: 30.0,
                              ),
                            ],
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
