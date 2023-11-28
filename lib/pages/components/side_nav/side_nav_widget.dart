import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'side_nav_model.dart';
export 'side_nav_model.dart';

class SideNavWidget extends StatefulWidget {
  const SideNavWidget({
    super.key,
    required this.sideMenuEnum,
  });

  final SideMenuEnum? sideMenuEnum;

  @override
  _SideNavWidgetState createState() => _SideNavWidgetState();
}

class _SideNavWidgetState extends State<SideNavWidget> {
  late SideNavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultoho = await GetMyProjectsCreationApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResultoho?.statusCode ?? 200) == 200) {
        setState(() {
          FFAppState().projectListCreationAppState = functions
              .fromProjectJsonToModelList(getJsonField(
                (_model.apiResultoho?.jsonBody ?? ''),
                r'''$.data''',
              ))!
              .toList()
              .cast<ProjectModelStruct>();
        });
      } else {
        return;
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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
        child: Container(
          width: 270.0,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF032734),
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).alternate,
                offset: const Offset(1.0, 0.0),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 24.0, 10.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/PHOTO-2023-11-16-13-11-02.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).accent4,
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.sideMenuEnum != SideMenuEnum.HOME) {
                              context.pushNamed(
                                'HomePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              return;
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: widget.sideMenuEnum == SideMenuEnum.HOME
                                  ? const Color(0x73FFFFFF)
                                  : const Color(0x00000000),
                              borderRadius: BorderRadius.circular(0.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Group_1908.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'zdq4e0la' /* Home */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: widget.sideMenuEnum ==
                                                    SideMenuEnum.HOME
                                                ? const Color(0xFF032734)
                                                : FlutterFlowTheme.of(context)
                                                    .info,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.2,
                          child: Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).accent4,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.sideMenuEnum !=
                                SideMenuEnum.MAIN_DASHBOARD) {
                              context.pushNamed(
                                'MainDashBoardPage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            } else {
                              return;
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: widget.sideMenuEnum ==
                                      SideMenuEnum.MAIN_DASHBOARD
                                  ? const Color(0x73FFFFFF)
                                  : const Color(0x00000000),
                              borderRadius: BorderRadius.circular(0.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: SvgPicture.asset(
                                      'assets/images/Group_1906.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'p7ziaqge' /* Main DashBoard */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.2,
                          child: Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).accent4,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF032734),
                            borderRadius: BorderRadius.circular(12.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 8.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/Group_1912.svg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        functions.projectTitle(
                                            FFLocalizations.of(context)
                                                .languageCode,
                                            FFAppState()
                                                .userModelAppState
                                                .accessRole),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().projectIsOpend =
                                          FFAppState().projectIsOpend
                                              ? false
                                              : true;
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 10.0),
                                        child: Stack(
                                          children: [
                                            if (FFAppState().projectIsOpend ==
                                                true)
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                            if (FFAppState().projectIsOpend ==
                                                false)
                                              Icon(
                                                Icons.keyboard_arrow_up,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
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
                        ),
                        if (FFAppState().projectIsOpend == false)
                          Opacity(
                            opacity: 0.2,
                            child: Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ),
                        if (FFAppState().projectIsOpend == true)
                          Container(
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final projectsSidList = FFAppState()
                                    .projectListCreationAppState
                                    .map((e) => e)
                                    .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: projectsSidList.length,
                                  itemBuilder: (context, projectsSidListIndex) {
                                    final projectsSidListItem =
                                        projectsSidList[projectsSidListIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 15.0),
                                          child: Container(
                                            width: 22.0,
                                            height: 22.0,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (projectsSidListItem.type ==
                                                    4) {
                                                  return const Color(0xFFB00712);
                                                } else if (projectsSidListItem
                                                        .type ==
                                                    4) {
                                                  return const Color(0xFFECAD7C);
                                                } else {
                                                  return const Color(0xFF9DCD5A);
                                                }
                                              }(),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 2.0, 15.0, 0.0),
                                          child: Text(
                                            projectsSidListItem.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Almarai',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        Container(
                          decoration: BoxDecoration(
                            color: widget.sideMenuEnum ==
                                    SideMenuEnum.CREATE_PROJECT
                                ? const Color(0x73FFFFFF)
                                : const Color(0x00000000),
                          ),
                          child: Visibility(
                            visible: FFAppState().projectIsOpend == true,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'CreateProjectPage',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Container(
                                      width: 22.0,
                                      height: 22.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/Group_1953.png',
                                          ).image,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 2.0, 15.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '8iucc20h' /* Create a Project */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Almarai',
                                            color: widget.sideMenuEnum ==
                                                    SideMenuEnum.CREATE_PROJECT
                                                ? const Color(0xFF032734)
                                                : FlutterFlowTheme.of(context)
                                                    .info,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
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
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().update(() {
                          FFAppState().tokenModelAppState = TokenModelStruct();
                          FFAppState().userModelAppState =
                              UserModelStruct.fromSerializableMap(jsonDecode(
                                  '{"supervisorName":"name","profilePictureDataUrl":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwk9ehRwCXvCb9IP02EyqUz-ppXch-25QRBA&usqp=CAU"}'));
                        });
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('LogingPage');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: const BoxDecoration(
                              color: Color(0x60FFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(75.0),
                              child: Image.network(
                                functions.getFullImage(FFAppState()
                                    .userModelAppState
                                    .profilePictureDataUrl)!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Text(
                              FFAppState().userModelAppState.firstName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
