// Automatic FlutterFlow imports
import 'package:syncfusion_flutter_charts/charts.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class TestProjectTrackerCustomWidget extends StatefulWidget {
  const TestProjectTrackerCustomWidget(
      {Key? key, this.width, this.height, required this.milestones})
      : super(key: key);

  final double? width;
  final double? height;
  final List<MilestoneModelStruct> milestones;

  @override
  _ProjectTrackerCustomWidgetState createState() =>
      _ProjectTrackerCustomWidgetState();
}

class _ProjectTrackerCustomWidgetState
    extends State<TestProjectTrackerCustomWidget> {
  late MilestoneModelStruct firstItem;
  late MilestoneModelStruct lastItem;
  late DateTime startDate;
  late DateTime endDate;
  late int totalMonths;

  List<ChartSampleData>? chartData;

  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    widget.milestones.sort((a, b) => a.startDate.compareTo(b.startDate));

    // Get the first and last item
    firstItem = widget.milestones.first;
    lastItem = widget.milestones.last;

    // Get the start and end dates
    startDate = DateTime.parse(firstItem.startDate);
    endDate = DateTime.parse(lastItem.endDate);

    // Calculate the total duration in months
    totalMonths = endDate.month - startDate.month + 1;

    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Jan',
          y: 45,
          yValue: 32,
          secondSeriesYValue: 30,
          thirdSeriesYValue: 18),
      ChartSampleData(
          x: 'Feb',
          y: 48,
          yValue: 34,
          secondSeriesYValue: 24,
          thirdSeriesYValue: 12),
      ChartSampleData(
          x: 'Mar',
          y: 46,
          yValue: 32,
          secondSeriesYValue: 29,
          thirdSeriesYValue: 15),
      ChartSampleData(
          x: 'Apr',
          y: 48,
          yValue: 36,
          secondSeriesYValue: 24,
          thirdSeriesYValue: 10),
      ChartSampleData(
          x: 'May',
          y: 46,
          yValue: 32,
          secondSeriesYValue: 30,
          thirdSeriesYValue: 18),
      ChartSampleData(
          x: 'Jun',
          y: 49,
          yValue: 34,
          secondSeriesYValue: 24,
          thirdSeriesYValue: 10)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Sort milestones by start date
    return _buildSplineRangeAreaChart();
  }

  // List<ChartSampleData>? chartData;

  ///Get chart with spline range area chart
  SfCartesianChart _buildSplineRangeAreaChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Product price comparison'),
      legend: const Legend(isVisible: true),
      primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 60,
          axisLine: const AxisLine(width: 0),
          labelFormat: r'${value}',
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplineAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series
  /// which need to render on the spline range area chart.
  List<ColumnSeries<ChartSampleData, String>> _getSplineAreaSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: chartData!,
        color: const Color.fromRGBO(75, 135, 185, 0.5),
        borderColor: const Color.fromRGBO(75, 135, 185, 1),
        borderWidth: 3,
        pointColorMapper: (ChartSampleData data, _) => Colors.red,
        // borderDrawMode: RangeAreaBorderMode.excludeSides,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        // highValueMapper: (ChartSampleData sales, _) => sales.y,
        // lowValueMapper: (ChartSampleData sales, _) => sales.yValue,
        name: 'Product A',
        yValueMapper: (ChartSampleData sales, _) => 88,
      ),
      ColumnSeries<ChartSampleData, String>(
        dataSource: chartData!,
        borderColor: const Color.fromRGBO(192, 108, 132, 1),
        color: const Color.fromRGBO(192, 108, 132, 0.5),
        borderWidth: 3,
        pointColorMapper: (ChartSampleData data, _) => Colors.red,

        // borderDrawMode: RangeAreaBorderMode.excludeSides,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        // highValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
        // lowValueMapper: (ChartSampleData sales, _) => sales.thirdSeriesYValue,
        name: 'Product B',
        yValueMapper: (ChartSampleData sales, _) => 55,
      )
    ];
  }

  Widget test() {
    return Container(
      width: 390,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Vertical List of Milestone Names
          Container(
            width: 200, // You can adjust this width as needed
            child: ListView.builder(
              itemCount: widget.milestones.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.milestones[index].title),
                );
              },
            ),
          ),
          // Horizontal List of Month Names
          Container(
            width: 290, // You can adjust this width as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: totalMonths,
              itemBuilder: (context, index) {
                final currentMonth = startDate.add(Duration(days: 30 * index));
                return Center(
                  child: Text(
                    "${currentMonth.month}-${currentMonth.year}",
                    style: TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
          ),
          // Progress Bars
          Container(
            width: 390 - 100 - 290, // Remaining width for progress bars
            child: ListView.builder(
              itemCount: widget.milestones.length,
              itemBuilder: (context, index) {
                final milestone = widget.milestones[index];
                final startMonth = DateTime.parse(milestone.startDate).month;
                final endMonth = DateTime.parse(milestone.endDate).month;
                final progress = milestone.progress.toDouble();

                return LinearProgressIndicator(
                  value: progress / 100,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.apple, this.orange, this.wastage);

  final String x;
  final num apple;
  final num orange;
  final num wastage;
}
class ChartSampleData {
  ChartSampleData({required this.x, required this.y, required this.yValue, required this.secondSeriesYValue, required this.thirdSeriesYValue});

  final String x;
  final num y;
  final num yValue;
  final num secondSeriesYValue;
  final num thirdSeriesYValue;
}
