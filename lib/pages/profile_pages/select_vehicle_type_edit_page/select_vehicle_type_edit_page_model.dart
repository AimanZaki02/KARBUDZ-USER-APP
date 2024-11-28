import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_vehicle_type_edit_page_widget.dart'
    show SelectVehicleTypeEditPageWidget;
import 'package:flutter/material.dart';

class SelectVehicleTypeEditPageModel
    extends FlutterFlowModel<SelectVehicleTypeEditPageWidget> {
  ///  Local state fields for this page.

  String? vehicleTypeIdPage;

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
