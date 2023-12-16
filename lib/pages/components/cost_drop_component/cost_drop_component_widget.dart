import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cost_drop_component_model.dart';
export 'cost_drop_component_model.dart';

class CostDropComponentWidget extends StatefulWidget {
  const CostDropComponentWidget({
    super.key,
    this.parameter1,
    required this.costId,
  });

  final String? parameter1;
  final int? costId;

  @override
  _CostDropComponentWidgetState createState() =>
      _CostDropComponentWidgetState();
}

class _CostDropComponentWidgetState extends State<CostDropComponentWidget> {
  late CostDropComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CostDropComponentModel());

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

    return Visibility(
      visible: () {
        if (FFAppState().userModelAppState.accessRole.toString() == '0') {
          return true;
        } else if (FFAppState().userModelAppState.accessRole.toString() ==
            '1') {
          return true;
        } else if (FFAppState().userModelAppState.accessRole.toString() ==
            '5') {
          return true;
        } else {
          return false;
        }
      }(),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(null),
        options: [
          FFLocalizations.of(context).getText(
            'dk28h0ck' /* Pending */,
          ),
          FFLocalizations.of(context).getText(
            'cr6o15rt' /* Approved */,
          ),
          FFLocalizations.of(context).getText(
            '1dk4akoh' /* Rejected */,
          )
        ],
        onChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          _model.apiResultz7x = await UpdateCostStatusApiCall.call(
            token: FFAppState().tokenModelAppState.token,
            costId: widget.costId,
            isApproved: functions
                        .getCostStatusId(
                            FFLocalizations.of(context).languageCode,
                            _model.dropDownValue!)
                        .toString() ==
                    '1'
                ? true
                : false,
          );
          if ((_model.apiResultz7x?.succeeded ?? true)) {
            setState(() {});
          }

          setState(() {});
        },
        width: 300.0,
        height: 50.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium,
        hintText: widget.parameter1,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: FlutterFlowTheme.of(context).alternate,
        borderWidth: 2.0,
        borderRadius: 8.0,
        margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
        hidesUnderline: true,
        isOverButton: true,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }
}
