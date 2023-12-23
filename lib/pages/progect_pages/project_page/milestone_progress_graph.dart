import 'package:beyond_consulting/backend/schema/structs/index.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MilestoneProgressGraph extends StatelessWidget {
  final List<MilestoneModelStruct> milestones;

  MilestoneProgressGraph({required this.milestones});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Milestone Progress Graph'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget:(value,vv) =>  Text(vv.formattedValue,style: TextStyle(color: Colors.black) ,))),
              bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget:(value,vv) =>  Text('title2',style: TextStyle(color: Colors.black) ,))),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            barGroups: milestones.map((milestone) {
              return BarChartGroupData(
                x: milestones.indexOf(milestone),
                barRods: [
                  BarChartRodData(
                    color: Colors.blue,
                    width: 16, toY: milestone.progress,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
