// ignore_for_file: unused_local_variable

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'select_date_shimmer_model.dart';
export 'select_date_shimmer_model.dart';

class SelectDateShimmerWidget extends StatefulWidget {
  const SelectDateShimmerWidget({super.key});

  @override
  State<SelectDateShimmerWidget> createState() =>
      _SelectDateShimmerWidgetState();
}

class _SelectDateShimmerWidgetState extends State<SelectDateShimmerWidget>
    with TickerProviderStateMixin {
  late SelectDateShimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDateShimmerModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 1500.0.ms,
            color: FlutterFlowTheme.of(context).gray300,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 1500.0.ms,
            color: FlutterFlowTheme.of(context).gray300,
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final selectDateList = List.generate(random_data.randomInteger(4, 5),
            (index) => random_data.randomName(true, false)).toList();

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            0,
            24.0,
            0,
            24.0,
          ),
          scrollDirection: Axis.vertical,
          itemCount: selectDateList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16.0),
          itemBuilder: (context, selectDateListIndex) {
            final selectDateListItem = selectDateList[selectDateListIndex];
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).gray100,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray100,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
