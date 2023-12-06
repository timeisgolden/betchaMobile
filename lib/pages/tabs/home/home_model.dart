import '/backend/schema/enums/enums.dart';
import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/components/card_challenge/card_challenge_widget.dart';
import '/components/card_live_challenge/card_live_challenge_widget.dart';
import '/components/card_upcoming_event/card_upcoming_event_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CardLiveChallenge component.
  late CardLiveChallengeModel cardLiveChallengeModel;
  // Model for CardUpcomingEvent component.
  late CardUpcomingEventModel cardUpcomingEventModel1;
  // Model for CardUpcomingEvent component.
  late CardUpcomingEventModel cardUpcomingEventModel2;
  // Model for CardChallenge component.
  late CardChallengeModel cardChallengeModel;
  // Model for BottomNavigationComponent component.
  late BottomNavigationComponentModel bottomNavigationComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cardLiveChallengeModel =
        createModel(context, () => CardLiveChallengeModel());
    cardUpcomingEventModel1 =
        createModel(context, () => CardUpcomingEventModel());
    cardUpcomingEventModel2 =
        createModel(context, () => CardUpcomingEventModel());
    cardChallengeModel = createModel(context, () => CardChallengeModel());
    bottomNavigationComponentModel =
        createModel(context, () => BottomNavigationComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cardLiveChallengeModel.dispose();
    cardUpcomingEventModel1.dispose();
    cardUpcomingEventModel2.dispose();
    cardChallengeModel.dispose();
    bottomNavigationComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
