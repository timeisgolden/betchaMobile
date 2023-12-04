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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_wager_model.dart';
export 'create_wager_model.dart';

class CreateWagerWidget extends StatefulWidget {
  const CreateWagerWidget({Key? key}) : super(key: key);

  @override
  _CreateWagerWidgetState createState() => _CreateWagerWidgetState();
}

class _CreateWagerWidgetState extends State<CreateWagerWidget> {
  late CreateWagerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateWagerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CreateWager'});
    _model.amountTFController ??= TextEditingController();
    _model.amountTFFocusNode ??= FocusNode();
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

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).customColor5,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).customColor5,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CREATE_WAGER_chevron_left_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Create New Wager',
            style: FlutterFlowTheme.of(context).titleLarge,
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).customColor5,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FutureBuilder<List<GamesRecord>>(
                              future: queryGamesRecordOnce(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<GamesRecord> gamesDDGamesRecordList =
                                    snapshot.data!;
                                return FlutterFlowDropDown<String>(
                                  controller: _model.gamesDDValueController ??=
                                      FormFieldController<String>(null),
                                  options: gamesDDGamesRecordList
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(() => _model.gamesDDValue = val);
                                    logFirebaseEvent(
                                        'CREATE_WAGER_GamesDD_ON_FORM_WIDGET_SELE');
                                    logFirebaseEvent('GamesDD_firestore_query');
                                    _model.selectedGameRef =
                                        await queryGamesRecordOnce(
                                      queryBuilder: (gamesRecord) =>
                                          gamesRecord.where(
                                        'name',
                                        isEqualTo: _model.gamesDDValue,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);

                                    setState(() {});
                                  },
                                  width: double.infinity,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  hintText: 'Select Game...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  fillColor:
                                      FlutterFlowTheme.of(context).customColor5,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).borderColor,
                                  borderWidth: 1.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                            if (_model.selectedGameRef?.reference != null)
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.gameModesDDValueController ??=
                                        FormFieldController<String>(null),
                                options: _model.selectedGameRef!.gameModes,
                                onChanged: (val) => setState(
                                    () => _model.gameModesDDValue = val),
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Game Mode',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                fillColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).borderColor,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            TextFormField(
                              controller: _model.amountTFController,
                              focusNode: _model.amountTFFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.amountTFController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Wager Amount',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .borderColor,
                                    ),
                                hintText: 'Wager Amount',
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .borderColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              keyboardType: TextInputType.number,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              validator: _model.amountTFControllerValidator
                                  .asValidator(context),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.privacySettingsDDValueController ??=
                                        FormFieldController<String>(null),
                                options: FFAppState().AvailablePrivateSettings,
                                onChanged: (val) async {
                                  setState(() =>
                                      _model.privacySettingsDDValue = val);
                                  logFirebaseEvent(
                                      'CREATE_WAGER_PrivacySettingsDD_ON_FORM_W');
                                  logFirebaseEvent(
                                      'PrivacySettingsDD_update_page_state');
                                  setState(() {
                                    _model.pickedParticipants = [];
                                  });
                                },
                                width: double.infinity,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Privacy Settings',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                fillColor:
                                    FlutterFlowTheme.of(context).customColor5,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).borderColor,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                            if (_model.privacySettingsDDValue != null &&
                                _model.privacySettingsDDValue != '')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Participants',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      if (_model.privacySettingsDDValue !=
                                          'Public')
                                        FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'CREATE_WAGER_PAGE_AddFriendsBtn_ON_TAP');
                                            logFirebaseEvent(
                                                'AddFriendsBtn_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x66000000),
                                              isDismissible: false,
                                              enableDrag: false,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.7,
                                                      child:
                                                          PickParticipantsInWagerWidget(
                                                        pickedParticipants: _model
                                                            .pickedParticipants,
                                                        privateSettings: _model
                                                            .privacySettingsDDValue!,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.returnedPickedParticipants =
                                                    value));

                                            logFirebaseEvent(
                                                'AddFriendsBtn_update_page_state');
                                            setState(() {
                                              _model.pickedParticipants = _model
                                                  .returnedPickedParticipants!
                                                  .toList()
                                                  .cast<UsersRecord>();
                                            });

                                            setState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            _model.privacySettingsDDValue ==
                                                    'Friends Only'
                                                ? 'Invite Friends'
                                                : 'Invite Participants',
                                            'Invite',
                                          ),
                                          icon: Icon(
                                            Icons.add,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      fontSize: 12.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                    ],
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                    child: Builder(
                                      builder: (context) {
                                        if (_model.privacySettingsDDValue !=
                                            'Public') {
                                          return Builder(
                                            builder: (context) {
                                              final participants = _model
                                                  .pickedParticipants
                                                  .toList();
                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: List.generate(
                                                      participants.length,
                                                      (participantsIndex) {
                                                    final participantsItem =
                                                        participants[
                                                            participantsIndex];
                                                    return Container(
                                                      width: 80.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ProfileImageComponentWidget(
                                                            key: Key(
                                                                'Keydwa_${participantsIndex}_of_${participants.length}'),
                                                            imageUrl:
                                                                participantsItem
                                                                    .photoUrl,
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              participantsItem
                                                                  .displayName,
                                                              'No Name',
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      10.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    );
                                                  }).divide(
                                                      SizedBox(width: 2.0)),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return Text(
                                            'This wager is set to Public. It\'s open for participation by anyone interested.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 12.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CREATE_WAGER_CREATE_WAGER_BTN_ON_TAP');
                          logFirebaseEvent('Button_validate_form');
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (_model.gamesDDValue == null) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select a game',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            return;
                          }
                          if (_model.gameModesDDValue == null) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select game mode',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            return;
                          }
                          if (_model.privacySettingsDDValue == null) {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please select privacy settings',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            return;
                          }
                          if ((_model.privacySettingsDDValue ==
                                  'Friends Only') &&
                              (_model.pickedParticipants.length == 0)) {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Kindly ensure the selection of at least one friend.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            return;
                          } else if ((_model.privacySettingsDDValue ==
                                  'Private') &&
                              (_model.pickedParticipants.length == 0)) {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Kindly ensure the selection of at least one participant.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                            return;
                          } else {
                            logFirebaseEvent('Button_backend_call');

                            await WagersRecord.collection.doc().set({
                              ...createWagersRecordData(
                                initiatorId: currentUserReference,
                                gameId: _model.selectedGameRef?.reference,
                                selectedGameMode: _model.gameModesDDValue,
                                amount: double.tryParse(
                                    _model.amountTFController.text),
                                status: 'pending',
                                privacySettings: _model.privacySettingsDDValue,
                              ),
                              ...mapToFirestore(
                                {
                                  'participants': _model.pickedParticipants
                                      .map((e) => e.reference)
                                      .toList(),
                                  'createdAt': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Created a new wager successfuly.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                            logFirebaseEvent('Button_reset_form_fields');
                            setState(() {
                              _model.gamesDDValueController?.reset();
                              _model.gameModesDDValueController?.reset();
                              _model.privacySettingsDDValueController?.reset();
                            });
                            logFirebaseEvent('Button_reset_form_fields');
                            setState(() {
                              _model.amountTFController?.clear();
                            });
                          }
                        },
                        text: 'Create Wager',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                              ),
                          elevation: 4.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
