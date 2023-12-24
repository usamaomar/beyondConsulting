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

class PannerProgressParCustomWidget extends StatefulWidget {
  const PannerProgressParCustomWidget(
      {Key? key, this.width, this.height, this.progress, this.color})
      : super(key: key);

  final double? width;
  final double? height;
  final double? progress;
  final Color? color;

  @override
  _PannerProgressParCustomWidgetState createState() =>
      _PannerProgressParCustomWidgetState();
}

class _PannerProgressParCustomWidgetState
    extends State<PannerProgressParCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          LinearProgressIndicator(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            minHeight: 17,
            value: (widget.progress ?? 0) / 100,
            backgroundColor: Colors.grey[300],
            valueColor:
                AlwaysStoppedAnimation<Color>(widget.color ?? Colors.grey),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                child: Container(
                  child: Text(
                    '${(widget.progress ?? 0)}%',
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 50,
                ),
                visible: (widget.progress ?? 0) <= 25,
              ),
              Visibility(
                child: Container(
                  child: Text(
                    '${(widget.progress ?? 0)}%',
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 50,
                ),
                visible:
                    (widget.progress ?? 0) > 25 && (widget.progress ?? 0) <= 50,
              ),
              Visibility(
                child: Container(
                  child: Text(
                    '${(widget.progress ?? 0)}%',
                    style: TextStyle(color: Colors.white),
                  ),
                  width: 50,
                ),
                visible: (widget.progress ?? 0) > 50,
              )
            ],
          )
        ])
      ],
    );
  }
}
