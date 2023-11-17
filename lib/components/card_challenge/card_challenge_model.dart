import '/components/wager_component/wager_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_challenge_widget.dart' show CardChallengeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardChallengeModel extends FlutterFlowModel<CardChallengeWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for WagerComponent component.
  late WagerComponentModel wagerComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    wagerComponentModel = createModel(context, () => WagerComponentModel());
  }

  void dispose() {
    wagerComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
