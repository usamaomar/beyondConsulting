import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'text_drop_douwn_list_component_model.dart';
export 'text_drop_douwn_list_component_model.dart';

class TextDropDouwnListComponentWidget extends StatefulWidget {
  const TextDropDouwnListComponentWidget({
    super.key,
    required this.hintName,
  });

  final String? hintName;

  @override
  State<TextDropDouwnListComponentWidget> createState() =>
      _TextDropDouwnListComponentWidgetState();
}

class _TextDropDouwnListComponentWidgetState
    extends State<TextDropDouwnListComponentWidget> {
  late TextDropDouwnListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextDropDouwnListComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.hintName!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Almarai',
                    color: const Color(0xFF808080),
                    useGoogleFonts: false,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 11.0),
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
