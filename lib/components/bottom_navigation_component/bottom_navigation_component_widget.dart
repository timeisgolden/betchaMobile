import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_component_model.dart';
export 'bottom_navigation_component_model.dart';

class BottomNavigationComponentWidget extends StatefulWidget {
  const BottomNavigationComponentWidget({
    Key? key,
    required this.selectedTabName,
  }) : super(key: key);

  final EnumTabNames? selectedTabName;

  @override
  _BottomNavigationComponentWidgetState createState() =>
      _BottomNavigationComponentWidgetState();
}

class _BottomNavigationComponentWidgetState
    extends State<BottomNavigationComponentWidget> {
  late BottomNavigationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavigationComponentModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Container(
        width: double.infinity,
        height: 80.0,
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, -1.00),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.9,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/tabbar_background.svg',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAVIGATION_COMPONENT_TabHome_ON_T');
                              logFirebaseEvent('TabHome_navigate_to');

                              context.goNamed(
                                'Home',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: 48.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Opacity(
                                opacity:
                                    widget.selectedTabName == EnumTabNames.Home
                                        ? 1.0
                                        : 0.5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (widget.selectedTabName ==
                                        EnumTabNames.Home)
                                      Container(
                                        width: 6.0,
                                        height: 6.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.selectedTabName ==
                                            EnumTabNames.Home) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/home.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/home-outline.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Betcha',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAVIGATION_COMPONENT_TabFriends_O');
                              logFirebaseEvent('TabFriends_navigate_to');

                              context.goNamed(
                                'Friends',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: 48.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Opacity(
                                opacity: widget.selectedTabName ==
                                        EnumTabNames.Friends
                                    ? 1.0
                                    : 0.5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (widget.selectedTabName ==
                                        EnumTabNames.Friends)
                                      Container(
                                        width: 6.0,
                                        height: 6.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.selectedTabName ==
                                            EnumTabNames.Friends) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/elements.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/elements-outline.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Friends',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAVIGATION_COMPONENT_TabDiscover_');
                              logFirebaseEvent('TabDiscover_navigate_to');

                              context.goNamed(
                                'Wagers',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: 48.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Opacity(
                                opacity: widget.selectedTabName ==
                                        EnumTabNames.Wagers
                                    ? 1.0
                                    : 0.5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (widget.selectedTabName ==
                                        EnumTabNames.Wagers)
                                      Container(
                                        width: 6.0,
                                        height: 6.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.selectedTabName ==
                                            EnumTabNames.Wagers) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/elements.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/elements-outline.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Wagers',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAVIGATION_COMPONENT_TabInbox_ON_');
                              logFirebaseEvent('TabInbox_navigate_to');

                              context.goNamed(
                                'Inbox',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: 48.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Opacity(
                                opacity:
                                    widget.selectedTabName == EnumTabNames.Inbox
                                        ? 1.0
                                        : 0.5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (widget.selectedTabName ==
                                        EnumTabNames.Inbox)
                                      Container(
                                        width: 6.0,
                                        height: 6.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.selectedTabName ==
                                            EnumTabNames.Inbox) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/notifications.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/notifications-outline.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Inbox',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAVIGATION_COMPONENT_TabChats_ON_');
                              logFirebaseEvent('TabChats_navigate_to');

                              context.pushNamed(
                                'Chats',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: 48.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Opacity(
                                opacity:
                                    widget.selectedTabName == EnumTabNames.Chat
                                        ? 1.0
                                        : 0.5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (widget.selectedTabName ==
                                        EnumTabNames.Chat)
                                      Container(
                                        width: 6.0,
                                        height: 6.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.selectedTabName ==
                                            EnumTabNames.Chat) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/notifications.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/notifications-outline.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Chat',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_NAVIGATION_COMPONENT_TabProfile_O');
                              logFirebaseEvent('TabProfile_navigate_to');

                              context.goNamed(
                                'MainPofile',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Container(
                              width: 48.0,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Opacity(
                                opacity: widget.selectedTabName ==
                                        EnumTabNames.Profile
                                    ? 1.0
                                    : 0.5,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (widget.selectedTabName ==
                                        EnumTabNames.Profile)
                                      Container(
                                        width: 6.0,
                                        height: 6.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor5,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.selectedTabName ==
                                            EnumTabNames.Profile) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/profile.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 6.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/profile-outline.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Profile',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor5,
                                              fontSize: 11.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
