import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/friends/dropdown_for_friend/dropdown_for_friend_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'friend_list_component_model.dart';
export 'friend_list_component_model.dart';

class FriendListComponentWidget extends StatefulWidget {
  const FriendListComponentWidget({Key? key}) : super(key: key);

  @override
  _FriendListComponentWidgetState createState() =>
      _FriendListComponentWidgetState();
}

class _FriendListComponentWidgetState extends State<FriendListComponentWidget>
    with TickerProviderStateMixin {
  late FriendListComponentModel _model;

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
    _model = createModel(context, () => FriendListComponentModel());
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
        child: StreamBuilder<List<FriendShipsRecord>>(
          stream: queryFriendShipsRecord(
            parent: currentUserReference,
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
            List<FriendShipsRecord> listViewFriendShipsRecordList =
                snapshot.data!;
            return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewFriendShipsRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.0),
              itemBuilder: (context, listViewIndex) {
                final listViewFriendShipsRecord =
                    listViewFriendShipsRecordList[listViewIndex];
                return Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(
                        listViewFriendShipsRecord.userId!),
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
                      final friendItemContainerUsersRecord = snapshot.data!;
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
                                          'FRIEND_LIST_COMPONENT_ProfileImageContin');
                                      logFirebaseEvent(
                                          'ProfileImageContiner_navigate_to');

                                      context.pushNamed(
                                        'OtherProfileDetail',
                                        queryParameters: {
                                          'userRef': serializeParam(
                                            friendItemContainerUsersRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'userRef':
                                              friendItemContainerUsersRecord,
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
                                          if (friendItemContainerUsersRecord
                                                      .photoUrl !=
                                                  null &&
                                              friendItemContainerUsersRecord
                                                      .photoUrl !=
                                                  '') {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                friendItemContainerUsersRecord
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
                                          friendItemContainerUsersRecord
                                                          .displayName !=
                                                      null &&
                                                  friendItemContainerUsersRecord
                                                          .displayName !=
                                                      ''
                                              ? friendItemContainerUsersRecord
                                                  .displayName
                                              : 'No Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Text(
                                          friendItemContainerUsersRecord.email,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                              Builder(
                                builder: (context) => FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.keyboard_control,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'FRIEND_LIST_COMPONENT_keyboard_control_I');
                                    logFirebaseEvent('IconButton_alert_dialog');
                                    await showAlignedDialog(
                                      barrierColor: Colors.transparent,
                                      context: context,
                                      isGlobal: false,
                                      avoidOverflow: true,
                                      targetAnchor: AlignmentDirectional(
                                              1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: DropdownForFriendWidget(
                                            friendshipRef:
                                                listViewFriendShipsRecord,
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                ),
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
