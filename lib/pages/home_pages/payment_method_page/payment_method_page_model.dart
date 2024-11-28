import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_method_page_widget.dart' show PaymentMethodPageWidget;
import 'package:flutter/material.dart';

class PaymentMethodPageModel extends FlutterFlowModel<PaymentMethodPageWidget> {
  ///  Local state fields for this page.

  int? selectPaymentIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;

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
