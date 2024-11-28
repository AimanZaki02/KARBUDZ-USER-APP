import '/flutter_flow/flutter_flow_util.dart';
import '/pages/my_order_pages/cancel_orders_componant/cancel_orders_componant_widget.dart';
import '/pages/my_order_pages/complate_orders_componant/complate_orders_componant_widget.dart';
import '/pages/my_order_pages/ongoing_orders_componant/ongoing_orders_componant_widget.dart';
import 'my_order_confirm_page_widget.dart' show MyOrderConfirmPageWidget;
import 'package:flutter/material.dart';

class MyOrderConfirmPageModel
    extends FlutterFlowModel<MyOrderConfirmPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for OngoingOrdersComponant component.
  late OngoingOrdersComponantModel ongoingOrdersComponantModel;
  // Model for CancelOrdersComponant component.
  late CancelOrdersComponantModel cancelOrdersComponantModel;
  // Model for ComplateOrdersComponant component.
  late ComplateOrdersComponantModel complateOrdersComponantModel;

  @override
  void initState(BuildContext context) {
    ongoingOrdersComponantModel =
        createModel(context, () => OngoingOrdersComponantModel());
    cancelOrdersComponantModel =
        createModel(context, () => CancelOrdersComponantModel());
    complateOrdersComponantModel =
        createModel(context, () => ComplateOrdersComponantModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    ongoingOrdersComponantModel.dispose();
    cancelOrdersComponantModel.dispose();
    complateOrdersComponantModel.dispose();
  }
}
