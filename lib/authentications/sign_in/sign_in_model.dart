import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Email_Signup widget.
  FocusNode? emailSignupFocusNode;
  TextEditingController? emailSignupController;
  String? Function(BuildContext, String?)? emailSignupControllerValidator;
  // State field(s) for Password_Signup widget.
  FocusNode? passwordSignupFocusNode;
  TextEditingController? passwordSignupController;
  late bool passwordSignupVisibility;
  String? Function(BuildContext, String?)? passwordSignupControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordSignupVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailSignupFocusNode?.dispose();
    emailSignupController?.dispose();

    passwordSignupFocusNode?.dispose();
    passwordSignupController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
