// Automatic FlutterFlow imports
import '/backend/backend.dart';
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

class CircularProgressParCustomWidget extends StatefulWidget {
  const CircularProgressParCustomWidget(
      {Key? key, this.width, this.height, this.progress, this.color})
      : super(key: key);

  final double? width;
  final double? height;
  final double? progress;
  final Color? color;

  @override
  _CircularProgressParCustomWidgetState createState() =>
      _CircularProgressParCustomWidgetState();
}

class _CircularProgressParCustomWidgetState
    extends State<CircularProgressParCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 160,
          child: CircularProgressIndicator(
            strokeCap: StrokeCap.round,
            strokeWidth: 12,
            value: (widget.progress ?? 0) / 100,
            backgroundColor: Colors.grey[300],
            valueColor:
                AlwaysStoppedAnimation<Color>(widget.color ?? Colors.grey),
          ),
        )
      ],
    );
  }
}
