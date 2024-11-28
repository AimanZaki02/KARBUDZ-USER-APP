// ignore_for_file: use_build_context_synchronously

import '/backend/api_requests/api_calls.dart';
import '/components/car_detail_main_shimmer_widget.dart';
// import '/components/verified_email_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'all_car_details_page_model.dart';
export 'all_car_details_page_model.dart';

class AllCarDetailsPageWidget extends StatefulWidget {
  const AllCarDetailsPageWidget({
    super.key,
    required this.packageId,
    required this.packageName,
    required this.packageImage,
    required this.price,
    required this.serviceId,
    required this.serviceName,
    required this.serviceImage,
    required this.currencySymbol,
  });

  final String? packageId;
  final String? packageName;
  final String? packageImage;
  final double? price;
  final String? serviceId;
  final String? serviceName;
  final String? serviceImage;
  final String? currencySymbol;

  @override
  State<AllCarDetailsPageWidget> createState() =>
      _AllCarDetailsPageWidgetState();
}

class _AllCarDetailsPageWidgetState extends State<AllCarDetailsPageWidget>
    with TickerProviderStateMixin {
  late AllCarDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllCarDetailsPageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: CarServiceGroup.packageDetailsApiCall.call(
        packageId: widget.packageId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const Center(
              child: CarDetailMainShimmerWidget(),
            ),
          );
        }
        final allCarDetailsPagePackageDetailsApiResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Builder(
              builder: (context) {
                if (FFAppState().connected) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 301.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).gray100,
                                  ),
                                  child: Visibility(
                                    visible: CarServiceGroup
                                                .packageDetailsApiCall
                                                .galleryImagesList(
                                              allCarDetailsPagePackageDetailsApiResponse
                                                  .jsonBody,
                                            ) !=
                                            null &&
                                        (CarServiceGroup.packageDetailsApiCall
                                                .galleryImagesList(
                                          allCarDetailsPagePackageDetailsApiResponse
                                              .jsonBody,
                                        ))!
                                            .isNotEmpty,
                                    child: Builder(
                                      builder: (context) {
                                        final galleryList = CarServiceGroup
                                                .packageDetailsApiCall
                                                .galleryImagesList(
                                                  allCarDetailsPagePackageDetailsApiResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];

                                        return SizedBox(
                                          width: double.infinity,
                                          height: 301.0,
                                          child: Stack(
                                            children: [
                                              PageView.builder(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                galleryList
                                                                        .length -
                                                                    1))),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: galleryList.length,
                                                itemBuilder: (context,
                                                    galleryListIndex) {
                                                  final galleryListItem =
                                                      galleryList[
                                                          galleryListIndex];
                                                  return CachedNetworkImage(
                                                    fadeInDuration:
                                                        const Duration(
                                                            milliseconds: 200),
                                                    fadeOutDuration:
                                                        const Duration(
                                                            milliseconds: 200),
                                                    imageUrl:
                                                        '${FFAppConstants.imageUrl}${galleryListItem.toString()}',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                    alignment: const Alignment(
                                                        -1.0, -1.0),
                                                  );
                                                },
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        0.0, 1.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    galleryList
                                                                            .length -
                                                                        1))),
                                                    count: galleryList.length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        curve: Curves.ease,
                                                      );
                                                      setState(() {});
                                                    },
                                                    effect:
                                                        smooth_page_indicator
                                                            .SlideEffect(
                                                      spacing: 8.0,
                                                      radius: 16.0,
                                                      dotWidth: 8.0,
                                                      dotHeight: 8.0,
                                                      dotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .borderColor,
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 63.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: SvgPicture.asset(
                                          'assets/images/left.svg',
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.packageName,
                                  'Name',
                                ),
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 6.0),
                                      child:
                                          custom_widgets.GetCurrencySymboolBold(
                                        width: 15.0,
                                        height: 20.0,
                                        isSimbool: widget.currencySymbol,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget.price?.toString(),
                                      '0',
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 24.0, 16.0, 8.0),
                              child: Text(
                                'Package includes',
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: custom_widgets.HtmlConverter(
                                width: double.infinity,
                                height: 50.0,
                                text: valueOrDefault<String>(
                                  CarServiceGroup.packageDetailsApiCall
                                      .description(
                                    allCarDetailsPagePackageDetailsApiResponse
                                        .jsonBody,
                                  ),
                                  'Description',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 8.0, 16.0, 36.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (FFAppState().isLogin == true) {
                                // Keep getUserApiCall to fetch user data
                                _model.getUserFunction =
                                    await CarServiceGroup.getUserApiCall.call(
                                  userId: FFAppState().userId,
                                  token: FFAppState().token,
                                );

                                // Optionally update user-related fields from the API response
                                FFAppState().countryCodeEdit =
                                    CarServiceGroup.getUserApiCall.countrycode(
                                  (_model.getUserFunction?.jsonBody ?? ''),
                                )!;
                                FFAppState().phone =
                                    CarServiceGroup.getUserApiCall.phone(
                                  (_model.getUserFunction?.jsonBody ?? ''),
                                )!;
                                FFAppState().update(() {});

                                // Directly push to the booking page
                                context.pushNamed(
                                  'SelectTmeDatePage',
                                  queryParameters: {
                                    'packageId': serializeParam(
                                      widget.packageId,
                                      ParamType.String,
                                    ),
                                    'packageTitle': serializeParam(
                                      widget.packageName,
                                      ParamType.String,
                                    ),
                                    'packageImage': serializeParam(
                                      CarServiceGroup.packageDetailsApiCall
                                          .image(
                                        allCarDetailsPagePackageDetailsApiResponse
                                            .jsonBody,
                                      ),
                                      ParamType.String,
                                    ),
                                    'packagePrice': serializeParam(
                                      widget.price,
                                      ParamType.double,
                                    ),
                                    'serviceId': serializeParam(
                                      widget.serviceId,
                                      ParamType.String,
                                    ),
                                    'serviceName': serializeParam(
                                      widget.serviceName,
                                      ParamType.String,
                                    ),
                                    'serviceImage': serializeParam(
                                      widget.serviceImage,
                                      ParamType.String,
                                    ),
                                    'currencySymbol': serializeParam(
                                      widget.currencySymbol,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                context.pushNamed('SignInPage');
                              }

                              setState(() {});
                            },
                            text: 'Book now',
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
                      ),
                    ],
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
        );
      },
    );
  }
}
