import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/components/card_challenge/card_challenge_widget.dart';
import '/components/card_upcoming_event/card_upcoming_event_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF111111),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 34.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/betcha-white_1_(1).png',
                                  width: 125.0,
                                  height: 37.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: 103.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF393939),
                                  borderRadius: BorderRadius.circular(45.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Wallet');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\$350',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              color: Color(0xFFD7FC70),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Icon(
                                        Icons.account_balance_wallet_outlined,
                                        color: Color(0xFFD7FC70),
                                        size: 25.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 82.0,
                                height: 63.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(18.0),
                                  border: Border.all(
                                    color: Color(0xFFD7FC70),
                                    width: 3.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Start\nWager',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Sora',
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    height: 63.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD7FC70),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'How Betcha Works?  ',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Get started in the next 5 mins :-)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Colors.black,
                                                            fontSize: 11.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Icon(
                                            Icons.keyboard_arrow_right_outlined,
                                            color: Colors.black,
                                            size: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Live Challenges',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'Seel All',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF808080),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 8.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 184.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF111111),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/Screen_Shot_2023-09-22_at_2.01_1.png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color: Color(0xFF5B5B5B),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD7FC70),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              '1 V 1 Mode',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                            child: VerticalDivider(
                                              thickness: 1.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'NBA 2K',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 58.0,
                                        height: 28.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x5B5B5B33),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '\$50',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Sora',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5B5B5B),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Mike Smith\n W 12 - L 3',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 2.0, 0.0, 2.0),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Mask_group.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'VS',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 2.0, 0.0, 2.0),
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/Mask_group.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'JaredJCarter\nW 34 - L 31',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 32.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Upcoming Event',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('ShowMorepopularevent');
                                },
                                child: Text(
                                  'Sell All',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF808080),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.cardUpcomingEventModel1,
                                  updateCallback: () => setState(() {}),
                                  child: CardUpcomingEventWidget(),
                                ),
                                wrapWithModel(
                                  model: _model.cardUpcomingEventModel2,
                                  updateCallback: () => setState(() {}),
                                  child: CardUpcomingEventWidget(),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 32.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Open Challenges',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFFFBFBFB),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                'Sell All',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF808080),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.cardChallengeModel,
                                updateCallback: () => setState(() {}),
                                child: CardChallengeWidget(
                                  avatarUrl: 'test',
                                  title1: 'NBA 2k',
                                  title2: '1v1 Mode',
                                  username: 'JaredJCarter',
                                  betText: 'W 34 - L 31',
                                  wagerPrice: '\$70',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 22.0, 0.0, 0.0),
                              child: Container(
                                width: 329.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF2F2F2F),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Madden 23K',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Color(0xFFFBFBFB),
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.0,
                                      child: VerticalDivider(
                                        thickness: 1.0,
                                        color: Color(0xFFFBFBFB),
                                      ),
                                    ),
                                    Text(
                                      '1 V 1 Mode',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFFFBFBFB),
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 329.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF5B5B5B),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 2.0, 0.0, 2.0),
                                    child: Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      child: Container(
                                        width: 50.0,
                                        height: 50.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Mask_group.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'JaredJCarter\nW 34 - L 31',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Sora',
                                            color: Color(0xFFFBFBFB),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 82.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF464646),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '\$50',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Sora',
                                                  color: Color(0xFFD7FC70),
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 22.0, 0.0, 0.0),
                          child: Container(
                            width: 329.0,
                            height: 42.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF2F2F2F),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'NBA 2K',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Color(0xFFFBFBFB),
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                  child: VerticalDivider(
                                    thickness: 1.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '1 V 1 Mode',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFFFBFBFB),
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 329.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF5B5B5B),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 2.0, 0.0, 2.0),
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/Mask_group.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'JaredJCarter\nW 34 - L 31',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Sora',
                                        color: Color(0xFFFBFBFB),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    50.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 82.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF464646),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\$50',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              color: Color(0xFFD7FC70),
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 120.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
                  child: wrapWithModel(
                    model: _model.bottomNavigationComponentModel,
                    updateCallback: () => setState(() {}),
                    child: BottomNavigationComponentWidget(
                      selectedPageIndex: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}