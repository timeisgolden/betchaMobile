import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Email_Signin widget.
  FocusNode? emailSigninFocusNode;
  TextEditingController? emailSigninController;
  String? Function(BuildContext, String?)? emailSigninControllerValidator;
  // State field(s) for Password_Signin widget.
  FocusNode? passwordSigninFocusNode;
  TextEditingController? passwordSigninController;
  late bool passwordSigninVisibility;
  String? Function(BuildContext, String?)? passwordSigninControllerValidator;
  // State field(s) for ConPassword_Signin widget.
  FocusNode? conPasswordSigninFocusNode;
  TextEditingController? conPasswordSigninController;
  late bool conPasswordSigninVisibility;
  String? Function(BuildContext, String?)? conPasswordSigninControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordSigninVisibility = false;
    conPasswordSigninVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailSigninFocusNode?.dispose();
    emailSigninController?.dispose();

    passwordSigninFocusNode?.dispose();
    passwordSigninController?.dispose();

    conPasswordSigninFocusNode?.dispose();
    conPasswordSigninController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
