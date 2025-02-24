import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'about_us_page_widget.dart' show AboutUsPageWidget;
import 'package:flutter/material.dart';

class AboutUsPageModel extends FlutterFlowModel<AboutUsPageWidget> {
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
