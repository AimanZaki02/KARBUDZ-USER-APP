// ignore_for_file: use_build_context_synchronously

import '/backend/api_requests/api_calls.dart';
import '/components/address_change_success_componant_widget.dart';
import '/components/address_list_shimmer_widget.dart';
import '/components/change_address_componant_widget.dart';
import '/components/custom_center_appbar_widget.dart';
import '/components/delete_address_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/search_pages/no_address_yet_componant/no_address_yet_componant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'address_page_model.dart';
export 'address_page_model.dart';

class AddressPageWidget extends StatefulWidget {
  const AddressPageWidget({super.key});

  @override
  State<AddressPageWidget> createState() => _AddressPageWidgetState();
}

class _AddressPageWidgetState extends State<AddressPageWidget> {
  late AddressPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().clearAddressCacheCacheKey(_model.apiRequestLastUniqueKey);
        _model.apiRequestCompleted = false;
      });
      await _model.waitForApiRequestCompleted();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.customCenterAppbarModel,
                updateCallback: () => setState(() {}),
                child: CustomCenterAppbarWidget(
                  title: 'Address',
                  backIcon: false,
                  addIcon: false,
                  onTapAdd: () async {},
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState()
                                    .addressCache(
                                  uniqueQueryKey: FFAppState().userId,
                                  requestFn: () =>
                                      CarServiceGroup.getAddressApiCall.call(
                                    userId: FFAppState().userId,
                                    token: FFAppState().token,
                                  ),
                                )
                                    .then((result) {
                                  try {
                                    _model.apiRequestCompleted = true;
                                    _model.apiRequestLastUniqueKey =
                                        FFAppState().userId;
                                  } finally {}
                                  return result;
                                }),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: AddressListShimmerWidget(),
                                    );
                                  }
                                  final listViewGetAddressApiResponse =
                                      snapshot.data!;

                                  return Builder(
                                    builder: (context) {
                                      final addressList =
                                          CarServiceGroup.getAddressApiCall
                                                  .addressDetails(
                                                    listViewGetAddressApiResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                      if (addressList.isEmpty) {
                                        return const Center(
                                          child: SizedBox(
                                            height: 188.0,
                                            child:
                                                NoAddressYetComponantWidget(),
                                          ),
                                        );
                                      }

                                      return RefreshIndicator(
                                        key: const Key('RefreshIndicator_9nw8l638'),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        onRefresh: () async {
                                          setState(() {
                                            FFAppState()
                                                .clearAddressCacheCacheKey(_model
                                                    .apiRequestLastUniqueKey);
                                            _model.apiRequestCompleted = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted();
                                        },
                                        child: ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            16.0,
                                            0,
                                            16.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: addressList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 16.0),
                                          itemBuilder:
                                              (context, addressListIndex) {
                                            final addressListItem =
                                                addressList[addressListIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              addressListItem,
                                                              r'''$.type''',
                                                            ).toString(),
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
                                                                      1.5,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        24.0),
                                                            child: Text(
                                                              '${getJsonField(
                                                                addressListItem,
                                                                r'''$.street''',
                                                              ).toString()},${getJsonField(
                                                                addressListItem,
                                                                r'''$.city''',
                                                              ).toString()},${getJsonField(
                                                                addressListItem,
                                                                r'''$.state''',
                                                              ).toString()},${getJsonField(
                                                                addressListItem,
                                                                r'''$.zipcode''',
                                                              ).toString()},${getJsonField(
                                                                addressListItem,
                                                                r'''$.country''',
                                                              ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'EditAddressPage',
                                                                      queryParameters:
                                                                          {
                                                                        'addressId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            addressListItem,
                                                                            r'''$.id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'type':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            addressListItem,
                                                                            r'''$.type''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'street':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            addressListItem,
                                                                            r'''$.street''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'city':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            addressListItem,
                                                                            r'''$.city''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'state':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            addressListItem,
                                                                            r'''$.state''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'zipcode':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            addressListItem,
                                                                            r'''$.zipcode''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'country':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            addressListItem,
                                                                            r'''$.country''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              10.0),
                                                                      child:
                                                                          Text(
                                                                        'Edit',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (false ==
                                                                  getJsonField(
                                                                    addressListItem,
                                                                    r'''$.is_default''',
                                                                  ))
                                                                Expanded(
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: GestureDetector(
                                                                                onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                child: SizedBox(
                                                                                  height: 204.0,
                                                                                  child: DeleteAddressDialogWidget(
                                                                                    onTapYes: () async {
                                                                                      _model.deleteAddressFunction = await CarServiceGroup.deleteAddressApiCall.call(
                                                                                        userId: FFAppState().userId,
                                                                                        addressId: getJsonField(
                                                                                          addressListItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        token: FFAppState().token,
                                                                                      );

                                                                                      if (CarServiceGroup.deleteAddressApiCall.success(
                                                                                            (_model.deleteAddressFunction?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          1) {
                                                                                        Navigator.pop(context);
                                                                                        setState(() {
                                                                                          FFAppState().clearAddressCacheCacheKey(_model.apiRequestLastUniqueKey);
                                                                                          _model.apiRequestCompleted = false;
                                                                                        });
                                                                                        await _model.waitForApiRequestCompleted();
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              CarServiceGroup.deleteAddressApiCall.message(
                                                                                                (_model.deleteAddressFunction?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 2000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        );
                                                                                        Navigator.pop(context);
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(10.0),
                                                                          child:
                                                                              Text(
                                                                            'Delete',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'SF Pro Display',
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ].divide(const SizedBox(
                                                                width: 16.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  17.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(dialogContext).unfocus(),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              220.0,
                                                                          child:
                                                                              ChangeAddressComponantWidget(
                                                                            onTapYes:
                                                                                () async {
                                                                              _model.setDefaultAddressFunction = await CarServiceGroup.setDefaultAddressApiCall.call(
                                                                                userId: FFAppState().userId,
                                                                                addressId: getJsonField(
                                                                                  addressListItem,
                                                                                  r'''$.id''',
                                                                                ).toString(),
                                                                                token: FFAppState().token,
                                                                              );

                                                                              if (CarServiceGroup.setDefaultAddressApiCall.success(
                                                                                    (_model.setDefaultAddressFunction?.jsonBody ?? ''),
                                                                                  ) ==
                                                                                  1) {
                                                                                setState(() {
                                                                                  FFAppState().clearAddressCacheCacheKey(_model.apiRequestLastUniqueKey);
                                                                                  _model.apiRequestCompleted = false;
                                                                                });
                                                                                await _model.waitForApiRequestCompleted();
                                                                                Navigator.pop(context);
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: GestureDetector(
                                                                                        onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                        child: const SizedBox(
                                                                                          height: 310.0,
                                                                                          child: AddressChangeSuccessComponantWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      CarServiceGroup.setDefaultAddressApiCall.message(
                                                                                        (_model.setDefaultAddressFunction?.jsonBody ?? ''),
                                                                                      )!,
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    duration: const Duration(milliseconds: 2000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                );
                                                                                Navigator.pop(context);
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: true ==
                                                                          getJsonField(
                                                                            addressListItem,
                                                                            r'''$.is_default''',
                                                                          )
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .success
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .gray200,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          5.0,
                                                                          12.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    'Default',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'SF Pro Display',
                                                                          color: true ==
                                                                                  getJsonField(
                                                                                    addressListItem,
                                                                                    r'''$.is_default''',
                                                                                  )
                                                                              ? FlutterFlowTheme.of(context).primaryBackground
                                                                              : FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  ],
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
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('AddNewAddressPage');
                                },
                                text: 'Add new address',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 56.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.2,
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
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
          ),
        ),
      ),
    );
  }
}
