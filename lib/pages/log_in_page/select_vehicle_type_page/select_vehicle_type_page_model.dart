import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_vehicle_type_page_widget.dart' show SelectVehicleTypePageWidget;
import 'package:flutter/material.dart';

class SelectVehicleTypePageModel
    extends FlutterFlowModel<SelectVehicleTypePageWidget> {
  ///  Local state fields for this page.

  String? vehicleTypeId;

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
