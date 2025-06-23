import 'package:flutter/material.dart';
import 'package:loader_button/properties/animation_outline_prop.dart';
import 'dart:math';

class LoaderButtonAnimatedOutline extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final Widget? loadingWidget;
  final AnimatedOutlineStyles? animatedOutlineStyle;
  final FocusNode? focusNode;

  // Events
  final VoidCallback? onClick;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final VoidCallback? onTapCancel;
  final void Function(bool)? onHover;
  final MouseCursor? mouseCursor;
  final void Function(bool)? onFocusChange;

  const LoaderButtonAnimatedOutline({
    super.key,
    this.focusNode,
    required this.child,
    required this.isLoading,
    this.loadingWidget,
    this.animatedOutlineStyle,
    this.onClick,
    this.onLongPress,
    this.onDoubleTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.onFocusChange,
  });

  @override
  State<LoaderButtonAnimatedOutline> createState() =>
      _LoaderButtonAnimatedOutlineState();
}

class _LoaderButtonAnimatedOutlineState
    extends State<LoaderButtonAnimatedOutline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  static const _defaultProperties = AnimatedOutlineStyles();

  AnimatedOutlineStyles get props =>
      widget.animatedOutlineStyle ?? _defaultProperties;

  ShapeBorder get shape => props.shape ?? StadiumBorder();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: props.animationDuration,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant LoaderButtonAnimatedOutline oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.animatedOutlineStyle?.animationDuration ??
            _defaultProperties.animationDuration) !=
        props.animationDuration) {
      _controller.duration = props.animationDuration;
      _controller.reset();
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          constraints: BoxConstraints(
            minWidth: props.minSize?.width ?? 50,
            minHeight: props.minSize?.height ?? 50,
            maxWidth: props.maxSize?.width ?? double.infinity,
            maxHeight: props.maxSize?.height ?? double.infinity,
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _ShimmerGradientBorderPainter(
                  progress: _controller.value,
                  baseColor: props.borderColor,
                  strokeWidth: props.borderWidth,
                  shape: shape,
                  isLoading: widget.isLoading,
                  shimmerColors: props.animationColors,
                  animationDirection: props.animationDirection,
                  glowBlurRadius: props.glowBlurRadius,
                ),
                child: child,
              );
            },
            child: Material(
              color: props.backgroundColor ?? Colors.transparent,
              shape: shape,
              child: InkWell(
                focusNode: widget.focusNode,
                onTap: widget.isLoading ? null : widget.onClick,
                onDoubleTap: widget.isLoading ? null : widget.onDoubleTap,
                onLongPress: widget.isLoading ? null : widget.onLongPress,
                onTapDown: widget.isLoading ? null : widget.onTapDown,
                onTapUp: widget.isLoading ? null : widget.onTapUp,
                onTapCancel: widget.isLoading ? null : widget.onTapCancel,
                onHover: widget.onHover,
                mouseCursor: widget.mouseCursor,
                onFocusChange: widget.onFocusChange,
                customBorder: shape,
                child: Padding(
                  padding: props.contentPadding ?? const EdgeInsets.all(0),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child:
                          widget.isLoading
                              ? widget.loadingWidget ??
                                  const CircularProgressIndicator(
                                    color: Colors.blue,
                                  )
                              : widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ShimmerGradientBorderPainter extends CustomPainter {
  final double progress;
  final Color baseColor;
  final double strokeWidth;
  final ShapeBorder shape;
  final bool isLoading;
  final List<Color>? shimmerColors;
  final AnimationDirection animationDirection;
  final double glowBlurRadius;

  _ShimmerGradientBorderPainter({
    required this.progress,
    required this.baseColor,
    required this.strokeWidth,
    required this.shape,
    required this.isLoading,
    required this.shimmerColors,
    required this.animationDirection,
    required this.glowBlurRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = shape.getOuterPath(Offset.zero & size);

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    if (!isLoading) {
      paint.color = baseColor;
      canvas.drawPath(path, paint);
    } else {
      final colors =
          shimmerColors?.isNotEmpty == true
              ? shimmerColors!
              : [Colors.red, Colors.yellow, Colors.blue];
      final wrappedColors = List<Color>.from(colors)..add(colors.first);
      final stops = List.generate(
        wrappedColors.length,
        (i) => i / (wrappedColors.length - 1),
      );
      final directionMultiplier =
          animationDirection == AnimationDirection.ltr ? 1 : -1;

      final gradient = SweepGradient(
        startAngle: 0,
        endAngle: 2 * pi,
        colors: wrappedColors,
        stops: stops,
        transform: GradientRotation(2 * pi * progress * directionMultiplier),
      );

      final shimmerPaint =
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..shader = gradient.createShader(Offset.zero & size);

      canvas.drawPath(path, shimmerPaint);

      final glowPaint =
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..shader = gradient.createShader(Offset.zero & size)
            ..maskFilter = MaskFilter.blur(BlurStyle.outer, glowBlurRadius);

      canvas.drawPath(path, glowPaint);
    }
  }

  @override
  bool shouldRepaint(_ShimmerGradientBorderPainter old) =>
      old.progress != progress ||
      old.isLoading != isLoading ||
      old.shimmerColors != shimmerColors ||
      old.shape != shape ||
      old.animationDirection != animationDirection ||
      old.glowBlurRadius != glowBlurRadius;
}
