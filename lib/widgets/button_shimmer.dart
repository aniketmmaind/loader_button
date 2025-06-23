import 'package:flutter/material.dart';
import 'package:loader_button/src/loader_button_main.dart';

// Button Shimmer Animation Effect both (Using highlight,base color and gradient).
class ButtonShimmer extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color baseColor;
  final Color highlightColor;
  final Gradient? gradient;
  final bool useGradient;
  final ButtonShimmerDirection direction;

  const ButtonShimmer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.baseColor = const Color(0xFFEEEEEE),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.gradient,
    this.useGradient = false,
    this.direction = ButtonShimmerDirection.ltr,
  });

  @override
  State<ButtonShimmer> createState() => _ButtonShimmerState();
}

class _ButtonShimmerState extends State<ButtonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Alignment get beginAlignment {
    switch (widget.direction) {
      case ButtonShimmerDirection.ltr:
        return Alignment.centerLeft;
      case ButtonShimmerDirection.rtl:
        return Alignment.centerRight;
      case ButtonShimmerDirection.ttb:
        return Alignment.topCenter;
      case ButtonShimmerDirection.btt:
        return Alignment.bottomCenter;
    }
  }

  Alignment get endAlignment {
    switch (widget.direction) {
      case ButtonShimmerDirection.ltr:
        return Alignment.centerRight;
      case ButtonShimmerDirection.rtl:
        return Alignment.centerLeft;
      case ButtonShimmerDirection.ttb:
        return Alignment.bottomCenter;
      case ButtonShimmerDirection.btt:
        return Alignment.topCenter;
    }
  }

  @override
  Widget build(BuildContext context) {
    final LinearGradient autoGradient = LinearGradient(
      begin: beginAlignment,
      end: endAlignment,
      colors: [widget.baseColor, widget.highlightColor, widget.baseColor],
      stops: const [0.1, 0.5, 0.9],
    );

    final Gradient effectiveGradient =
        widget.useGradient && widget.gradient != null
            ? widget.gradient!
            : autoGradient;

    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            final width = bounds.width;
            final height = bounds.height;

            double dx = 0, dy = 0;
            switch (widget.direction) {
              case ButtonShimmerDirection.ltr:
                dx = _controller.value * 2 * width - width;
                break;
              case ButtonShimmerDirection.rtl:
                dx = -_controller.value * 2 * width + width;
                break;
              case ButtonShimmerDirection.ttb:
                dy = _controller.value * 2 * height - height;
                break;
              case ButtonShimmerDirection.btt:
                dy = -_controller.value * 2 * height + height;
                break;
            }

            if (widget.direction == ButtonShimmerDirection.ltr ||
                widget.direction == ButtonShimmerDirection.rtl) {
              return effectiveGradient.createShader(
                Rect.fromLTWH(dx, 0, 2 * width, height),
              );
            } else {
              return effectiveGradient.createShader(
                Rect.fromLTWH(0, dy, width, 2 * height),
              );
            }
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
    );
  }
}
