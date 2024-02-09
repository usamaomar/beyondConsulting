import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'satisfaction_component_main_dash_board_model.dart';
export 'satisfaction_component_main_dash_board_model.dart';

class SatisfactionComponentMainDashBoardWidget extends StatefulWidget {
  const SatisfactionComponentMainDashBoardWidget({
    super.key,
    required this.satisfactionType,
  });

  final int? satisfactionType;

  @override
  State<SatisfactionComponentMainDashBoardWidget> createState() =>
      _SatisfactionComponentMainDashBoardWidgetState();
}

class _SatisfactionComponentMainDashBoardWidgetState
    extends State<SatisfactionComponentMainDashBoardWidget> {
  late SatisfactionComponentMainDashBoardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => SatisfactionComponentMainDashBoardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.satisfactionLocalsList = FFAppState()
            .clintSatisfactionList
            .toList()
            .cast<SatisfactionModelStruct>();
      });
    });

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

    return ClipRRect(
      child: Container(
        height: 100.0,
        decoration: const BoxDecoration(),
        child: Builder(
          builder: (context) {
            final listOfsatisfactionLocal =
                FFAppState().clintSatisfactionList.map((e) => e).toList();
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                5.0,
                0,
                55.0,
                0,
              ),
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listOfsatisfactionLocal.length,
              separatorBuilder: (_, __) => const SizedBox(width: 15.0),
              itemBuilder: (context, listOfsatisfactionLocalIndex) {
                final listOfsatisfactionLocalItem =
                    listOfsatisfactionLocal[listOfsatisfactionLocalIndex];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.tag_faces_rounded,
                      color: listOfsatisfactionLocalItem.type ==
                              widget.satisfactionType
                          ? listOfsatisfactionLocalItem.color
                          : listOfsatisfactionLocalItem.notColor,
                      size: 55.0,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Container(
                        width: 55.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          color: listOfsatisfactionLocalItem.type ==
                                  widget.satisfactionType
                              ? listOfsatisfactionLocalItem.color
                              : listOfsatisfactionLocalItem.notColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
