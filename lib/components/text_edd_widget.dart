import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'text_edd_model.dart';
export 'text_edd_model.dart';

class TextEddWidget extends StatefulWidget {
  const TextEddWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  _TextEddWidgetState createState() => _TextEddWidgetState();
}

class _TextEddWidgetState extends State<TextEddWidget> {
  late TextEddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextEddModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return TextFormField(
      controller: _model.textController,
      focusNode: _model.textFieldFocusNode,
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget.parameter1,
        labelStyle: FlutterFlowTheme.of(context).labelMedium,
        hintStyle: FlutterFlowTheme.of(context).labelMedium,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).beyondBlueColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium,
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}
