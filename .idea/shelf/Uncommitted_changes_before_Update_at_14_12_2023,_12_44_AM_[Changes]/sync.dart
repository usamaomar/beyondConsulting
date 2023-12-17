// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Sync extends StatefulWidget {
  const Sync({
    Key? key,
    this.width,
    this.height,
    required this.listOfTotal,
    required this.listOfSpent,
    required this.listOfRemainingBudget,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<BarChartModelStruct> listOfTotal;
  final List<BarChartModelStruct> listOfSpent;
  final List<BarChartModelStruct> listOfRemainingBudget;

  @override
  _SyncFusionFlutterBarChartsState createState() =>
      _SyncFusionFlutterBarChartsState();
}

class _SyncFusionFlutterBarChartsState
    extends State<Sync> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
