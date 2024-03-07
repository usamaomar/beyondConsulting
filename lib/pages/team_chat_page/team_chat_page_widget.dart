import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

import '../../flutter_flow/flutter_flow_widgets.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/side_nav/side_nav_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'team_chat_page_model.dart';
export 'team_chat_page_model.dart';

class TeamChatPageWidget extends StatefulWidget {
  const TeamChatPageWidget({super.key});

  @override
  State<TeamChatPageWidget> createState() => _TeamCapacitiesPageWidgetState();
}

class _TeamCapacitiesPageWidgetState extends State<TeamChatPageWidget> {
  late TeamChatPageModel _model;
  final mainRef = FirebaseDatabase.instance;
  ScrollController _controller = ScrollController();
  String _displayedDate = "";
  int mainValue = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  void _scrollListener() {
    setState(() {
      // Get the first visible item index
      final index = _controller.position
          .pixels; // You may need to adjust this depending on your list item height
      // Update the displayed date based on the index or any other conditions you want
      int ind = calculateIndex(index, 50);
      print('ONE ${ind}');
      if (_model.mapValue.isNotEmpty) {
        _displayedDate = formatDate(
            _model.mapValue[ind % _model.mapValue.length]['time'].toString());
      }
    });
  }
  String formatDate(String timestampString) {
    int timestamp = int.tryParse(timestampString) ?? 0;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // Get current date without time
    DateTime currentDate = DateTime.now();
    DateTime previousDate = currentDate.subtract(Duration(days: 1));

    // Compare the provided date with current date to determine the appropriate string
    if (dateTime.year == currentDate.year &&
        dateTime.month == currentDate.month &&
        dateTime.day == currentDate.day) {
      return 'Today';
    } else if (dateTime.year == previousDate.year &&
        dateTime.month == previousDate.month &&
        dateTime.day == previousDate.day) {
      return 'Yesterday';
    } else {
      // Format the date as "dd/MM/yyyy"
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
  int calculateIndex(double scrollOffset, double itemHeight) {
    return (scrollOffset / itemHeight).floor();
  }
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamChatPageModel());
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _controller.addListener(_scrollListener);
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult1xv = await GetMyTeamApiCall.call(
        token: FFAppState().tokenModelAppState.token,
      );
      if ((_model.apiResult1xv?.succeeded ?? true)) {
        setState(() {
          _model.teamMemberModel =
              TeamMembersModelStruct.maybeFromMap(getJsonField(
            (_model.apiResult1xv?.jsonBody ?? ''),
            r'''$.data''',
          ));
        });

        mainRef
            .ref()
            .child("chat")
            .child(_model.teamMemberModel?.id.toString() ?? '0')
            .child("messages")
            .onValue
            .listen((event) {
          if (event.snapshot.exists) {
            _model.mapValue.clear();
            Map<dynamic, dynamic> maps =
            event.snapshot.value as Map<Object?, Object?>;
            maps.forEach((key, value) {
              _model.mapValue.add(value as Map<Object?, Object?>);
            });
            _model.mapValue.sort(
                    (a, b) => a['time'].toString().compareTo(b['time'].toString()));
            _model.mapValue = _model.mapValue.reversed.toList();
            setState(() {});
          }
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
  bool hasPassedAll(Map<Object?, Object?> mapValue) {
    DateTime dateFromService = DateTime.fromMillisecondsSinceEpoch(mainValue);
    DateTime dateFromList = DateTime.fromMillisecondsSinceEpoch(
        int.parse(mapValue['time'].toString()));
    DateTime dateFromServiceSaved = DateTime(
        dateFromService.year, dateFromService.month, dateFromService.day);
    DateTime dateFromListSaved =
    DateTime(dateFromList.year, dateFromList.month, dateFromList.day);
    if (dateFromServiceSaved.isAtSameMomentAs(dateFromListSaved)) {
      return false;
    } else {
      mainValue = int.parse(mapValue['time'].toString());
      return true;
    }
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
        backgroundColor: FlutterFlowTheme.of(context).info,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideNavModel,
            updateCallback: () => setState(() {}),
            child: const SideNavWidget(
              sideMenuEnum: SideMenuEnum.CHAT_WITH_TEAM,
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
                padding:
                    const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'z0yohwms5' /* Chat with Team */,
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
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).beyondBlueColor,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Expanded(
                      child: ListView.builder(
                          controller: _controller,
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                          itemCount: _model.mapValue.length,
                          reverse: true,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return _model.mapValue[index]['userId'] == FFAppState().userModelAppState.id
                                ? Stack(
                              children: [
                                Visibility(
                                  visible: hasPassedAll(_model.mapValue[index]),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                        EdgeInsets.fromLTRB(0, 15, 0, 0),
                                        decoration: BoxDecoration(
                                          color: Color(0xFF092853),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(50.0),
                                            bottomRight: Radius.circular(50.0),
                                            topLeft: Radius.circular(50.0),
                                            topRight: Radius.circular(50.0),
                                          ),
                                        ),
                                        padding:
                                        EdgeInsets.fromLTRB(20, 5, 20, 5),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${getDatea()}',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Visibility(
                                      visible:
                                      hasNextAdmin(_model.mapValue, index),
                                      child: Padding(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              convertToAmBmFormat(_model
                                                  .mapValue[index]['time']
                                                  .toString()),
                                              textAlign: TextAlign.start,
                                              style:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Heebo',
                                                color:
                                                Color(0xFF092853),
                                                fontSize: 12.0,
                                                fontWeight:
                                                FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                        padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      ),
                                    ),
                                    ChatBubble(
                                      clipper: ChatBubbleClipper5(
                                          radius: 50,
                                          type: BubbleType.sendBubble),
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(top: 20),
                                      backGroundColor: Color(0xffECF3FB),
                                      child: Container(
                                        margin:
                                        EdgeInsets.fromLTRB(30, 10, 30, 0),
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.7,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(50.0),
                                            bottomRight: Radius.circular(50.0),
                                            topLeft: Radius.circular(50.0),
                                            topRight: Radius.circular(50.0),
                                          ),
                                        ),
                                        child: Text(
                                          "${_model.mapValue[index]['body']}",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                                : Column(
                              children: [
                                Visibility(
                                  visible: hasNextUser(_model.mapValue, index),
                                  child: Padding(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          convertToAmBmFormat(_model
                                              .mapValue[index]['time']
                                              .toString()),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Heebo',
                                            color: Color(0xFF092853),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                ),
                                ChatBubble(
                                  clipper: ChatBubbleClipper5(
                                      type: BubbleType.receiverBubble),
                                  backGroundColor: Color(0xffC1D6EF),
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth:
                                      MediaQuery.of(context).size.width *
                                          0.7,
                                    ),
                                    child: Text(
                                      "${_model.mapValue[index]['body']}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        border: Border.all(
                          color: Colors.black12,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Message",
                                    labelStyle:
                                        FlutterFlowTheme.of(context).labelMedium,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .beyondBlueColor,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _sendMessage();
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '9kk2xdy8' /* Send */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 90,
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).beyondBlueColor,
                                    textStyle:
                                    FlutterFlowTheme.of(context).titleSmall.override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
  String getDatea() {
    DateTime dateFromService = DateTime.fromMillisecondsSinceEpoch(mainValue);
    return '${dateFromService.year}/${dateFromService.month}/${dateFromService.day}';
  }

  bool hasNextAdmin(List<Map<Object?, Object?>> mapValue, int index) {
    if (index >= 0 && index < mapValue.length - 1) {
      if (mapValue[index + 1]['userId'] == FFAppState().userModelAppState.id) {
        if (mapValue[index]['userId'] != FFAppState().userModelAppState.id) {
          return true;
        }
      }
    }
    return false;
  }

  bool hasNextUser(List<Map<Object?, Object?>> mapValue, int index) {
    if (index >= 0 && index < mapValue.length - 1) {
      if (mapValue[index + 1]['userId'] != FFAppState().userModelAppState.id) {
        return true;
      }
    }
    return false;
  }

  String convertToAmBmFormat(String timestampString) {
    int timestamp = int.tryParse(timestampString) ?? 0;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedTime =
        "${dateTime.hour < 10 ? '0' : ''}${dateTime.hour % 12}:${dateTime.minute < 10 ? '0' : ''}${dateTime.minute} ${dateTime.hour < 12 ? 'am' : 'pm'}";
    return formattedTime;
  }
  String? key = '';
  void _sendMessage() async {
    final text = _model.textController1.text;
    if (text.isNotEmpty) {
      Map<dynamic, dynamic> keyMap = {};
      keyMap['body'] = text;
      keyMap['type'] = 'text';
      keyMap['time'] = DateTime.now().millisecondsSinceEpoch.toString();
      keyMap['from'] = '${FFAppState().userModelAppState.firstName} ${ FFAppState().userModelAppState.lastName}';
      keyMap['userId'] = FFAppState().userModelAppState.id;
      final vmm = mainRef
          .ref()
          .child("chat")
          .child(_model.teamMemberModel?.id.toString() ?? '0')
          .child('messages')
          .push();
      key = vmm.key;
      vmm.set(keyMap);
      setState(() {
        _model.textController1.text = '';
      });
    }
  }

}
