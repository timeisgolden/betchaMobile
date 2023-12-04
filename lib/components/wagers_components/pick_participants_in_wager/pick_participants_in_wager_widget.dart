import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/profile_image_component/profile_image_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pick_participants_in_wager_model.dart';
export 'pick_participants_in_wager_model.dart';

class PickParticipantsInWagerWidget extends StatefulWidget {
  const PickParticipantsInWagerWidget({
    Key? key,
    required this.pickedParticipants,
    String? privateSettings,
  })  : this.privateSettings = privateSettings ?? 'Friends Only',
        super(key: key);

  final List<UsersRecord>? pickedParticipants;
  final String privateSettings;

  @override
  _PickParticipantsInWagerWidgetState createState() =>
      _PickParticipantsInWagerWidgetState();
}

class _PickParticipantsInWagerWidgetState
    extends State<PickParticipantsInWagerWidget> {
  late PickParticipantsInWagerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PickParticipantsInWagerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PICK_PARTICIPANTS_IN_WAGER_PickParticipa');
      logFirebaseEvent('PickParticipantsInWager_update_component');
      setState(() {
        _model.pickedFriends =
            widget.pickedParticipants!.toList().cast<UsersRecord>();
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).customColor1,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, -1.00),
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Invite Friends',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                'Select users from below to create new wager',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).customColor3,
                            borderRadius: 4.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PICK_PARTICIPANTS_IN_WAGER_close_ICN_ON_');
                              logFirebaseEvent('IconButton_bottom_sheet');
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            (int pickedUsersCount) {
                              return "${pickedUsersCount} selected";
                            }(valueOrDefault<int>(
                              _model.pickedFriends.length,
                              0,
                            )),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 80.0),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Builder(
                            builder: (context) {
                              if (widget.privateSettings == 'Friends Only') {
                                return FutureBuilder<List<FriendShipsRecord>>(
                                  future: queryFriendShipsRecordOnce(
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<FriendShipsRecord>
                                        friendsListViewFriendShipsRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          friendsListViewFriendShipsRecordList
                                              .length,
                                      itemBuilder:
                                          (context, friendsListViewIndex) {
                                        final friendsListViewFriendShipsRecord =
                                            friendsListViewFriendShipsRecordList[
                                                friendsListViewIndex];
                                        return FutureBuilder<UsersRecord>(
                                          future: UsersRecord.getDocumentOnce(
                                              friendsListViewFriendShipsRecord
                                                  .userId!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final replaceWidgetUsersRecord =
                                                snapshot.data!;
                                            return AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 150),
                                              curve: Curves.easeInOut,
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 8.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ProfileImageComponentWidget(
                                                      key: Key(
                                                          'Keyomm_${friendsListViewIndex}_of_${friendsListViewFriendShipsRecordList.length}'),
                                                      imageUrl:
                                                          replaceWidgetUsersRecord
                                                              .photoUrl,
                                                      imageSize: 28,
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                replaceWidgetUsersRecord
                                                                    .displayName,
                                                                'No Name',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  replaceWidgetUsersRecord
                                                                      .email,
                                                                  'No Email',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          11.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        if (functions.checkIfPickedFriendsExistCF(
                                                                _model
                                                                    .pickedFriends
                                                                    .toList(),
                                                                replaceWidgetUsersRecord) ==
                                                            true) {
                                                          return FlutterFlowIconButton(
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons.check_box,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'PICK_PARTICIPANTS_IN_WAGER_check_box_ICN');
                                                              logFirebaseEvent(
                                                                  'IconButton_update_component_state');
                                                              setState(() {
                                                                _model.removeFromPickedFriends(
                                                                    replaceWidgetUsersRecord);
                                                              });
                                                            },
                                                          );
                                                        } else {
                                                          return FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .check_box_outline_blank,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .borderColor,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'PICK_PARTICIPANTS_IN_WAGER_check_box_out');
                                                              logFirebaseEvent(
                                                                  'IconButton_update_component_state');
                                                              setState(() {
                                                                _model.addToPickedFriends(
                                                                    replaceWidgetUsersRecord);
                                                              });
                                                            },
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              } else {
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord>
                                        usersListViewUsersRecordList = snapshot
                                            .data!
                                            .where(
                                                (u) => u.uid != currentUserUid)
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          usersListViewUsersRecordList.length,
                                      itemBuilder:
                                          (context, usersListViewIndex) {
                                        final usersListViewUsersRecord =
                                            usersListViewUsersRecordList[
                                                usersListViewIndex];
                                        return AnimatedContainer(
                                          duration: Duration(milliseconds: 150),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ProfileImageComponentWidget(
                                                  key: Key(
                                                      'Keyra9_${usersListViewIndex}_of_${usersListViewUsersRecordList.length}'),
                                                  imageUrl:
                                                      usersListViewUsersRecord
                                                          .photoUrl,
                                                  imageSize: 28,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            usersListViewUsersRecord
                                                                .displayName,
                                                            'No Name',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            usersListViewUsersRecord
                                                                .email,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      11.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    if (functions.checkIfPickedFriendsExistCF(
                                                            _model.pickedFriends
                                                                .toList(),
                                                            usersListViewUsersRecord) ==
                                                        true) {
                                                      return FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.check_box,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PICK_PARTICIPANTS_IN_WAGER_check_box_ICN');
                                                          logFirebaseEvent(
                                                              'IconButton_update_component_state');
                                                          setState(() {
                                                            _model.removeFromPickedFriends(
                                                                usersListViewUsersRecord);
                                                          });
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
                                                              .check_box_outline_blank_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .borderColor,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'PICK_PARTICIPANTS_IN_WAGER_check_box_out');
                                                          logFirebaseEvent(
                                                              'IconButton_update_component_state');
                                                          setState(() {
                                                            _model.addToPickedFriends(
                                                                usersListViewUsersRecord);
                                                          });
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.00, 1.00),
              child: Container(
                width: double.infinity,
                height: 80.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).customColor1,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'PICK_PARTICIPANTS_IN_WAGER_SEND_INVITES_');
                        if (_model.pickedFriends.length == 0) {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text(
                                    'You must select at least one user to create new wager.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          logFirebaseEvent('Button_bottom_sheet');
                          Navigator.pop(context, _model.pickedFriends);
                        }
                      },
                      text: 'Send Invites',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context).customColor1,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
