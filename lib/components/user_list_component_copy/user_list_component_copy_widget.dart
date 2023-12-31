import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/components/profile_image_component/profile_image_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_list_component_copy_model.dart';
export 'user_list_component_copy_model.dart';

class UserListComponentCopyWidget extends StatefulWidget {
  const UserListComponentCopyWidget({Key? key}) : super(key: key);

  @override
  _UserListComponentCopyWidgetState createState() =>
      _UserListComponentCopyWidgetState();
}

class _UserListComponentCopyWidgetState
    extends State<UserListComponentCopyWidget> with TickerProviderStateMixin {
  late UserListComponentCopyModel _model;

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
    _model = createModel(context, () => UserListComponentCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UsersRecord>>(
      future: queryUsersRecordOnce(),
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
        List<UsersRecord> containerUsersRecordList =
            snapshot.data!.where((u) => u.uid != currentUserUid).toList();
        return Container(
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              if (containerUsersRecordList.length > 0) {
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                  child: Builder(
                    builder: (context) {
                      final availableUsersList =
                          containerUsersRecordList.toList();
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: availableUsersList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, availableUsersListIndex) {
                          final availableUsersListItem =
                              availableUsersList[availableUsersListIndex];
                          return Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: StreamBuilder<List<FriendShipsRecord>>(
                              stream: queryFriendShipsRecord(
                                parent: currentUserReference,
                                queryBuilder: (friendShipsRecord) =>
                                    friendShipsRecord.where(
                                  'user_id',
                                  isEqualTo: availableUsersListItem.reference,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<FriendShipsRecord>
                                    friendItemContainerFriendShipsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final friendItemContainerFriendShipsRecord =
                                    friendItemContainerFriendShipsRecordList
                                            .isNotEmpty
                                        ? friendItemContainerFriendShipsRecordList
                                            .first
                                        : null;
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
                                                    'USER_LIST_COMPONENT_COPY_Container_806vg');
                                                logFirebaseEvent(
                                                    'ProfileImageComponent_navigate_to');

                                                context.pushNamed(
                                                  'OtherProfileDetail',
                                                  queryParameters: {
                                                    'userRef': serializeParam(
                                                      availableUsersListItem,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'userRef':
                                                        availableUsersListItem,
                                                  },
                                                );
                                              },
                                              child:
                                                  ProfileImageComponentWidget(
                                                key: Key(
                                                    'Key806_${availableUsersListIndex}_of_${availableUsersList.length}'),
                                                imageUrl: availableUsersListItem
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
                                                    availableUsersListItem
                                                                    .displayName !=
                                                                null &&
                                                            availableUsersListItem
                                                                    .displayName !=
                                                                ''
                                                        ? availableUsersListItem
                                                            .displayName
                                                        : 'No Name',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  Text(
                                                    availableUsersListItem
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'USER_LIST_COMPONENT_COPY_ConditionalBuil');
                                            logFirebaseEvent(
                                                'ConditionalBuilder_cloud_function');
                                            try {
                                              final result =
                                                  await FirebaseFunctions
                                                          .instanceFor(
                                                              region:
                                                                  'us-central1')
                                                      .httpsCallable(
                                                          'deleteFriendship')
                                                      .call({
                                                "userId": currentUserUid,
                                                "friendId":
                                                    availableUsersListItem.uid,
                                              });
                                              _model.functionRes =
                                                  DeleteFriendshipCloudFunctionCallResponse(
                                                data:
                                                    NormalFunctionResponseStruct
                                                        .fromMap(result.data),
                                                succeeded: true,
                                                resultAsString:
                                                    result.data.toString(),
                                                jsonBody: result.data,
                                              );
                                            } on FirebaseFunctionsException catch (error) {
                                              _model.functionRes =
                                                  DeleteFriendshipCloudFunctionCallResponse(
                                                errorCode: error.code,
                                                succeeded: false,
                                              );
                                            }

                                            if (_model
                                                .functionRes!.succeeded!) {
                                              logFirebaseEvent(
                                                  'ConditionalBuilder_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Deleted friendship.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }

                                            setState(() {});
                                          },
                                          child: Builder(
                                            builder: (context) {
                                              if (!(friendItemContainerFriendShipsRecord !=
                                                  null)) {
                                                return FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.person_add_alt,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  showLoadingIndicator: true,
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'USER_LIST_COMPONENT_COPY_person_add_alt_');
                                                    logFirebaseEvent(
                                                        'IconButton_cloud_function');
                                                    try {
                                                      final result =
                                                          await FirebaseFunctions
                                                              .instance
                                                              .httpsCallable(
                                                                  'addFriendRequest')
                                                              .call({
                                                        "senderId":
                                                            currentUserUid,
                                                        "receiverId":
                                                            availableUsersListItem
                                                                .uid,
                                                      });
                                                      _model.addFriendFuncRes =
                                                          AddFriendRequestCloudFunctionCallResponse(
                                                        data:
                                                            NormalFunctionResponseStruct
                                                                .fromMap(result
                                                                    .data),
                                                        succeeded: true,
                                                        resultAsString: result
                                                            .data
                                                            .toString(),
                                                        jsonBody: result.data,
                                                      );
                                                    } on FirebaseFunctionsException catch (error) {
                                                      _model.addFriendFuncRes =
                                                          AddFriendRequestCloudFunctionCallResponse(
                                                        errorCode: error.code,
                                                        succeeded: false,
                                                      );
                                                    }

                                                    logFirebaseEvent(
                                                        'IconButton_show_snack_bar');
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          _model
                                                              .addFriendFuncRes!
                                                              .data!
                                                              .message,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        backgroundColor: _model
                                                                .addFriendFuncRes!
                                                                .data!
                                                                .success
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .success
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                      ),
                                                    );

                                                    setState(() {});
                                                  },
                                                );
                                              } else {
                                                return FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons
                                                        .person_remove_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  showLoadingIndicator: true,
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'USER_LIST_COMPONENT_COPY_person_remove_o');
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
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Cancel'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Confirm'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      logFirebaseEvent(
                                                          'IconButton_cloud_function');
                                                      try {
                                                        final result =
                                                            await FirebaseFunctions
                                                                    .instanceFor(
                                                                        region:
                                                                            'us-central1')
                                                                .httpsCallable(
                                                                    'deleteFriendship')
                                                                .call({
                                                          "userId":
                                                              currentUserUid,
                                                          "friendId":
                                                              availableUsersListItem
                                                                  .uid,
                                                        });
                                                        _model.deleteFriendFuncRes =
                                                            DeleteFriendshipCloudFunctionCallResponse(
                                                          data:
                                                              NormalFunctionResponseStruct
                                                                  .fromMap(result
                                                                      .data),
                                                          succeeded: true,
                                                          resultAsString: result
                                                              .data
                                                              .toString(),
                                                          jsonBody: result.data,
                                                        );
                                                      } on FirebaseFunctionsException catch (error) {
                                                        _model.deleteFriendFuncRes =
                                                            DeleteFriendshipCloudFunctionCallResponse(
                                                          errorCode: error.code,
                                                          succeeded: false,
                                                        );
                                                      }

                                                      logFirebaseEvent(
                                                          'IconButton_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            _model
                                                                .deleteFriendFuncRes!
                                                                .data!
                                                                .message,
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor: _model
                                                                  .deleteFriendFuncRes!
                                                                  .data!
                                                                  .success
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .success
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                        ),
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                );
                                              }
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
                        'No users at the moment.',
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
