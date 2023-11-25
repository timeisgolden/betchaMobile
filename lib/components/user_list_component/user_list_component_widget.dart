import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_list_component_model.dart';
export 'user_list_component_model.dart';

class UserListComponentWidget extends StatefulWidget {
  const UserListComponentWidget({Key? key}) : super(key: key);

  @override
  _UserListComponentWidgetState createState() =>
      _UserListComponentWidgetState();
}

class _UserListComponentWidgetState extends State<UserListComponentWidget>
    with TickerProviderStateMixin {
  late UserListComponentModel _model;

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
    _model = createModel(context, () => UserListComponentModel());
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
        child: FutureBuilder<List<UsersRecord>>(
          future: queryUsersRecordOnce(),
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
            List<UsersRecord> listViewUsersRecordList =
                snapshot.data!.where((u) => u.uid != currentUserUid).toList();
            return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewUsersRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.0),
              itemBuilder: (context, listViewIndex) {
                final listViewUsersRecord =
                    listViewUsersRecordList[listViewIndex];
                return Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: StreamBuilder<List<FriendShipsRecord>>(
                    stream: queryFriendShipsRecord(
                      parent: currentUserReference,
                      queryBuilder: (friendShipsRecord) =>
                          friendShipsRecord.where(
                        'user_id',
                        isEqualTo: listViewUsersRecord.reference,
                      ),
                      singleRecord: true,
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
                      List<FriendShipsRecord>
                          friendItemContainerFriendShipsRecordList =
                          snapshot.data!;
                      final friendItemContainerFriendShipsRecord =
                          friendItemContainerFriendShipsRecordList.isNotEmpty
                              ? friendItemContainerFriendShipsRecordList.first
                              : null;
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
                                          'USER_LIST_COMPONENT_ProfileImageContiner');
                                      logFirebaseEvent(
                                          'ProfileImageContiner_navigate_to');

                                      context.pushNamed(
                                        'OtherProfileDetail',
                                        queryParameters: {
                                          'userRef': serializeParam(
                                            listViewUsersRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'userRef': listViewUsersRecord,
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
                                          if (listViewUsersRecord.photoUrl !=
                                                  null &&
                                              listViewUsersRecord.photoUrl !=
                                                  '') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                listViewUsersRecord.photoUrl,
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
                                          listViewUsersRecord.displayName !=
                                                      null &&
                                                  listViewUsersRecord
                                                          .displayName !=
                                                      ''
                                              ? listViewUsersRecord.displayName
                                              : 'No Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          listViewUsersRecord.email,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                              Builder(
                                builder: (context) {
                                  if (!(friendItemContainerFriendShipsRecord !=
                                      null)) {
                                    return FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.person_add,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'USER_LIST_COMPONENT_person_add_ICN_ON_TA');
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        await FriendRequestsRecord.collection
                                            .doc()
                                            .set({
                                          ...createFriendRequestsRecordData(
                                            status: 'pending',
                                            senderId: currentUserReference,
                                            receiverId:
                                                listViewUsersRecord.reference,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'request_time':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        logFirebaseEvent(
                                            'IconButton_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Sent a friend request.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.person_remove,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'USER_LIST_COMPONENT_person_remove_ICN_ON');
                                        logFirebaseEvent(
                                            'IconButton_alert_dialog');
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Confirm Friendship Removal'),
                                                      content: Text(
                                                          'Are you sure you want to remove this friend from your connections? This action cannot be undone.'),
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
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          logFirebaseEvent(
                                              'IconButton_backend_call');
                                          unawaited(
                                            () async {
                                              await friendItemContainerFriendShipsRecord!
                                                  .reference
                                                  .delete();
                                            }(),
                                          );
                                          logFirebaseEvent(
                                              'IconButton_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Friendship removed.',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  }
                                },
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
