import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/profile_image_component/profile_image_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pick_participants_in_wager_widget.dart'
    show PickParticipantsInWagerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PickParticipantsInWagerModel
    extends FlutterFlowModel<PickParticipantsInWagerWidget> {
  ///  Local state fields for this component.

  List<UsersRecord> pickedFriends = [];
  void addToPickedFriends(UsersRecord item) => pickedFriends.add(item);
  void removeFromPickedFriends(UsersRecord item) => pickedFriends.remove(item);
  void removeAtIndexFromPickedFriends(int index) =>
      pickedFriends.removeAt(index);
  void insertAtIndexInPickedFriends(int index, UsersRecord item) =>
      pickedFriends.insert(index, item);
  void updatePickedFriendsAtIndex(int index, Function(UsersRecord) updateFn) =>
      pickedFriends[index] = updateFn(pickedFriends[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
