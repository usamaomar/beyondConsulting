import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'type_drop_douwn_list_component_model.dart';
export 'type_drop_douwn_list_component_model.dart';

class TypeDropDouwnListComponentWidget extends StatefulWidget {
  const TypeDropDouwnListComponentWidget({
    super.key,
    required this.hintName,
  });

  final String? hintName;

  @override
  State<TypeDropDouwnListComponentWidget> createState() =>
      _TypeDropDouwnListComponentWidgetState();
}

class _TypeDropDouwnListComponentWidgetState
    extends State<TypeDropDouwnListComponentWidget> {
  late TypeDropDouwnListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TypeDropDouwnListComponentModel());

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
                if (FFAppState().newProjectCreatedModel.type != 0)
                  Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: () {
                        if (FFAppState().newProjectCreatedModel.type == 4) {
                          return FFAppState().projectTypesList[0].color;
                        } else if (FFAppState().newProjectCreatedModel.type ==
                            2) {
                          return FFAppState().projectTypesList[1].color;
                        } else if (FFAppState().newProjectCreatedModel.type ==
                            1) {
                          return FFAppState().projectTypesList[2].color;
                        } else {
                          return const Color(0x00000000);
                        }
                      }(),
                      borderRadius: BorderRadius.circular(50.0),
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
