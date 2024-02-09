import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'stick_model.dart';
export 'stick_model.dart';

class StickWidget extends StatefulWidget {
  const StickWidget({super.key});

  @override
  State<StickWidget> createState() => _StickWidgetState();
}

class _StickWidgetState extends State<StickWidget> {
  late StickModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StickModel());

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
      alignment: const AlignmentDirectional(0.0, 1.0),
      children: [
        Container(
          width: 25.0,
          height: 25.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.circle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: SvgPicture.asset(
              'assets/images/Path_21632.svg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
