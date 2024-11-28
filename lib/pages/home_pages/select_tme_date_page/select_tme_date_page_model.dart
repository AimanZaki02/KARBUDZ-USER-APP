import '/backend/api_requests/api_calls.dart';
import '/components/custom_center_appbar_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_tme_date_page_widget.dart' show SelectTmeDatePageWidget;
import 'package:flutter/material.dart';

class SelectTmeDatePageModel extends FlutterFlowModel<SelectTmeDatePageWidget> {
  ///  Local state fields for this page.

  String? bookingTimePage;

  int? bookingTime;

  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - API (AvailableSlotsApi)] action in Calendar widget.
  ApiCallResponse? apiResult1dn;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
  }
}
