import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class ShakeDetectionWidget extends StatefulWidget {
  const ShakeDetectionWidget({
    required this.onShake,
    required this.child,
    super.key,
  });

  final VoidCallback onShake;
  final Widget child;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onShake', onShake));
    properties.add(ObjectFlagProperty<Widget>.has('child', child));
  }

  @override
  State<ShakeDetectionWidget> createState() => _ShakeDetectionWidgetState();
}

class _ShakeDetectionWidgetState extends State<ShakeDetectionWidget> {
  ShakeDetector? _detector;

  @override
  void initState() {
    super.initState();
    _detector = ShakeDetector.autoStart(
      onPhoneShake: (_) {
        widget.onShake();
      },
    );
  }

  @override
  void dispose() {
    _detector?.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
