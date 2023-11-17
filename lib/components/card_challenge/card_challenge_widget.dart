import '/components/wager_component/wager_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_challenge_model.dart';
export 'card_challenge_model.dart';

class CardChallengeWidget extends StatefulWidget {
  const CardChallengeWidget({
    Key? key,
    this.imageURL,
    required this.avatarUrl,
    required this.title1,
    required this.title2,
    required this.username,
    required this.betText,
    required this.wagerPrice,
  }) : super(key: key);

  final String? imageURL;
  final String? avatarUrl;
  final String? title1;
  final String? title2;
  final String? username;
  final String? betText;
  final String? wagerPrice;

  @override
  _CardChallengeWidgetState createState() => _CardChallengeWidgetState();
}

class _CardChallengeWidgetState extends State<CardChallengeWidget> {
  late CardChallengeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardChallengeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: double.infinity,
        height: 210.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                'assets/images/marcusafinley_In_a_1.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                wrapWithModel(
                  model: _model.wagerComponentModel,
                  updateCallback: () => setState(() {}),
                  child: WagerComponentWidget(
                    title1: widget.title1!,
                    title2: widget.title2!,
                    username: widget.username!,
                    betText: widget.betText!,
                    wagerPrice: widget.wagerPrice!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
