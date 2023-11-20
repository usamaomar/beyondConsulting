// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
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
    extends State<PannerProgressParCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          CircularProgressIndicator(
            strokeWidth: 17,
            value: (widget.progress ?? 0) / 100,
            backgroundColor: Colors.grey[300],
            valueColor:
                AlwaysStoppedAnimation<Color>(widget.color ?? Colors.grey),
          ),
        ])
      ],
    );
  }
}
