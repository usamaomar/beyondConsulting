import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'read_member_cpacity_model.dart';
export 'read_member_cpacity_model.dart';

class ReadMemberCpacityWidget extends StatefulWidget {
  const ReadMemberCpacityWidget({
    super.key,
    required this.memberName,
    required this.projectType,
    required this.imagePath,
    required this.currentCapacity,
  });

  final String? memberName;
  final String? projectType;
  final String? imagePath;
  final int? currentCapacity;

  @override
  _ReadMemberCpacityWidgetState createState() =>
      _ReadMemberCpacityWidgetState();
}

class _ReadMemberCpacityWidgetState extends State<ReadMemberCpacityWidget> {
  late ReadMemberCpacityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReadMemberCpacityModel());

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

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width > 390.0 ? 150.0 : 75.0,
            height: MediaQuery.sizeOf(context).width > 390.0 ? 150.0 : 75.0,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.1),
                  child: Icon(
                    Icons.lock,
                    color: () {
                      if (widget.currentCapacity == 0) {
                        return const Color(0xFFE9E9E9);
                      } else if (widget.currentCapacity == 1) {
                        return const Color(0xFF9DCD5A);
                      } else if (widget.currentCapacity == 2) {
                        return const Color(0xFFFFD612);
                      } else if (widget.currentCapacity! >= 3) {
                        return const Color(0xFFEA2903);
                      } else {
                        return const Color(0x00000000);
                      }
                    }(),
                    size:
                        MediaQuery.sizeOf(context).width > 390.0 ? 30.0 : 15.0,
                  ),
                ),
                Container(
                  width:
                      MediaQuery.sizeOf(context).width > 390.0 ? 130.0 : 55.0,
                  height:
                      MediaQuery.sizeOf(context).width > 390.0 ? 130.0 : 55.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(75.0),
                          bottomRight: Radius.circular(75.0),
                          topLeft: Radius.circular(75.0),
                          topRight: Radius.circular(75.0),
                        ),
                        child: Image.network(
                          functions.getFullImage(widget.imagePath!)!,
                          width: MediaQuery.sizeOf(context).width > 390.0
                              ? 130.0
                              : 55.0,
                          height: MediaQuery.sizeOf(context).width > 390.0
                              ? 130.0
                              : 55.0,
                          fit: BoxFit.cover,
                          alignment: const Alignment(0.0, 0.0),
                        ),
                      ),
                      if (widget.currentCapacity == 0 ? true : false)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/svgviewer-output_(2).svg',
                            width: MediaQuery.sizeOf(context).width > 390.0
                                ? 140.0
                                : 65.0,
                            height: MediaQuery.sizeOf(context).width > 390.0
                                ? 140.0
                                : 65.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      if (widget.currentCapacity == 2 ? true : false)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/Group_2082.svg',
                            width: MediaQuery.sizeOf(context).width > 390.0
                                ? 140.0
                                : 65.0,
                            height: MediaQuery.sizeOf(context).width > 390.0
                                ? 140.0
                                : 65.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      if (widget.currentCapacity! >= 3 ? true : false)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/svgviewer-output_(1).svg',
                            width: MediaQuery.sizeOf(context).width > 390.0
                                ? 140.0
                                : 65.0,
                            height: MediaQuery.sizeOf(context).width > 390.0
                                ? 140.0
                                : 65.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      if (widget.currentCapacity == 1 ? true : false)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: SvgPicture.asset(
                            'assets/images/Group_2085.svg',
                            width: MediaQuery.sizeOf(context).width > 390.0
                                ? 140.0
                                : 65.0,
                            height: MediaQuery.sizeOf(context).width > 390.0
                                ? 140.0
                                : 65.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.memberName!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Almarai',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                widget.projectType!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Almarai',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}