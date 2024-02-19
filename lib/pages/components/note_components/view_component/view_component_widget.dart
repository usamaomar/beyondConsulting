import '../../../../flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_component_model.dart';
export 'view_component_model.dart';
import 'dart:html' as html;


class ViewComponentWidget extends StatefulWidget {
  const ViewComponentWidget({
    super.key,
    this.imagePath,
    this.filePath,
  });

  final String? imagePath;
  final String? filePath;

  @override
  State<ViewComponentWidget> createState() => _ViewComponentWidgetState();
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
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.imagePath != null && widget.imagePath != '')
                  Flexible(
                    child: ClipRRect(
                      child: Image.network(
                        widget.imagePath!,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                if (widget.filePath != null && widget.filePath != '')
                  Flexible(
                    child: FlutterFlowPdfViewer(
                      networkPath: widget.filePath!,
                      horizontalScroll: false,
                    ),
                  ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),

              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          height: 50,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {

                        // if(widget.imagePath==null){
                        //
                        //
                        //
                        // }
                        //
                        //
                        // downloadFileFromUrl(widget.imagePath?.isEmpty ? widget.imagePath : widget.imagePath);
                      },
                      child: Icon(
                        Icons.security_update,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  void downloadFileFromUrl(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = '';
    anchorElement.click();
  }
}
