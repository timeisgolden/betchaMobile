import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_bar_component/app_bar_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Notifications'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF111111),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(82.0),
          child: AppBar(
            backgroundColor: Color(0xFF111111),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.appBarComponentModel,
                      updateCallback: () => setState(() {}),
                      child: AppBarComponentWidget(
                        title: 'Notifications',
                        isAllowBack: true,
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Allow push notifications',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFD7FC70),
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Switch.adaptive(
                            value: _model.allowPushNotificationsSwitchValue ??=
                                valueOrDefault<bool>(
                                    currentUserDocument?.allowPushNotifications,
                                    false),
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.allowPushNotificationsSwitchValue =
                                      newValue!);
                              if (newValue!) {
                                logFirebaseEvent(
                                    'NOTIFICATIONS_AllowPushNotificationsSwit');
                                logFirebaseEvent(
                                    'AllowPushNotificationsSwitch_backend_cal');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  allowPushNotifications: true,
                                ));
                              } else {
                                logFirebaseEvent(
                                    'NOTIFICATIONS_AllowPushNotificationsSwit');
                                logFirebaseEvent(
                                    'AllowPushNotificationsSwitch_backend_cal');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  allowPushNotifications: false,
                                ));
                              }
                            },
                            activeColor: Color(0xFFD7FC70),
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 64.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment notifications',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFFD7FC70),
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Switch.adaptive(
                            value:
                                _model.allowPaymentNotificationsSwitchValue ??=
                                    valueOrDefault<bool>(
                                        currentUserDocument
                                            ?.allowPaymentNotifications,
                                        false),
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.allowPaymentNotificationsSwitchValue =
                                      newValue!);
                              if (newValue!) {
                                logFirebaseEvent(
                                    'NOTIFICATIONS_AllowPaymentNotificationsS');
                                logFirebaseEvent(
                                    'AllowPaymentNotificationsSwitch_backend_');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  allowPaymentNotifications: true,
                                ));
                              } else {
                                logFirebaseEvent(
                                    'NOTIFICATIONS_AllowPaymentNotificationsS');
                                logFirebaseEvent(
                                    'AllowPaymentNotificationsSwitch_backend_');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  allowPaymentNotifications: false,
                                ));
                              }
                            },
                            activeColor: Color(0xFFD7FC70),
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
