import 'package:beyond_consulting/backend/schema/structs/index.dart';
import 'package:fl_chart/fl_chart.dart'; // Example using fl_chart
import 'package:flutter/material.dart';

class MilestoneGraph extends StatelessWidget {
  final List<MilestoneModelStruct> milestones;

  const MilestoneGraph({Key? key, required this.milestones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate dimensions and spacing
    int totalMonths = 2;
    double milestoneHeight = 40;

    return AspectRatio(
      aspectRatio: 1.5, // Adjust as needed
      child: Container(
        padding: const EdgeInsets.all(10),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: milestones.map((milestone) {
                  double x = _calculateXPosition(DateTime.parse(milestone.startDate), totalMonths);
                  double y = milestoneHeight * milestones.indexOf(milestone);
                  return FlSpot(x, y);
                }).toList(),
                isCurved: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color:Color.fromRGBO(255, 255, 255, 55),
                ),
              ),
            ],
            // Add axes, titles, and styling as needed
          ),
        ),
      ),
    );
  }

  double _calculateXPosition(DateTime startDate, int totalMonths) {
    int startMonth = startDate.month;

    // Normalize the start month to a value between 0 and 1, representing its position on the graph
    double normalizedStartMonth = (startMonth - 1) / (totalMonths - 1);

    return normalizedStartMonth;
  }
}