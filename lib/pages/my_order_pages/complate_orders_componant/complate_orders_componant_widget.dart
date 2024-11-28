import '/backend/api_requests/api_calls.dart';
import '/components/blank_componant_widget.dart';
import '/components/order_main_list_shimmer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/search_pages/no_order_set_componant/no_order_set_componant_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'complate_orders_componant_model.dart';
export 'complate_orders_componant_model.dart';

class ComplateOrdersComponantWidget extends StatefulWidget {
  const ComplateOrdersComponantWidget({super.key});

  @override
  State<ComplateOrdersComponantWidget> createState() =>
      _ComplateOrdersComponantWidgetState();
}

class _ComplateOrdersComponantWidgetState
    extends State<ComplateOrdersComponantWidget> {
  late ComplateOrdersComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComplateOrdersComponantModel());
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
            future: FFAppState()
                .complateOrderCache(
              uniqueQueryKey: FFAppState().userId,
              requestFn: () => CarServiceGroup.completedOrdersApiCall.call(
                userId: FFAppState().userId,
                token: FFAppState().token,
              ),
            )
                .then((result) {
              try {
                _model.apiRequestCompleted = true;
                _model.apiRequestLastUniqueKey = FFAppState().userId;
              } finally {}
              return result;
            }),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: OrderMainListShimmerWidget(),
                );
              }
              final listViewCompletedOrdersApiResponse = snapshot.data!;

              return Builder(
                builder: (context) {
                  final completedOrdersList =
                      CarServiceGroup.completedOrdersApiCall
                              .bookingDetailsList(
                                listViewCompletedOrdersApiResponse.jsonBody,
                              )
                              ?.toList() ??
                          [];
                  if (completedOrdersList.isEmpty) {
                    return const Center(
                      child: SizedBox(
                        height: 208.0,
                        child: NoOrderSetComponantWidget(),
                      ),
                    );
                  }

                  return RefreshIndicator(
                    key: const Key('RefreshIndicator_zre8o158'),
                    color: FlutterFlowTheme.of(context).primary,
                    onRefresh: () async {
                      setState(() {
                        FFAppState().clearComplateOrderCacheCacheKey(
                            _model.apiRequestLastUniqueKey);
                        _model.apiRequestCompleted = false;
                      });
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
                      itemCount: completedOrdersList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                      itemBuilder: (context, completedOrdersListIndex) {
                        final completedOrdersListItem =
                            completedOrdersList[completedOrdersListIndex];
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
                                    completedOrdersListItem,
                                    r'''$.packageDetails.image''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                                'title': serializeParam(
                                  getJsonField(
                                    completedOrdersListItem,
                                    r'''$.packageDetails.title''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                                'price': serializeParam(
                                  getJsonField(
                                    completedOrdersListItem,
                                    r'''$.Total''',
                                  ),
                                  ParamType.double,
                                ),
                                'bookingDate': serializeParam(
                                  getJsonField(
                                    completedOrdersListItem,
                                    r'''$.bookingDate''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                                'packageId': serializeParam(
                                  getJsonField(
                                    completedOrdersListItem,
                                    r'''$.packageDetails.packageId''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                                'bookingId': serializeParam(
                                  getJsonField(
                                    completedOrdersListItem,
                                    r'''$.id''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                                'bookingTime': serializeParam(
                                  getJsonField(
                                    completedOrdersListItem,
                                    r'''$.bookingTime''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                                'status': serializeParam(
                                  getJsonField(
                                    completedOrdersListItem,
                                    r'''$.orderStatus''',
                                  ).toString(),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
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
                                        completedOrdersListItem,
                                        r'''$.packageDetails.image''',
                                      ).toString()}',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                              completedOrdersListItem,
                                              r'''$.orderNo''',
                                            ).toString()}',
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray400,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                          Text(
                                            getJsonField(
                                              completedOrdersListItem,
                                              r'''$.packageDetails.title''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.2,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                functions
                                                    .roundToTwoDecimalPlaces(
                                                        getJsonField(
                                                      completedOrdersListItem,
                                                      r'''$.Total''',
                                                    ).toDouble())
                                                    .toString(),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            functions
                                                .capitalizeFirst(getJsonField(
                                              completedOrdersListItem,
                                              r'''$.orderStatus''',
                                            ).toString()),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.5,
                                                ),
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
