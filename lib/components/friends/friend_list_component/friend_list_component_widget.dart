import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/friends/dropdown_for_friend/dropdown_for_friend_widget.dart';
import '/components/profile_image_component/profile_image_component_widget.dart';
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
    context.watch<FFAppState>();

    return StreamBuilder<List<FriendShipsRecord>>(
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
        List<FriendShipsRecord> containerFriendShipsRecordList = snapshot.data!;
        return Container(
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              if (containerFriendShipsRecordList.length > 0) {
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: Builder(
                    builder: (context) {
                      final friendLists =
                          containerFriendShipsRecordList.toList();
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: friendLists.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, friendListsIndex) {
                          final friendListsItem = friendLists[friendListsIndex];
                          return Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: StreamBuilder<UsersRecord>(
                              stream: UsersRecord.getDocument(
                                  friendListsItem.userId!),
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
                                final friendItemContainerUsersRecord =
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
                                                    'FRIEND_LIST_COMPONENT_Container_kh9kn352');
                                                logFirebaseEvent(
                                                    'ProfileImageComponent_navigate_to');

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
                                              child:
                                                  ProfileImageComponentWidget(
                                                key: Key(
                                                    'Keykh9_${friendListsIndex}_of_${friendLists.length}'),
                                                imageUrl:
                                                    friendItemContainerUsersRecord
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
                                                      friendItemContainerUsersRecord
                                                          .displayName,
                                                      'No Name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Text(
                                                    friendItemContainerUsersRecord
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
                                        Builder(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.keyboard_control,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'FRIEND_LIST_COMPONENT_keyboard_control_I');
                                              logFirebaseEvent(
                                                  'IconButton_alert_dialog');
                                              await showAlignedDialog(
                                                barrierColor:
                                                    Colors.transparent,
                                                context: context,
                                                isGlobal: false,
                                                avoidOverflow: true,
                                                targetAnchor:
                                                    AlignmentDirectional(
                                                            1.0, -1.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                followerAnchor:
                                                    AlignmentDirectional(
                                                            1.0, -1.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                builder: (dialogContext) {
                                                  return Material(
                                                    color: Colors.transparent,
                                                    child:
                                                        DropdownForFriendWidget(
                                                      friendshipRef:
                                                          friendListsItem,
                                                      userRef:
                                                          friendItemContainerUsersRecord,
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                          ),
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
                        'No friends at the moment.',
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
