// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ContainedTabbarView extends StatefulWidget {
  const ContainedTabbarView({
    Key? key,
    this.width,
    this.height,
    required this.listOfTaps,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<TeamTapModelStruct> listOfTaps;

  @override
  _ContainedTabbarViewState createState() => _ContainedTabbarViewState();
}

class _ContainedTabbarViewState extends State<ContainedTabbarView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
