import '/flutter_flow/flutter_flow_util.dart';
import 'payment_method_widget.dart' show PaymentMethodWidget;
import 'package:flutter/material.dart';

class PaymentMethodModel extends FlutterFlowModel<PaymentMethodWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
