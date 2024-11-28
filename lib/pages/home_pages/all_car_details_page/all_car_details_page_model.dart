import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_car_details_page_widget.dart' show AllCarDetailsPageWidget;
import 'package:flutter/material.dart';

class AllCarDetailsPageModel extends FlutterFlowModel<AllCarDetailsPageWidget> {
  ///  Local state fields for this page.

  int? pageviewindex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (GetUserApi)] action in Button widget.
  ApiCallResponse? getUserFunction;
  // Stores action output result for [Backend Call - API (VerifyUserApi)] action in Button widget.
  ApiCallResponse? userVerifiedFunction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
