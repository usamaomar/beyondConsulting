// Automatic FlutterFlow imports
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

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

class _SyncFusionFlutterBarChartsState extends State<Sync> {
  List<BarChartModelStruct> data = [];

  @override
  void initState() {
    data = [
      BarChartModelStruct(
          lable: widget.listOfTotal.isNotEmpty ? widget.listOfTotal[0].lable : '',
          number:widget.listOfTotal.isNotEmpty ? widget.listOfTotal[0].number : 0,
          color: widget.listOfTotal.isNotEmpty ? widget.listOfTotal[0].color : Colors.transparent
      ),
      BarChartModelStruct(


          lable: widget.listOfSpent.isNotEmpty ? widget.listOfSpent[0].lable : '',
          number:widget.listOfSpent.isNotEmpty ? widget.listOfSpent[0].number : 0,
          color: widget.listOfSpent.isNotEmpty ? widget.listOfSpent[0].color : Colors.transparent
         ),
      BarChartModelStruct(


          lable: widget.listOfRemainingBudget.isNotEmpty ? widget.listOfRemainingBudget[0].lable : '',
          number:widget.listOfRemainingBudget.isNotEmpty ? widget.listOfRemainingBudget[0].number : 0,
          color: widget.listOfRemainingBudget.isNotEmpty ? widget.listOfRemainingBudget[0].color : Colors.transparent


          // lable: widget.listOfRemainingBudget[0].lable,
          // number: widget.listOfRemainingBudget[0].number,
          // color: widget.listOfRemainingBudget[0].color

      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
            primaryXAxis:
                CategoryAxis(majorTickLines: const MajorTickLines(size: 0)),
            primaryYAxis: NumericAxis(
              rangePadding: ChartRangePadding.none,
              axisLine: const AxisLine(width: 0),
              majorGridLines: const MajorGridLines(width: 0),
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<BarChartModelStruct, String>>[
          ColumnSeries<BarChartModelStruct, String>(
              dataSource: data,
              yValueMapper: (BarChartModelStruct sales, _) => sales.number,
              xValueMapper: (BarChartModelStruct sales, _) => sales.lable,
              pointColorMapper: (BarChartModelStruct data, _) => Colors.red),
        ]));
  }
}
