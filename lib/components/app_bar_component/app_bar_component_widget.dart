import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_bar_component_model.dart';
export 'app_bar_component_model.dart';

class AppBarComponentWidget extends StatefulWidget {
  const AppBarComponentWidget({
    Key? key,
    this.title,
    bool? isAllowBack,
  })  : this.isAllowBack = isAllowBack ?? false,
        super(key: key);

  final String? title;
  final bool isAllowBack;

  @override
  _AppBarComponentWidgetState createState() => _AppBarComponentWidgetState();
}

class _AppBarComponentWidgetState extends State<AppBarComponentWidget> {
  late AppBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(),
          child: Container(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                if (widget.isAllowBack)
                  Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).lineColor,
                        borderRadius: 10.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'APP_BAR_COMPONENT_chevron_left_ICN_ON_TA');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.pop();
                        },
                      ),
                    ),
                  ),
                if (widget.title != null && widget.title != '')
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Text(
                        widget.title!,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
