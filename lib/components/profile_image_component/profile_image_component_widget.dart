import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_image_component_model.dart';
export 'profile_image_component_model.dart';

class ProfileImageComponentWidget extends StatefulWidget {
  const ProfileImageComponentWidget({
    Key? key,
    this.imageUrl,
    int? imageSize,
  })  : this.imageSize = imageSize ?? 50,
        super(key: key);

  final String? imageUrl;
  final int imageSize;

  @override
  _ProfileImageComponentWidgetState createState() =>
      _ProfileImageComponentWidgetState();
}

class _ProfileImageComponentWidgetState
    extends State<ProfileImageComponentWidget> {
  late ProfileImageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileImageComponentModel());
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
      width: widget.imageSize != null ? widget.imageSize.toDouble() : 100.0,
      height: widget.imageSize != null ? widget.imageSize.toDouble() : 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primary,
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          valueOrDefault<String>(
            widget.imageUrl,
            'https://firebasestorage.googleapis.com/v0/b/betcha-test.appspot.com/o/default-avatar.jpeg?alt=media&token=519e6782-f64a-40c0-a5b9-866d2a75eeeb',
          ),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
