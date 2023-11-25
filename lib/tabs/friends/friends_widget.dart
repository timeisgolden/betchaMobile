import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/components/friends/friend_list_component/friend_list_component_widget.dart';
import '/components/friends/requests_component/requests_component_widget.dart';
import '/components/user_list_component/user_list_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'friends_model.dart';
export 'friends_model.dart';

class FriendsWidget extends StatefulWidget {
  const FriendsWidget({Key? key}) : super(key: key);

  @override
  _FriendsWidgetState createState() => _FriendsWidgetState();
}

class _FriendsWidgetState extends State<FriendsWidget>
    with TickerProviderStateMixin {
  late FriendsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'tabOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.7, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'tabOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.7, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'tabOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(0.7, 0.7),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Friends'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).customColor5,
        appBar: AppBar(
          backgroundColor: Color(0xFF111111),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('FRIENDS_PAGE_chevron_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Friends List',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                isScrollable: true,
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 24.0,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 18.0,
                                        ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primary,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                tabs: [
                                  Tab(
                                    text: 'Friends',
                                  ).animateOnPageLoad(animationsMap[
                                      'tabOnPageLoadAnimation1']!),
                                  Tab(
                                    text: 'Requests',
                                  ).animateOnPageLoad(animationsMap[
                                      'tabOnPageLoadAnimation2']!),
                                  Tab(
                                    text: 'All Users',
                                  ).animateOnPageLoad(animationsMap[
                                      'tabOnPageLoadAnimation3']!),
                                ],
                                controller: _model.tabBarController,
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  wrapWithModel(
                                    model: _model.friendListComponentModel,
                                    updateCallback: () => setState(() {}),
                                    child: FriendListComponentWidget(),
                                  ),
                                  wrapWithModel(
                                    model: _model.requestsComponentModel,
                                    updateCallback: () => setState(() {}),
                                    child: RequestsComponentWidget(),
                                  ),
                                  wrapWithModel(
                                    model: _model.userListComponentModel,
                                    updateCallback: () => setState(() {}),
                                    child: UserListComponentWidget(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 120.0)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: wrapWithModel(
                    model: _model.bottomNavigationComponentModel,
                    updateCallback: () => setState(() {}),
                    child: BottomNavigationComponentWidget(
                      selectedPageIndex: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
