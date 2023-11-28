import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_alert_component_model.dart';
export 'loading_alert_component_model.dart';

class LoadingAlertComponentWidget extends StatefulWidget {
  const LoadingAlertComponentWidget({
    Key? key,
    String? loadingText,
  })  : this.loadingText = loadingText ?? 'Processing...',
        super(key: key);

  final String loadingText;

  @override
  _LoadingAlertComponentWidgetState createState() =>
      _LoadingAlertComponentWidgetState();
}

class _LoadingAlertComponentWidgetState
    extends State<LoadingAlertComponentWidget> {
  late LoadingAlertComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingAlertComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).customColor1,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json',
            width: 60.0,
            height: 40.0,
            fit: BoxFit.cover,
            animate: true,
          ),
          Text(
            'Processing...',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ],
      ),
    );
  }
}
