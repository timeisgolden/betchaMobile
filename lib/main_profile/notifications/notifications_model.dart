import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_component/app_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for AllowPushNotificationsSwitch widget.
  bool? allowPushNotificationsSwitchValue;
  // State field(s) for AllowPaymentNotificationsSwitch widget.
  bool? allowPaymentNotificationsSwitchValue;
  // Model for AppBarComponent component.
  late AppBarComponentModel appBarComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarComponentModel = createModel(context, () => AppBarComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
