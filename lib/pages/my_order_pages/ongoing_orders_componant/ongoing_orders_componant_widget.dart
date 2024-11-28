import '/backend/api_requests/api_calls.dart';
import '/components/blank_componant_widget.dart';
import '/components/order_main_list_shimmer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/search_pages/no_order_set_componant/no_order_set_componant_widget.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'ongoing_orders_componant_model.dart';
export 'ongoing_orders_componant_model.dart';

class OngoingOrdersComponantWidget extends StatefulWidget {
  const OngoingOrdersComponantWidget({super.key});

  @override
  State<OngoingOrdersComponantWidget> createState() =>
      _OngoingOrdersComponantWidgetState();
}

class _OngoingOrdersComponantWidgetState
    extends State<OngoingOrdersComponantWidget> {
  late OngoingOrdersComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OngoingOrdersComponantModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        if (FFAppState().connected) {
          return FutureBuilder<ApiCallResponse>(
            future: CarServiceGroup.getBookedDetailsApiCall.call(
              userId: FFAppState().userId,
              token: FFAppState().token,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    width: 0.0,
                    height: 0.0,
                    child: BlankComponantWidget(),
                  ),
                );
              }

              final listViewGetBookedDetailsApiResponse = snapshot.data!;
              print(
                  'API Response Received: ${listViewGetBookedDetailsApiResponse.jsonBody}');

              final ongoingOrdersList = CarServiceGroup.getBookedDetailsApiCall
                      .bookingDetailsList(
                        listViewGetBookedDetailsApiResponse.jsonBody,
                      )
                      ?.where((e) =>
                          ('confirmed' ==
                              getJsonField(
                                e,
                                r'''$.orderStatus''',
                              ).toString()) ||
                          ('pending' ==
                              getJsonField(
                                e,
                                r'''$.orderStatus''',
                              ).toString()))
                      .toList()
                      .toList() ??
                  [];

              if (ongoingOrdersList.isEmpty) {
                return const Center(
                  child: SizedBox(
                    height: 208.0,
                    child: NoOrderSetComponantWidget(),
                  ),
                );
              }

              return RefreshIndicator(
                key: const Key('RefreshIndicator_pnc7l8g4'),
                color: FlutterFlowTheme.of(context).primary,
                onRefresh: () async {
                  setState(() => _model.apiRequestCompleter = null);
                  await _model.waitForApiRequestCompleted();
                },
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    0,
                    24.0,
                    0,
                    24.0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: ongoingOrdersList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                  itemBuilder: (context, ongoingOrdersListIndex) {
                    final ongoingOrdersListItem =
                        ongoingOrdersList[ongoingOrdersListIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'MyOrderDetailPage',
                          queryParameters: {
                            'image': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.packageDetails.image''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'title': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.packageDetails.title''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'price': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.Total''',
                              ),
                              ParamType.double,
                            ),
                            'bookingDate': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.bookingDate''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'bookingTime': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.bookingTime''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'packageId': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.packageDetails.packageId''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'bookingId': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.id''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'status': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.orderStatus''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'serviceId': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.serviceDetails.serviceId''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'serviceName': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.serviceDetails.name''',
                              ).toString(),
                              ParamType.String,
                            ),
                            'serviceImage': serializeParam(
                              getJsonField(
                                ongoingOrdersListItem,
                                r'''$.serviceDetails.image''',
                              ).toString(),
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: CachedNetworkImage(
                                  fadeInDuration:
                                      const Duration(milliseconds: 200),
                                  fadeOutDuration:
                                      const Duration(milliseconds: 200),
                                  imageUrl:
                                      '${FFAppConstants.imageUrl}${getJsonField(
                                    ongoingOrdersListItem,
                                    r'''$.packageDetails.image''',
                                  ).toString()}',
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order ID: #${getJsonField(
                                          ongoingOrdersListItem,
                                          r'''$.orderNo''',
                                        ).toString()}',
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray400,
                                              fontSize: 16.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        getJsonField(
                                          ongoingOrdersListItem,
                                          r'''$.packageDetails.title''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Text(
                                        '${getJsonField(ongoingOrdersListItem, r'''$.Total''').toDouble().toStringAsFixed(2)}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final status = getJsonField(
                                            ongoingOrdersListItem,
                                            r'''$.orderStatus''',
                                          ).toString();
                                          return Text(
                                            '${status[0].toUpperCase()}${status.substring(1)}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: status == 'pending'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .warning
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .success,
                                                  fontSize: 16.0,
                                                  useGoogleFonts: false,
                                                ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
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
    );
  }
}
