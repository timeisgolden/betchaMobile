import '/flutter_flow/flutter_flow_util.dart';
import 'new_card_widget.dart' show NewCardWidget;
import 'package:flutter/material.dart';

class NewCardModel extends FlutterFlowModel<NewCardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
