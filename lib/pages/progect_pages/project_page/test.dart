import 'package:beyond_consulting/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'milestone_chart_widget.dart';

class test extends StatefulWidget{
  final List<MilestoneModelStruct> milestones;

  test({required this.milestones});

  @override
  State<StatefulWidget> createState() {
   return _test();
  }
}

class _test extends State<test> {

  _test();

  @override
  Widget build(BuildContext context) {
    // Sort milestones by start date
    widget.milestones.sort((a, b) => a.startDate.compareTo(b.startDate));

    // Get the first and last item
    final firstItem = widget.milestones.first;
    final lastItem = widget.milestones.last;

    // Get the start and end dates
    final startDate = DateTime.parse(firstItem.startDate);
    final endDate = DateTime.parse(lastItem.endDate);

    // Calculate the total duration in weeks
    final totalWeeks = (endDate
        .difference(startDate)
        .inDays / 7).ceil();

    // Create a list of data points for the chart
    final List<ChartSampleData> chartData = widget.milestones.map((milestone) {
      final startDateTime = DateTime.parse(milestone.startDate);
      final endDateTime = DateTime.parse(milestone.endDate);
      final progress = milestone.progress.toDouble();
      final startWeekIndex = (startDateTime
          .difference(startDate)
          .inDays / 7);
      final endWeekIndex = (endDateTime
          .difference(startDate)
          .inDays / 7);

      return ChartSampleData(
        x: startWeekIndex,
        y: endWeekIndex,
        y2: progress, y3: 0,
      );
    }).toList();

    return Column(
      children: [
        // Top side: List of Milestone Name
        // Center: SfCartesianChart
        Expanded(
          child: SfCartesianChart(
            primaryYAxis: NumericAxis(
              title: AxisTitle(text: 'Weeks'),
              axisLine: AxisLine(width: 0),
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryXAxis: CategoryAxis(
              title: AxisTitle(text: 'Milestones'),
              axisLine: AxisLine(width: 0),
              majorGridLines: MajorGridLines(width: 0),
              labelPlacement: LabelPlacement.betweenTicks,
            ),
            series: <ChartSeries<ChartSampleData, double>>[
              RangeColumnSeries<ChartSampleData, double>(
                dataSource: chartData,
                xValueMapper: (ChartSampleData data, _) => data.x,
                lowValueMapper: (ChartSampleData data, _) => data.x,
                highValueMapper: (ChartSampleData data, _) => data.y,
                pointColorMapper: (ChartSampleData data, _) => data.y2 >= 50 ? Colors.green : Colors.red,
                dataLabelSettings: DataLabelSettings(isVisible: true,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}