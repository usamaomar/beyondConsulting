import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loging_page_model.dart';
export 'loging_page_model.dart';

class LogingPageWidget extends StatefulWidget {
  const LogingPageWidget({super.key});

  @override
  State<LogingPageWidget> createState() => _LogingPageWidgetState();
}

class _LogingPageWidgetState extends State<LogingPageWidget> {
  late LogingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogingPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();


    if (kDebugMode)
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.textController1?.text = 'generalmanager@beyond.com';
      });
      // setState(() {
      //   _model.textController1?.text = 'zaina.hammour@beyond-consult.com';
      // });
      // setState(() {
      //   _model.textController2?.text = '123456';
      // });
      // setState(() {
      //   _model.textController1?.text = 'razan.asali@beyond-consult.com';
      // });

      // setState(() {
      //   _model.textController1?.text = 'basel.kassab@beyond-consult.com';
      // });

      setState(() {
        _model.textController2?.text = '123!Pa\$\$word';
      });
      // setState(() {
      //   _model.textController1?.text = 'admin@beyond.com';
      // });
      // setState(() {
      //   _model.textController2?.text = '123!Pa\$\$word';
      // });
      // setState(() {
      //   _model.textController1?.text = '123456';
      // });
      // setState(() {
      //   _model.textController2?.text = '';
      // });
    });


    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    getPermission().then((value) {
      FirebaseMessaging.instance.deleteToken().then((value) {
        FirebaseMessaging.instance.getToken().then((fbToken) {
          FFAppState().fcm = fbToken ?? 'null';
        });
      });
    });
    super.dispose();
  }

  Future<void> getPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
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
        body: SafeArea(
          top: true,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF03A4E2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.of(context).info,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 0.0),
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      const Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 450.0,
                                            child: Divider(
                                              thickness: 3.0,
                                              color: Color(0xFFB5B7BA),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '6qxobb1r' /* BEYOND CONSULTING */,
                                                        ),
                                                      style:
                                                             FlutterFlowTheme
                                                             .of(context)
                                                             .bodyMedium
                                                             .override(
                                                             fontFamily:
                                                             'Almarai',
                                                             color: FlutterFlowTheme
                                                             .of(context)
                                                             .beyondBlueColor,
                                                             fontSize:
                                                             20.0,
                                                             fontWeight:
                                                             FontWeight
                                                             .w500,
                                                             useGoogleFonts:
                                                             false,
                                                             ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '2qtwe1m0' /* MANAGEMENT AND BUSINESS CONSUL... */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Almarai',
                                                              color: const Color(
                                                                  0xFFB6B7BA),
                                                              fontSize: 10.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts:
                                                                  false,
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '9k8apshq' /* HELLO BEYONDER! */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto Mono',
                                          color: FlutterFlowTheme.of(context)
                                              .beyondBlueColor,
                                          fontSize: 20.0,
                                          letterSpacing: 10.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 250.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 15.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.textController1,
                                        focusNode: _model.textFieldFocusNode1,
                                        autofillHints: const [AutofillHints.email],
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'bzoyjww7' /* Email */,
                                          ),
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .beyondBlueColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0xFFE6E8E8),
                                          prefixIcon: const Icon(
                                            Icons.location_history,
                                            size: 22.0,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: _model
                                            .textController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 250.0,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 15.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController2,
                                      focusNode: _model.textFieldFocusNode2,
                                      autofillHints: const [AutofillHints.email],
                                      textInputAction: TextInputAction.next,
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'd719d929' /* Password */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .beyondBlueColor,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFFE6E8E8),
                                        prefixIcon: const Icon(
                                          Icons.lock_reset_rounded,
                                          size: 22.0,
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model.passwordVisibility =
                                                !_model.passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  // child: Text(
                                  //   FFLocalizations.of(context).getText(
                                  //     'n9ax8dnw' /* Forget Password */,
                                  //   ),
                                  //   style: FlutterFlowTheme.of(context)
                                  //       .bodyMedium
                                  //       .override(
                                  //         fontFamily: 'Readex Pro',
                                  //         color: const Color(0xFFB6B7BA),
                                  //         fontSize: 12.0,
                                  //         letterSpacing: 2.0,
                                  //       ),
                                  // ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 50.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var shouldSetState = false;
                                      _model.loginResponse =
                                          await LoginApiCall.call(
                                        email: _model.textController1.text,
                                        password: _model.textController2.text,
                                      );
                                      shouldSetState = true;
                                      if ((_model.loginResponse?.jsonBody['succeeded']) ==
                                          true) {
                                        setState(() {
                                          FFAppState().tokenModelAppState =
                                              TokenModelStruct.maybeFromMap(
                                                  LoginApiCall.tokenJsonModel(
                                            (_model.loginResponse?.jsonBody ??
                                                ''),
                                          ))!;
                                        });
                                        _model.userDataResponse =
                                            await GetMyDataApiCall.call(
                                          token: FFAppState()
                                              .tokenModelAppState
                                              .token,
                                        );
                                        shouldSetState = true;
                                        if ((_model.userDataResponse?.jsonBody['succeeded']) ==
                                            true) {
                                          setState(() {
                                            FFAppState().userModelAppState =
                                                UserModelStruct.maybeFromMap(
                                                    GetMyDataApiCall
                                                        .userJsonModel(
                                              (_model.userDataResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ))!;
                                          });
                                          context.pushReplacementNamed('HomePage');
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    FFLocalizations.of(context)
                                                        .getVariableText(
                                                  enText: 'Error',
                                                  arText: 'مشكله',
                                                )),
                                                content: Text((_model
                                                        .userDataResponse
                                                        ?.bodyText ??
                                                    '')),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text(
                                                        FFLocalizations.of(
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
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText: 'Error',
                                                arText: 'مشكله',
                                              )),
                                              content: Text((_model
                                                      .loginResponse
                                                      ?.bodyText ??
                                                  '')),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text(
                                                      FFLocalizations.of(
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
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (shouldSetState) setState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '3vrtkvnj' /* Login */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .beyondBlueColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            letterSpacing: 5.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(
                          width: MediaQuery.sizeOf(context).width > 479.0
                              ? 300.0
                              : 5.0))
                      .addToEnd(SizedBox(
                          width: MediaQuery.sizeOf(context).width > 479.0
                              ? 300.0
                              : 5.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
