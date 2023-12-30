import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'all_cost_drop_component_model.dart';
export 'all_cost_drop_component_model.dart';

class AllCostDropComponentWidget extends StatefulWidget {
  const AllCostDropComponentWidget({
    super.key,
    this.parameter1,
    required this.costId,
    this.action,
  });

  final String? parameter1;
  final int? costId;
  final Future<dynamic> Function(String)? action;

  @override
  _AllCostDropComponentWidgetState createState() =>
      _AllCostDropComponentWidgetState();
}

class _AllCostDropComponentWidgetState
    extends State<AllCostDropComponentWidget> {
  late AllCostDropComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllCostDropComponentModel());

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
            '6p30a1fk' /* Pending */,
          ),
          FFLocalizations.of(context).getText(
            'jxzxu3m4' /* Approved */,
          ),
          FFLocalizations.of(context).getText(
            'mbsqx9ei' /* Rejected */,
          )
        ],
        onChanged: (val){
          setState(() => _model.dropDownValue = val);
          widget.action!(val!);
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
