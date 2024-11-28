import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_success_page_widget.dart' show PaymentSuccessPageWidget;
import 'package:flutter/material.dart';

class PaymentSuccessPageModel
    extends FlutterFlowModel<PaymentSuccessPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetUserApi)] action in PaymentSuccessPage widget.
  ApiCallResponse? getUserPayment;
  // Stores action output result for [Backend Call - API (BookAVehicleNoCoupon)] action in PaymentSuccessPage widget.
  ApiCallResponse? bookingPaypalApiNoCouponFunction;
  // Stores action output result for [Backend Call - API (BookAVehicle)] action in PaymentSuccessPage widget.
  ApiCallResponse? bookingPaypalApiFunction;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
