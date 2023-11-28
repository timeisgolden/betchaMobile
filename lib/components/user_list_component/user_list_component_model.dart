import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_list_component_widget.dart' show UserListComponentWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserListComponentModel extends FlutterFlowModel<UserListComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Cloud Function - deleteFriendship] action in ConditionalBuilder widget.
  DeleteFriendshipCloudFunctionCallResponse? functionRes;
  // Stores action output result for [Cloud Function - addFriendRequest] action in IconButton widget.
  AddFriendRequestCloudFunctionCallResponse? addFriendFuncRes;
  // Stores action output result for [Cloud Function - deleteFriendship] action in IconButton widget.
  DeleteFriendshipCloudFunctionCallResponse? deleteFriendFuncRes;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
