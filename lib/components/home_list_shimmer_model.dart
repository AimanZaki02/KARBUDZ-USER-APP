import '/flutter_flow/flutter_flow_util.dart';
import 'home_list_shimmer_widget.dart' show HomeListShimmerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeListShimmerModel extends FlutterFlowModel<HomeListShimmerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
