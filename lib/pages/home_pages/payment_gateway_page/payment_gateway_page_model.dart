import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_gateway_page_widget.dart' show PaymentGatewayPageWidget;
import 'package:flutter/material.dart';

class PaymentGatewayPageModel
    extends FlutterFlowModel<PaymentGatewayPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // Stores action output result for [Backend Call - API (BookAVehicleNoCoupon)] action in Button widget.
  ApiCallResponse? bookingApiNoCouponFunction;
  // Stores action output result for [Backend Call - API (BookAVehicle)] action in Button widget.
  ApiCallResponse? bookingApiFunction;
  // Stores action output result for [Backend Call - API (BookAVehicleNoCoupon)] action in Button widget.
  ApiCallResponse? bookingApiStripeNoCouponFunction;
  // Stores action output result for [Backend Call - API (BookAVehicle)] action in Button widget.
  ApiCallResponse? bookingApiStripeFunction;
  // Stores action output result for [Backend Call - API (BookAVehicleNoCoupon)] action in Button widget.
  ApiCallResponse? bookingApiRazorpayNoCouponFunction;
  // Stores action output result for [Backend Call - API (BookAVehicle)] action in Button widget.
  ApiCallResponse? bookingApiRazorpayFunction;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
  }
}
