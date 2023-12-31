import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/profile_image_component/profile_image_component_widget.dart';
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
import 'received_requests_model.dart';
export 'received_requests_model.dart';

class ReceivedRequestsWidget extends StatefulWidget {
  const ReceivedRequestsWidget({Key? key}) : super(key: key);

  @override
  _ReceivedRequestsWidgetState createState() => _ReceivedRequestsWidgetState();
}

class _ReceivedRequestsWidgetState extends State<ReceivedRequestsWidget>
    with TickerProviderStateMixin {
  late ReceivedRequestsModel _model;

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
    _model = createModel(context, () => ReceivedRequestsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<FriendRequestsRecord>>(
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
        List<FriendRequestsRecord> containerFriendRequestsRecordList =
            snapshot.data!;
        return Container(
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              if (containerFriendRequestsRecordList.length > 0) {
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: Builder(
                    builder: (context) {
                      final friendRequetsList =
                          containerFriendRequestsRecordList.toList();
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: friendRequetsList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, friendRequetsListIndex) {
                          final friendRequetsListItem =
                              friendRequetsList[friendRequetsListIndex];
                          return Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  friendRequetsListItem.senderId!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final requestItemContainerUsersRecord =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'RECEIVED_REQUESTS_Container_2v42ajiu_ON_');
                                                logFirebaseEvent(
                                                    'ProfileImageComponent_navigate_to');

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
                                              child:
                                                  ProfileImageComponentWidget(
                                                key: Key(
                                                    'Key2v4_${friendRequetsListIndex}_of_${friendRequetsList.length}'),
                                                imageUrl:
                                                    requestItemContainerUsersRecord
                                                        .photoUrl,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      requestItemContainerUsersRecord
                                                          .displayName,
                                                      'No Name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Text(
                                                    requestItemContainerUsersRecord
                                                        .email,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    'RECEIVED_REQUESTS_COMP_AcceptBtn_ON_TAP');
                                                // add a friend to sender
                                                logFirebaseEvent(
                                                    'AcceptBtn_addafriendtosender');
                                                unawaited(
                                                  () async {
                                                    await FriendShipsRecord
                                                            .createDoc(
                                                                friendRequetsListItem
                                                                    .senderId!)
                                                        .set({
                                                      ...createFriendShipsRecordData(
                                                        userId:
                                                            friendRequetsListItem
                                                                .receiverId,
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
                                                    await FriendShipsRecord
                                                            .createDoc(
                                                                friendRequetsListItem
                                                                    .receiverId!)
                                                        .set({
                                                      ...createFriendShipsRecordData(
                                                        userId:
                                                            friendRequetsListItem
                                                                .senderId,
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
                                                    await friendRequetsListItem
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
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .success,
                                                  ),
                                                );
                                              },
                                              text: 'Accept',
                                              icon: Icon(
                                                Icons.check,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                size: 12.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 80.0,
                                                height: 24.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'RECEIVED_REQUESTS_COMP_RejectBtn_ON_TAP');
                                                logFirebaseEvent(
                                                    'RejectBtn_alert_dialog');
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
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
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Reject'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  logFirebaseEvent(
                                                      'RejectBtn_backend_call');
                                                  await friendRequetsListItem
                                                      .reference
                                                      .delete();
                                                  logFirebaseEvent(
                                                      'RejectBtn_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Friend request declined.',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                    ),
                                                  );
                                                }
                                              },
                                              text: 'Reject',
                                              icon: Icon(
                                                Icons.close,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                size: 12.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 80.0,
                                                height: 24.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          fontSize: 12.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!);
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 24.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No pending friend requests at the moment.\n Stay connected and check back later for updates!',
                        textAlign: TextAlign.center,
                        maxLines: 6,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
