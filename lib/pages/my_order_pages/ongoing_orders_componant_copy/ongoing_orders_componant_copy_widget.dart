import '/backend/api_requests/api_calls.dart';
import '/components/blank_componant_widget.dart';
import '/components/order_main_list_shimmer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/search_pages/no_order_set_componant/no_order_set_componant_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'ongoing_orders_componant_copy_model.dart';
export 'ongoing_orders_componant_copy_model.dart';

class OngoingOrdersComponantCopyWidget extends StatefulWidget {
  const OngoingOrdersComponantCopyWidget({super.key});

  @override
  State<OngoingOrdersComponantCopyWidget> createState() =>
      _OngoingOrdersComponantCopyWidgetState();
}

class _OngoingOrdersComponantCopyWidgetState
    extends State<OngoingOrdersComponantCopyWidget> {
  late OngoingOrdersComponantCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OngoingOrdersComponantCopyModel());
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
            future: CarServiceGroup.currencyApiCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    width: 0.0,
                    height: 0.0,
                    child: BlankComponantWidget(),
                  ),
                );
              }
              final containerCurrencyApiResponse = snapshot.data!;

              return Container(
                decoration: const BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    if (FFAppState().isVerified == true) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??= Completer<
                                  ApiCallResponse>()
                                ..complete(
                                    CarServiceGroup.ongoingOrdersApiCall.call(
                                  userId: FFAppState().userId,
                                  token: FFAppState().token,
                                )))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return const Center(
                                child: OrderMainListShimmerWidget(),
                              );
                            }
                            final listViewOngoingOrdersApiResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final ongoingOrdersList =
                                    CarServiceGroup.ongoingOrdersApiCall
                                            .bookingDetailsList(
                                              listViewOngoingOrdersApiResponse
                                                  .jsonBody,
                                            )
                                            ?.toList() ??
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
                                  key: const Key('RefreshIndicator_nggh2l6o'),
                                  color: FlutterFlowTheme.of(context).primary,
                                  onRefresh: () async {
                                    setState(() =>
                                        _model.apiRequestCompleter = null);
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
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 16.0),
                                    itemBuilder:
                                        (context, ongoingOrdersListIndex) {
                                      final ongoingOrdersListItem =
                                          ongoingOrdersList[
                                              ongoingOrdersListIndex];
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
                                              'bookingTime': serializeParam(
                                                getJsonField(
                                                  ongoingOrdersListItem,
                                                  r'''$.bookingTime''',
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
                                              'currencySymbol': serializeParam(
                                                CarServiceGroup.currencyApiCall
                                                    .currency(
                                                  containerCurrencyApiResponse
                                                      .jsonBody,
                                                ),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration:
                                                        const Duration(
                                                            milliseconds: 200),
                                                    fadeOutDuration:
                                                        const Duration(
                                                            milliseconds: 200),
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
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                            0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Order ID: #${getJsonField(
                                                            ongoingOrdersListItem,
                                                            r'''$.orderNo''',
                                                          ).toString()}',
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray400,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            ongoingOrdersListItem,
                                                            r'''$.packageDetails.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        6.0),
                                                                child: custom_widgets
                                                                    .GetCurrencySymboolBold(
                                                                  width: 15.0,
                                                                  height: 20.0,
                                                                  isSimbool: CarServiceGroup
                                                                      .currencyApiCall
                                                                      .currency(
                                                                    containerCurrencyApiResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              functions
                                                                  .roundToTwoDecimalPlaces(
                                                                      getJsonField(
                                                                    ongoingOrdersListItem,
                                                                    r'''$.Total''',
                                                                  ).toDouble())
                                                                  .toString(),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            if ('pending' ==
                                                                getJsonField(
                                                                  ongoingOrdersListItem,
                                                                  r'''$.orderStatus''',
                                                                ).toString()) {
                                                              return Text(
                                                                functions
                                                                    .capitalizeFirst(
                                                                        getJsonField(
                                                                  ongoingOrdersListItem,
                                                                  r'''$.orderStatus''',
                                                                ).toString()),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              );
                                                            } else {
                                                              return Text(
                                                                functions
                                                                    .capitalizeFirst(
                                                                        getJsonField(
                                                                  ongoingOrdersListItem,
                                                                  r'''$.orderStatus''',
                                                                ).toString()),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .success,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              );
                                                            }
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
                          },
                        ),
                      );
                    } else {
                      return Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 208.0,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                26.0, 0.0, 26.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.asset(
                                    'assets/images/noorder.png',
                                    width: 108.0,
                                    height: 108.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  'No order yet!',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Text(
                                  'Explore and shortlist somelist some \nproduct',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
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
                      );
                    }
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
