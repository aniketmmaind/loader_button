import 'package:flutter/material.dart';

/// Defines the direction of the animated border outline.
///
/// - [ltr] → Animation flows from left to right.
/// - [rtl] → Animation flows from right to left.
///
enum AnimationDirection {
  /// Left to Right animation.
  ltr,

  /// Right to Left animation.
  rtl,
}

@immutable
class AnimatedOutlineStyles {
  
  /// The shape of the button border and outline.
  final ShapeBorder? shape;

  /// The border color.
  final Color borderColor;

  /// The thickness of the border.
  final double borderWidth;

  /// Padding inside the border for the child and loading widget.
  final EdgeInsetsGeometry? contentPadding;

  /// Background fill color inside the border.
  final Color? backgroundColor;

  /// Minimum size of the outlined button.
  final Size? minSize;

  /// Maximum size of the outlined button.
  final Size? maxSize;

  /// Colors to be animated along the border path.
  /// If null, a default gradient will be used.
  final List<Color>? animationColors;

  /// Duration for one complete animation cycle.
  final Duration animationDuration;

  /// Direction in which the animation flows.
  final AnimationDirection animationDirection;

  /// How much blur is applied to the animated glow effect.
  final double glowBlurRadius;

  ///AnimatedOutline Button Styles
  const AnimatedOutlineStyles({
    this.shape = const StadiumBorder(),
    this.borderColor = Colors.blue,
    this.borderWidth = 2.0,
    this.contentPadding,
    this.backgroundColor,
    this.maxSize,
    this.minSize,
    this.animationColors,
    this.animationDuration = const Duration(seconds: 2),
    this.animationDirection = AnimationDirection.ltr,
    this.glowBlurRadius = 1.0,
  });
}
