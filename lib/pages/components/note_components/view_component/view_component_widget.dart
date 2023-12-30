import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_component_model.dart';
export 'view_component_model.dart';

class ViewComponentWidget extends StatefulWidget {
  const ViewComponentWidget({
    super.key,
    this.imagePath,
    this.filePath,
  });

  final String? imagePath;
  final String? filePath;

  @override
  _ViewComponentWidgetState createState() => _ViewComponentWidgetState();
}

class _ViewComponentWidgetState extends State<ViewComponentWidget> {
  late ViewComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.imagePath != null && widget.imagePath != '')
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.imagePath!,
                  width: 400.0,
                  height: 400.0,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          if (widget.filePath != null && widget.filePath != '')
            Flexible(
              child: FlutterFlowPdfViewer(
                networkPath: widget.filePath!,
                width: 400.0,
                height: 400.0,
                horizontalScroll: false,
              ),
            ),
        ],
      ),
    );
  }
}
