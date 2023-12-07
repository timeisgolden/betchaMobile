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
                            child: Container(
                              width: double.infinity,
                              height: 80.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                'USER_LIST_COMPONENT_Container_urfg5f6l_O');
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
                                          child: ProfileImageComponentWidget(
                                            key: Key(
                                                'Keyurf_${availableUsersListIndex}_of_${availableUsersList.length}'),
                                            imageUrl:
                                                availableUsersListItem.photoUrl,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                  availableUsersListItem
                                                      .displayName,
                                                  'No Name',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                availableUsersListItem.email,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.person_add_alt,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      showLoadingIndicator: true,
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'USER_LIST_COMPONENT_person_add_alt_ICN_O');
                                        logFirebaseEvent(
                                            'IconButton_cloud_function');
                                        try {
                                          final result = await FirebaseFunctions
                                              .instance
                                              .httpsCallable('addFriendRequest')
                                              .call({
                                            "senderId": currentUserUid,
                                            "receiverId":
                                                availableUsersListItem.uid,
                                          });
                                          _model.addFriendFuncRes =
                                              AddFriendRequestCloudFunctionCallResponse(
                                            data: NormalFunctionResponseStruct
                                                .fromMap(result.data),
                                            succeeded: true,
                                            resultAsString:
                                                result.data.toString(),
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              _model.addFriendFuncRes!.data!
                                                  .message,
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
                                            backgroundColor: _model
                                                    .addFriendFuncRes!
                                                    .data!
                                                    .success
                                                ? FlutterFlowTheme.of(context)
                                                    .success
                                                : FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );

                                        setState(() {});
                                      },
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
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
