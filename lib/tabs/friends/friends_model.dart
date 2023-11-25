import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/components/friends/friend_list_component/friend_list_component_widget.dart';
import '/components/friends/requests_component/requests_component_widget.dart';
import '/components/user_list_component/user_list_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'friends_widget.dart' show FriendsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FriendsModel extends FlutterFlowModel<FriendsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for FriendListComponent component.
  late FriendListComponentModel friendListComponentModel;
  // Model for RequestsComponent component.
  late RequestsComponentModel requestsComponentModel;
  // Model for UserListComponent component.
  late UserListComponentModel userListComponentModel;
  // Model for BottomNavigationComponent component.
  late BottomNavigationComponentModel bottomNavigationComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    friendListComponentModel =
        createModel(context, () => FriendListComponentModel());
    requestsComponentModel =
        createModel(context, () => RequestsComponentModel());
    userListComponentModel =
        createModel(context, () => UserListComponentModel());
    bottomNavigationComponentModel =
        createModel(context, () => BottomNavigationComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    friendListComponentModel.dispose();
    requestsComponentModel.dispose();
    userListComponentModel.dispose();
    bottomNavigationComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
