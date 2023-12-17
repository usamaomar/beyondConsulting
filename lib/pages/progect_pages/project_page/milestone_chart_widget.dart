import 'package:beyond_consulting/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class MilestoneChartWidget extends StatelessWidget {
  final List<MilestoneModelStruct> milestones;

  MilestoneChartWidget({required this.milestones});

  @override
  Widget build(BuildContext context) {
    // Sort milestones by start date
    milestones.sort((a, b) => a.startDate.compareTo(b.startDate));

    // Get the first and last item
    final firstItem = milestones.first;
    final lastItem = milestones.last;

    // Get the start and end dates
    final startDate = DateTime.parse(firstItem.startDate);
    final endDate = DateTime.parse(lastItem.endDate);

    // Calculate the total duration in weeks
    final totalWeeks = (endDate.difference(startDate).inDays / 7).ceil();

    // Create a list of data points for the chart
    final List<ChartSampleData> chartData = milestones.map((milestone) {
      final startDateTime = DateTime.parse(milestone.startDate);
      final endDateTime = DateTime.parse(milestone.endDate);
      final progress = milestone.progress.toDouble();
      final itemDuration = endDateTime.difference(startDateTime).inDays / 7;

      return ChartSampleData(
        x: milestones.indexOf(milestone).toDouble(),
        y: startDateTime.difference(startDate).inDays / 7,
        y2: itemDuration,
        y3: progress,
      );
    }).toList();
    return SfCartesianChart(
      primaryXAxis: NumericAxis(
        title: AxisTitle(text: 'Weeks'), // Switched the title to 'Weeks'
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        labelFormat: '{value}W',
        interval: 4,
      ),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Milestones'), // Switched the title to 'Milestones'
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        interval: 1,
      ),
      series: <ChartSeries<ChartSampleData, double>>[
        RangeColumnSeries<ChartSampleData, double>( // Keep using RangeColumnSeries for vertical bars
          dataSource: chartData,
          xValueMapper: (ChartSampleData data, _) => data.x,
          lowValueMapper: (ChartSampleData data, _) => data.y,
          highValueMapper: (ChartSampleData data, _) => data.y + data.y2,
          pointColorMapper: (ChartSampleData data, _) =>
          data.y3 >= 50 ? Colors.green : Colors.red,
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
    // return SfCartesianChart(
    //   primaryXAxis: NumericAxis(
    //     title: AxisTitle(text: 'Milestones'),
    //     majorGridLines: MajorGridLines(width: 0),
    //     axisLine: AxisLine(width: 0),
    //     majorTickLines: MajorTickLines(size: 0),
    //     edgeLabelPlacement: EdgeLabelPlacement.shift,
    //     interval: 1,
    //   ),
    //   primaryYAxis: NumericAxis(
    //     title: AxisTitle(text: 'Weeks'),
    //     axisLine: AxisLine(width: 0),
    //     majorTickLines: MajorTickLines(size: 0),
    //     labelFormat: '{value}W',
    //     interval: 4,
    //   ),
    //   series: <ChartSeries<ChartSampleData, double>>[
    //     RangeColumnSeries<ChartSampleData, double>(
    //       dataSource: chartData,
    //       xValueMapper: (ChartSampleData data, _) => data.x,
    //       lowValueMapper: (ChartSampleData data, _) => data.y,
    //       highValueMapper: (ChartSampleData data, _) => data.y + data.y2,
    //       pointColorMapper: (ChartSampleData data, _) =>
    //       data.y3 >= 50 ? Colors.green : Colors.red,
    //       dataLabelSettings: DataLabelSettings(isVisible: true),
    //     ),
    //   ],
    // );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: MilestoneChartWidget(
//         milestones: [
//           MilestoneModelStruct(
//             id: 1,
//             title: "Milestone 1",
//             description: "Description 1",
//             amount: 100,
//             reminderOffset: 0,
//             startDate: "2023-12-01T14:04:58.063Z",
//             endDate: "2023-12-10T14:04:58.063Z",
//             status: 0,
//             milestoneType: 0,
//             progress: 50,
//             invoiceUrl: "invoice1",
//             invoiceStatus: 0,
//           ),
//           MilestoneModelStruct(
//             id: 2,
//             title: "Milestone 2",
//             description: "Description 2",
//             amount: 150,
//             reminderOffset: 0,
//             startDate: "2023-12-05T14:04:58.063Z",
//             endDate: "2023-12-15T14:04:58.063Z",
//             status: 0,
//             milestoneType: 0,
//             progress: 80,
//             invoiceUrl: "invoice2",
//             invoiceStatus: 0,
//           ),
//           MilestoneModelStruct(
//             id: 3,
//             title: "Milestone 3",
//             description: "Description 3",
//             amount: 200,
//             reminderOffset: 0,
//             startDate: "2023-12-12T14:04:58.063Z",
//             endDate: "2023-12-20T14:04:58.063Z",
//             status: 0,
//             milestoneType: 0,
//             progress: 30,
//             invoiceUrl: "invoice3",
//             invoiceStatus: 0,
//           ),
//         ],
//       ),
//     ),
//   ));
// }

class ChartSampleData {
  ChartSampleData({required this.x, required this.y, required this.y2, required this.y3});
  final double x;
  final double y;
  final double y2;
  final double y3;
}