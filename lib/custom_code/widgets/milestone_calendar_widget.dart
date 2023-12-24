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

class MilestoneCalendarWidget extends StatefulWidget {
  const MilestoneCalendarWidget({
    Key? key,
    this.width,
    this.height,
    required this.milestones,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<DateTime> milestones;

  @override
  _MilestoneCalendarWidgetState createState() =>
      _MilestoneCalendarWidgetState();
}

class _MilestoneCalendarWidgetState extends State<MilestoneCalendarWidget> {
  late DateTime currentDate;
  late DateTime firstDay;
  late DateTime lastDay;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    firstDay = DateTime(currentDate.year, currentDate.month, 1);
    lastDay = DateTime(currentDate.year, currentDate.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        _buildCalendarGrid(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: List.generate(7, (index) {
        final dayName =
            DateFormat('E').format(firstDay.add(Duration(days: index)));
        return Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.grey[300],
            child: Center(
              child: Text(dayName),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 2,
      ),
      itemBuilder: (context, index) {
        final day = firstDay.add(Duration(days: index));
        final isEndDay = widget.milestones.contains(day);
        return Container(
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isEndDay ? Colors.red : null,
            border: isEndDay ? Border.all(color: Colors.red) : null,
          ),
          child: Center(
            child: Text(
              day.day.toString(),
              style: TextStyle(
                fontWeight: isEndDay ? FontWeight.bold : FontWeight.normal,
                color: isEndDay ? Colors.white : null,
              ),
            ),
          ),
        );
      },
      itemCount: lastDay.day,
    );
  }
}
