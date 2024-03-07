import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'read_member_cpacity_model.dart';
export 'read_member_cpacity_model.dart';

class ReadMemberCpacityWidget extends StatefulWidget {
  const ReadMemberCpacityWidget({
    super.key,
    required this.memberName,
    required this.projectType,
    required this.imagePath,
    required this.currentCapacity,
    this.listOfProjects,
  });

  final String? memberName;
  final String? projectType;
  final String? imagePath;
  final int? currentCapacity;
  final List<ProjectModelStruct>? listOfProjects;

  @override
  State<ReadMemberCpacityWidget> createState() =>
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width > 390.0 ? 100.0 : 75.0,
            height: MediaQuery.sizeOf(context).width > 390.0 ? 100.0 : 75.0,
            child: Stack(
              alignment: const AlignmentDirectional(0.0, 0.0),
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          functions.getFullImage(widget.imagePath!)!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      CircularPercentIndicator(
                        percent: () {
                          if (widget.currentCapacity == 0) {
                            return 0.0;
                          } else if (widget.currentCapacity == 1) {
                            return 0.25;
                          } else if (widget.currentCapacity == 2) {
                            return 0.75;
                          } else {
                            return 1.0;
                          }
                        }(),
                        radius: 50.0,
                        lineWidth: 6.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: () {
                          if (widget.currentCapacity == 0) {
                            return const Color(0xFFECECEC);
                          } else if (widget.currentCapacity == 1) {
                            return const Color(0xFF0BF352);
                          } else if (widget.currentCapacity == 2) {
                            return const Color(0xFFFFEC59);
                          } else {
                            return FlutterFlowTheme.of(context).error;
                          }
                        }(),
                        backgroundColor: FlutterFlowTheme.of(context).accent4,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.1, -1.2),
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
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    height: 50.0,
                    decoration: const BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final lia = widget.listOfProjects
                                ?.map((e) => e)
                                .toList()
                                .toList() ??
                            [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: lia.length,
                          itemBuilder: (context, liaIndex) {
                            final liaItem = lia[liaIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: Text(
                                liaItem.name,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
