import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'clint_drop_douwn_list_component_model.dart';
export 'clint_drop_douwn_list_component_model.dart';

class ClintDropDouwnListComponentWidget extends StatefulWidget {
  const ClintDropDouwnListComponentWidget({
    super.key,
    required this.hintName,
  });

  final String? hintName;

  @override
  _ClintDropDouwnListComponentWidgetState createState() =>
      _ClintDropDouwnListComponentWidgetState();
}

class _ClintDropDouwnListComponentWidgetState
    extends State<ClintDropDouwnListComponentWidget> {
  late ClintDropDouwnListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClintDropDouwnListComponentModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width < 400.0 ? 310.0 : 520.0,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      functions.getFullImage(functions
                          .findeMatchingClient(
                              FFAppState().newProjectCreatedModel.clientId,
                              FFAppState().clientList.toList())!
                          .logoImageUrl)!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Text(
                    widget.hintName!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Almarai',
                          color: const Color(0xFF808080),
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ],
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
