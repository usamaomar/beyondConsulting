import 'package:beyond_consulting/backend/schema/structs/index.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'milestone_chart_widget.dart';

class test2 extends StatefulWidget {
  final List<MilestoneModelStruct> milestones;

  test2({required this.milestones});

  @override
  State<StatefulWidget> createState() {
    return _test();
  }
}

class _test extends State<test2> {
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
    final totalWeeks = (endDate.difference(startDate).inDays / 7).ceil();

    // Create a list of data points for the chart
    final List<ChartSampleData> chartData = widget.milestones.map((milestone) {
      final startDateTime = DateTime.parse(milestone.startDate);
      final endDateTime = DateTime.parse(milestone.endDate);
      final progress = milestone.progress.toDouble();
      final startWeekIndex = (startDateTime.difference(startDate).inDays / 7);
      final endWeekIndex = (endDateTime.difference(startDate).inDays / 7);

      return ChartSampleData(
        x: startWeekIndex,
        y: endWeekIndex,
        y2: progress,
        y3: 0,
      );
    }).toList();

    return Column(
      children: [
        // Top side: List of Milestone Name
        // Center: SfCartesianChart
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BarChart(
              BarChartData(
                titlesData: FlTitlesData(
                    leftTitles: AxisTitles(drawBelowEverything: true),
                    bottomTitles: AxisTitles(drawBelowEverything: true),
                    rightTitles: AxisTitles(drawBelowEverything: true),
                    topTitles:AxisTitles(drawBelowEverything: true,axisNameWidget: Text("${widget.milestones[0].title}"))
                    ),

                gridData: FlGridData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                barGroups: _buildBarGroups(),
                // titlesInAllAxes: true,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.blueAccent,
                  ),
                  handleBuiltInTouches: true,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < widget.milestones.length; i++) {
      MilestoneModelStruct milestone = widget.milestones[i];

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              width: 20,
              color: Colors.blue,
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              toY: milestone.progress,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      );
    }

    return barGroups;
  }
}
