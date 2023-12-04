import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/profile_image_component/profile_image_component_widget.dart';
import '/components/wagers_components/pick_participants_in_wager/pick_participants_in_wager_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_wager_widget.dart' show CreateWagerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateWagerModel extends FlutterFlowModel<CreateWagerWidget> {
  ///  Local state fields for this page.

  String selectedGameMode = '';

  List<UsersRecord> pickedParticipants = [];
  void addToPickedParticipants(UsersRecord item) =>
      pickedParticipants.add(item);
  void removeFromPickedParticipants(UsersRecord item) =>
      pickedParticipants.remove(item);
  void removeAtIndexFromPickedParticipants(int index) =>
      pickedParticipants.removeAt(index);
  void insertAtIndexInPickedParticipants(int index, UsersRecord item) =>
      pickedParticipants.insert(index, item);
  void updatePickedParticipantsAtIndex(
          int index, Function(UsersRecord) updateFn) =>
      pickedParticipants[index] = updateFn(pickedParticipants[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for GamesDD widget.
  String? gamesDDValue;
  FormFieldController<String>? gamesDDValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in GamesDD widget.
  GamesRecord? selectedGameRef;
  // State field(s) for GameModesDD widget.
  String? gameModesDDValue;
  FormFieldController<String>? gameModesDDValueController;
  // State field(s) for AmountTF widget.
  FocusNode? amountTFFocusNode;
  TextEditingController? amountTFController;
  String? Function(BuildContext, String?)? amountTFControllerValidator;
  String? _amountTFControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter wager amount';
    }

    return null;
  }

  // State field(s) for PrivacySettingsDD widget.
  String? privacySettingsDDValue;
  FormFieldController<String>? privacySettingsDDValueController;
  // Stores action output result for [Bottom Sheet - PickParticipantsInWager] action in AddFriendsBtn widget.
  List<UsersRecord>? returnedPickedParticipants;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    amountTFControllerValidator = _amountTFControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    amountTFFocusNode?.dispose();
    amountTFController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
