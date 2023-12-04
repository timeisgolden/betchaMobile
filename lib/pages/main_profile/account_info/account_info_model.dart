import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'account_info_widget.dart' show AccountInfoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountInfoModel extends FlutterFlowModel<AccountInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for DisplayNameText widget.
  FocusNode? displayNameTextFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  // State field(s) for PhoneText widget.
  FocusNode? phoneTextFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for twitchUrlText widget.
  FocusNode? twitchUrlTextFocusNode;
  TextEditingController? twitchUrlTextController;
  String? Function(BuildContext, String?)? twitchUrlTextControllerValidator;
  // State field(s) for YoutubeUrlText widget.
  FocusNode? youtubeUrlTextFocusNode;
  TextEditingController? youtubeUrlTextController;
  String? Function(BuildContext, String?)? youtubeUrlTextControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    displayNameTextFocusNode?.dispose();
    displayNameTextController?.dispose();

    phoneTextFocusNode?.dispose();
    phoneTextController?.dispose();

    twitchUrlTextFocusNode?.dispose();
    twitchUrlTextController?.dispose();

    youtubeUrlTextFocusNode?.dispose();
    youtubeUrlTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
