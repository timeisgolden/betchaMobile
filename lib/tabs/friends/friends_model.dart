import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/components/friends/friend_list_component/friend_list_component_widget.dart';
import '/components/friends/received_requests/received_requests_widget.dart';
import '/components/friends/sent_requests/sent_requests_widget.dart';
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
  // Model for ReceivedRequests component.
  late ReceivedRequestsModel receivedRequestsModel;
  // Model for SentRequests component.
  late SentRequestsModel sentRequestsModel;
  // Model for UserListComponent component.
  late UserListComponentModel userListComponentModel;
  // Model for BottomNavigationComponent component.
  late BottomNavigationComponentModel bottomNavigationComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    friendListComponentModel =
        createModel(context, () => FriendListComponentModel());
    receivedRequestsModel = createModel(context, () => ReceivedRequestsModel());
    sentRequestsModel = createModel(context, () => SentRequestsModel());
    userListComponentModel =
        createModel(context, () => UserListComponentModel());
    bottomNavigationComponentModel =
        createModel(context, () => BottomNavigationComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    friendListComponentModel.dispose();
    receivedRequestsModel.dispose();
    sentRequestsModel.dispose();
    userListComponentModel.dispose();
    bottomNavigationComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
