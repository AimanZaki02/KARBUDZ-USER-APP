import '/components/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/my_order_pages/cancel_orders_componant/cancel_orders_componant_widget.dart';
import '/pages/my_order_pages/complate_orders_componant/complate_orders_componant_widget.dart';
import '/pages/my_order_pages/ongoing_orders_componant/ongoing_orders_componant_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'my_order_componant_model.dart';
export 'my_order_componant_model.dart';

class MyOrderComponantWidget extends StatefulWidget {
  const MyOrderComponantWidget({super.key});

  @override
  State<MyOrderComponantWidget> createState() => _MyOrderComponantWidgetState();
}

class _MyOrderComponantWidgetState extends State<MyOrderComponantWidget>
    with TickerProviderStateMixin {
  late MyOrderComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyOrderComponantModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        wrapWithModel(
          model: _model.singleAppbarModel,
          updateCallback: () => setState(() {}),
          child: const SingleAppbarWidget(
            title: 'My order',
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              if (FFAppState().connected) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primary,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).gray400,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'SF Pro Display',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          padding: const EdgeInsets.all(4.0),
                          tabs: const [
                            Tab(
                              text: 'Ongoing',
                            ),
                            Tab(
                              text: 'Canceled',
                            ),
                            Tab(
                              text: 'Completed',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [
                              () async {
                                FFAppState().clearOngoingOrderCacheCache();
                              },
                              () async {
                                FFAppState().clearCancleOrderCacheCache();
                              },
                              () async {
                                FFAppState().clearComplateOrderCacheCache();
                              }
                            ][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            wrapWithModel(
                              model: _model.ongoingOrdersComponantModel,
                              updateCallback: () => setState(() {}),
                              child: const OngoingOrdersComponantWidget(),
                            ),
                            wrapWithModel(
                              model: _model.cancelOrdersComponantModel,
                              updateCallback: () => setState(() {}),
                              child: const CancelOrdersComponantWidget(),
                            ),
                            wrapWithModel(
                              model: _model.complateOrdersComponantModel,
                              updateCallback: () => setState(() {}),
                              child: const ComplateOrdersComponantWidget(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Lottie.asset(
                    'assets/lottie_animations/No_Wifi.json',
                    width: 150.0,
                    height: 130.0,
                    fit: BoxFit.contain,
                    animate: true,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
