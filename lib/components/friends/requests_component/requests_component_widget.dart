import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'requests_component_model.dart';
export 'requests_component_model.dart';

class RequestsComponentWidget extends StatefulWidget {
  const RequestsComponentWidget({Key? key}) : super(key: key);

  @override
  _RequestsComponentWidgetState createState() =>
      _RequestsComponentWidgetState();
}

class _RequestsComponentWidgetState extends State<RequestsComponentWidget>
    with TickerProviderStateMixin {
  late RequestsComponentModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.5,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestsComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: StreamBuilder<List<FriendRequestsRecord>>(
          stream: queryFriendRequestsRecord(
            queryBuilder: (friendRequestsRecord) => friendRequestsRecord
                .where(
                  'status',
                  isEqualTo: 'pending',
                )
                .where(
                  'receiver_id',
                  isEqualTo: currentUserReference,
                ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                ),
              );
            }
            List<FriendRequestsRecord> listViewFriendRequestsRecordList =
                snapshot.data!;
            return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewFriendRequestsRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.0),
              itemBuilder: (context, listViewIndex) {
                final listViewFriendRequestsRecord =
                    listViewFriendRequestsRecordList[listViewIndex];
                return Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(
                        listViewFriendRequestsRecord.senderId!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final requestItemContainerUsersRecord = snapshot.data!;
                      return Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).customColor1,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'REQUESTS_COMPONENT_ProfileImageContiner_');
                                      logFirebaseEvent(
                                          'ProfileImageContiner_navigate_to');

                                      context.pushNamed(
                                        'OtherProfileDetail',
                                        queryParameters: {
                                          'userRef': serializeParam(
                                            requestItemContainerUsersRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'userRef':
                                              requestItemContainerUsersRecord,
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (requestItemContainerUsersRecord
                                                      .photoUrl !=
                                                  null &&
                                              requestItemContainerUsersRecord
                                                      .photoUrl !=
                                                  '') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                requestItemContainerUsersRecord
                                                    .photoUrl,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          } else {
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Icon(
                                                Icons.person,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          requestItemContainerUsersRecord
                                                          .displayName !=
                                                      null &&
                                                  requestItemContainerUsersRecord
                                                          .displayName !=
                                                      ''
                                              ? requestItemContainerUsersRecord
                                                  .displayName
                                              : 'No Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          requestItemContainerUsersRecord.email,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'REQUESTS_COMPONENT_COMP_AcceptBtn_ON_TAP');
                                      // add a friend to sender
                                      logFirebaseEvent(
                                          'AcceptBtn_addafriendtosender');
                                      unawaited(
                                        () async {
                                          await FriendShipsRecord.createDoc(
                                                  currentUserReference!)
                                              .set({
                                            ...createFriendShipsRecordData(
                                              userId:
                                                  requestItemContainerUsersRecord
                                                      .reference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'established': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                        }(),
                                      );
                                      // add a friend to receiver
                                      logFirebaseEvent(
                                          'AcceptBtn_addafriendtoreceiver');
                                      unawaited(
                                        () async {
                                          await FriendShipsRecord.createDoc(
                                                  requestItemContainerUsersRecord
                                                      .reference)
                                              .set({
                                            ...createFriendShipsRecordData(
                                              userId: currentUserReference,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'established': FieldValue
                                                    .serverTimestamp(),
                                              },
                                            ),
                                          });
                                        }(),
                                      );
                                      logFirebaseEvent(
                                          'AcceptBtn_backend_call');
                                      unawaited(
                                        () async {
                                          await listViewFriendRequestsRecord
                                              .reference
                                              .delete();
                                        }(),
                                      );
                                      logFirebaseEvent(
                                          'AcceptBtn_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'You accepted a friend request.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                        ),
                                      );
                                    },
                                    text: 'Accept',
                                    icon: Icon(
                                      Icons.check,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 12.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 80.0,
                                      height: 24.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 4.0, 8.0, 4.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 12.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'REQUESTS_COMPONENT_COMP_RejectBtn_ON_TAP');
                                      logFirebaseEvent(
                                          'RejectBtn_alert_dialog');
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Confirm Friend Request Rejection'),
                                                    content: Text(
                                                        'Are you sure you want to reject this friend request?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('Reject'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        logFirebaseEvent(
                                            'RejectBtn_backend_call');
                                        unawaited(
                                          () async {
                                            await listViewFriendRequestsRecord
                                                .reference
                                                .update({
                                              ...createFriendRequestsRecordData(
                                                status: 'declined',
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'rejected_time': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });
                                          }(),
                                        );
                                        logFirebaseEvent(
                                            'RejectBtn_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Friend request declined.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .warning,
                                          ),
                                        );
                                      }
                                    },
                                    text: 'Reject',
                                    icon: Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 12.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 80.0,
                                      height: 24.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 4.0, 8.0, 4.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).error,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 12.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
