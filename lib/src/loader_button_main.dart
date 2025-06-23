import 'package:flutter/material.dart';
import 'package:loader_button/properties/animation_outline_prop.dart';
import 'package:loader_button/src/loader_button_animatedoutline.dart';
import 'package:loader_button/src/loader_button_default.dart';
import 'package:loader_button/src/loader_button_icon.dart';
import 'package:loader_button/src/loader_button_icon_text.dart';
import 'package:loader_button/src/loader_button_shimmer.dart';
import 'package:loader_button/src/loader_button_text.dart';

/// Defines the position of the [Icon] relative to the [label]
/// for `LoaderButton.iconText`.
///
/// This enum helps you choose where to place the icon:
/// - before or after label horizontally,
/// - above or below label vertically.
///
enum IconTextPosition {
  /// Displays the icon **before** the label horizontally.
  iconStart,

  /// Displays the icon **after** the label horizontally.
  iconEnd,

  /// Displays the icon **above** the label vertically.
  iconTop,

  /// Displays the icon **below** the label vertically.
  iconBottom,
}

/// Defines the direction of the shimmer animation
/// for `LoaderButton.shimmer`.
///
/// This enum controls the movement of the shimmer effect:
/// - **ltr**: Left to Right
/// - **rtl**: Right to Left
/// - **ttb**: Top to Bottom
/// - **btt**: Bottom to Top
///
enum ButtonShimmerDirection {
  /// Shimmer flows from Left to Right.
  ltr,

  /// Shimmer flows from Right to Left.
  rtl,

  /// Shimmer flows from Top to Bottom.
  ttb,

  /// Shimmer flows from Bottom to Top.
  btt,
}

/// A highly customizable button widget with built-in loading states,
/// shimmer, animated outline, and multiple button types.
///
/// This versatile button supports:
///  - A basic child widget
///  - Icon-only button
///  - Text-only button
///  - Icon+Text button with flexible positioning
///  - Shimmer effect button
///  - Animated outline button
///
/// Example usage:
/// ```dart
/// LoaderButton(
///   child: Text('Submit'),
///   isLoading: isLoading,
///   onClick: () {
///     // handle click
///   },
/// )
/// ```
///
/// See also:
/// * [LoaderButton.icon] for an icon-only button.
/// * [LoaderButton.text] for a text-only button.
/// * [LoaderButton.iconText] for a button with icon and text.
/// * [LoaderButton.shimmer] for a shimmer loading button.
/// * [LoaderButton.animatedOutline] for a button with an animated outline effect.
class LoaderButton extends StatefulWidget {
  /// The widget to display inside the button when [isLoading] is false.
  final Widget? child;

  /// The icon to display in icon or icon-text buttons.
  final Icon? icon;

  /// The text to display in text or icon-text buttons.
  final Widget? text;

  /// A custom widget to use as the label for icon-text buttons.
  final Widget? label;

  /// Whether to show the loading widget instead of the [child].
  final bool isLoading;

  /// The widget to show while loading.
  ///
  /// If null, a default [CircularProgressIndicator] may be shown.
  final Widget? loadingWidget;

  /// Defines the position of the icon relative to the label in an icon-text button.
  final IconTextPosition? iconPosition;

  /// Use `shimmerChildKey` to target exactly which part of your `loadingWidget`
  /// should display the shimmer effect. Other widgets remain unaffected.
  final Key? shimmerChildKey;

  //******************Default Properties******************//

  /// The minimum size of the button.
  final Size? minSize;

  /// The maximum size of the button.
  final Size? maxSize;

  /// Focus node to handle and control the button’s focus state.
  final FocusNode? focusNode;

  /// The decoration for the button.
  ///
  /// This is used for the default button type.
  final Decoration? decoration;

  //**********Shimmer Properties*************************//

  /// The gradient to paint for the shimmer animation it works only when `isGradient` is `true`
  final Gradient? gradient;

  /// To show gradient effect to shimmer default `false`.
  final bool? isGradient;

  /// The base color for the shimmer animation.
  final Color? baseColor;

  /// The highlight color for the shimmer animation.
  final Color? highlightColor;

  /// The duration for one shimmer animation cycle.
  final Duration? duration;

  /// The direction of the shimmer animation.
  final ButtonShimmerDirection? direction;

  //***********Animated Outline Properties***************//

  /// The style to apply for the animated outline button.
  final AnimatedOutlineStyles? animatedOutlineStyle;

  //*******Icon,Text,Text-Icon Button Colors Properties******//

  /// The background color of the button.
  final Color? backgroundColor;

  /// The splash color displayed on user interaction.
  final Color? splashColor;

  /// The border shape of the button.
  final ShapeBorder? border;

  // Whether this is an icon-only button.
  final bool isIconButton;
  // Whether this is a text-only button.
  final bool isTextButton;
  // Whether this is a combined icon-text button.
  final bool isIconTextButton;
  // Whether this is a shimmer button.
  final bool isShimmerButton;
  // Whether this is an outlined shimmer button.
  final bool isOutlinedShimmer;

  //**Events***//

  /// Called when the button is tapped/click.
  final VoidCallback? onClick;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// Called when the button is double-tapped.
  final VoidCallback? onDoubleTap;

  /// Called when a pointer contacts the screen.
  final void Function(TapDownDetails)? onTapDown;

  /// Called when a tap with a primary button has occurred.
  final void Function(TapUpDetails)? onTapUp;

  /// Called when a tap gesture is canceled.
  final VoidCallback? onTapCancel;

  /// Called when a pointer enters or exits the button area.
  final void Function(bool)? onHover;

  /// The mouse cursor to display when hovering over the button.
  final MouseCursor? mouseCursor;

  /// Called when the focus state of this button changes.
  final void Function(bool)? onFocusChange;

  ///### Default LoaderButton
  ///
  /// Creates a customizable button that can show a custom [child] widget normally,
  /// and a [loadingWidget] when [isLoading] is true.
  ///
  /// Commonly used for fully custom layouts.
  ///
  ///### Example:
  /// ```dart
  /// LoaderButton(
  ///   isLoading: isLoading,
  ///   child: Text('Submit'),
  ///   loadingWidget: CircularProgressIndicator(),
  ///   onClick: () {
  ///     // Handle tap
  ///   },
  /// )
  /// ```
  const LoaderButton({
    super.key,
    this.focusNode,
    this.child,
    required this.isLoading,
    this.minSize,
    this.maxSize,
    this.decoration,
    this.loadingWidget,
    this.onClick,
    this.onLongPress,
    this.onDoubleTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.onFocusChange,
  }) : icon = null,
       text = null,
       label = null,
       isIconButton = false,
       isTextButton = false,
       isIconTextButton = false,
       isOutlinedShimmer = false,
       iconPosition = null,
       isShimmerButton = false,
       shimmerChildKey = null,
       baseColor = null,
       highlightColor = null,
       duration = null,
       direction = null,
       animatedOutlineStyle = null,
       backgroundColor = null,
       splashColor = null,
       border = null,
       gradient = null,
       isGradient = false;

  ///### Icon LoaderButton
  ///
  /// Creates a button that displays an [Icon] when not loading,
  /// and shows a [loadingWidget] when [isLoading] is true.
  ///
  ///### Example:
  /// ```dart
  /// LoaderButton.icon(
  ///   icon: Icon(Icons.add),
  ///   isLoading: isLoading,
  ///   loadingWidget: CircularProgressIndicator(),
  ///   onClick: () {
  ///     // Handle tap
  ///   },
  /// )
  /// ```
  const LoaderButton.icon({
    super.key,
    this.focusNode,
    required this.icon,
    required this.isLoading,
    this.loadingWidget,
    this.splashColor,
    this.minSize,
    this.maxSize,
    this.backgroundColor,
    this.border,
    this.onClick,
    this.onLongPress,
    this.onDoubleTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.onFocusChange,
  }) : child = null,
       text = null,
       label = null,
       isIconButton = true,
       isTextButton = false,
       isIconTextButton = false,
       isOutlinedShimmer = false,
       iconPosition = null,
       isShimmerButton = false,
       shimmerChildKey = null,
       baseColor = null,
       duration = null,
       direction = null,
       animatedOutlineStyle = null,
       decoration = null,
       highlightColor = null,
       gradient = null,
       isGradient = false;

  ///### Text LoaderButton
  ///
  /// Creates a button that displays a [Text] widget normally,
  /// and shows a [loadingWidget] when [isLoading] is true.
  ///
  ///### Example:
  /// ```dart
  /// LoaderButton.text(
  ///   text: Text('Login'),
  ///   isLoading: isLoading,
  ///   loadingWidget: CircularProgressIndicator(),
  ///   onClick: () {
  ///     // Handle tap
  ///   },
  /// )
  /// ```
  const LoaderButton.text({
    super.key,
    this.focusNode,
    required this.text,
    required this.isLoading,
    this.loadingWidget,
    this.minSize,
    this.maxSize,
    this.splashColor,
    this.backgroundColor,
    this.border = const StadiumBorder(),
    this.onClick,
    this.onLongPress,
    this.onDoubleTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.onFocusChange,
  }) : child = null,
       icon = null,
       label = null,
       isIconButton = false,
       isTextButton = true,
       isIconTextButton = false,
       iconPosition = null,
       isShimmerButton = false,
       isOutlinedShimmer = false,
       shimmerChildKey = null,
       baseColor = null,
       duration = null,
       direction = null,
       animatedOutlineStyle = null,
       decoration = null,
       highlightColor = null,
       gradient = null,
       isGradient = false;

  ///### Icon + Text LoaderButton
  ///
  /// Creates a button that combines an [Icon] and a [label],
  /// positioned by [iconPosition]. Shows a [loadingWidget] when [isLoading] is true.
  ///
  ///### Example:
  /// ```dart
  /// LoaderButton.iconText(
  ///   icon: Icon(Icons.send),
  ///   label: Text('Send'),
  ///   iconPosition: IconTextPosition.iconStart,
  ///   isLoading: isLoading,
  ///   loadingWidget: CircularProgressIndicator(),
  ///   onClick: () {
  ///     // Handle tap
  ///   },
  /// )
  /// ```
  LoaderButton.iconText({
    super.key,
    this.focusNode,
    required Icon this.icon,
    required Widget this.label,
    this.splashColor,
    this.backgroundColor,
    this.minSize,
    this.maxSize,
    this.border = const StadiumBorder(),
    required this.isLoading,
    this.loadingWidget,
    this.iconPosition = IconTextPosition.iconStart,
    this.onClick,
    this.onLongPress,
    this.onDoubleTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.onFocusChange,
  }) : child =
           (iconPosition == IconTextPosition.iconStart ||
                   iconPosition == IconTextPosition.iconEnd)
               ? Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   if (iconPosition == IconTextPosition.iconStart) icon,
                   const SizedBox(width: 8),
                   label,
                   if (iconPosition == IconTextPosition.iconEnd) icon,
                 ],
               )
               : Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   if (iconPosition == IconTextPosition.iconTop) icon,
                   const SizedBox(width: 8),
                   label,
                   if (iconPosition == IconTextPosition.iconBottom) icon,
                 ],
               ),
       text = null,
       isIconButton = false,
       isTextButton = false,
       isIconTextButton = true,
       isShimmerButton = false,
       isOutlinedShimmer = false,
       shimmerChildKey = null,
       baseColor = null,
       duration = null,
       direction = null,
       animatedOutlineStyle = null,
       decoration = null,
       highlightColor = null,
       gradient = null,
       isGradient = false;

  ///### Shimmer LoaderButton
  ///
  /// Creates a button that applies a shimmer effect on the [child]
  /// while [isLoading] is false, and shows [loadingWidget] when [isLoading] is true.
  ///
  ///### Example1: (Without using Gradient)
  /// ```dart
  /// // Define a key for the widget you want to shimmer.
  /// final shimmerTextKey = ValueKey('shimmer-text');
  ///
  /// LoaderButton.shimmer(
  ///   shimmerChildKey: shimmerTextKey, // Required to add key here.
  ///   child: Text('Refresh'), // The normal content.
  ///   loadingWidget: Container(
  ///     padding: const EdgeInsets.symmetric(
  ///       vertical: 16,
  ///       horizontal: 32,
  ///     ),
  ///     decoration: BoxDecoration(
  ///       color: Colors.indigo,
  ///       borderRadius: BorderRadius.circular(12),
  ///     ),
  ///     child: Text(
  ///       'Loading',
  ///       key: shimmerTextKey, // Only this widget gets the shimmer effect.
  ///       style: const TextStyle(
  ///         fontSize: 18,
  ///         color: Colors.white,
  ///         fontWeight: FontWeight.bold,
  ///       ),
  ///     ),
  ///   ),
  ///   isLoading: isLoading, // Toggle shimmer with your state.
  ///   baseColor: Colors.grey.shade300, // Shimmer base color.
  ///   highlightColor: Colors.white,    // Shimmer highlight color.
  /// )
  /// ```
  ///
  ///### Example2: (Using Gradient)
  /// ```dart
  /// // Define a key for the widget you want to shimmer.
  /// final shimmerTextKey = ValueKey('shimmer-text');
  ///
  /// LoaderButton.shimmer(
  ///   shimmerChildKey: shimmerTextKey, // Required to add key here.
  ///   child: Text('Refresh'), // The normal content.
  ///   isGradient: true // for use gradient property isGradient Should be true
  ///   gradient:  LinearGradient(colors: [Colors.pinkAccent, Colors.white, Colors.red],), // provide the gradient for it.
  ///   loadingWidget: Container(
  ///     padding: const EdgeInsets.symmetric(
  ///       vertical: 16,
  ///       horizontal: 32,
  ///     ),
  ///     decoration: BoxDecoration(
  ///       color: Colors.indigo,
  ///       borderRadius: BorderRadius.circular(12),
  ///     ),
  ///     child: Text(
  ///       'Loading',
  ///       key: shimmerTextKey, // Only this widget gets the shimmer effect.
  ///       style: const TextStyle(
  ///         fontSize: 18,
  ///         color: Colors.white,
  ///         fontWeight: FontWeight.bold,
  ///       ),
  ///     ),
  ///   ),
  ///   isLoading: isLoading, // Toggle shimmer with your state.
  /// )
  /// ```
  ///
  /// **Tip:**
  /// Use `shimmerChildKey` to target exactly which part of your `loadingWidget`
  /// should display the shimmer effect. Other widgets remain unaffected.
  const LoaderButton.shimmer({
    super.key,
    this.focusNode,
    required this.shimmerChildKey,
    required this.child,
    required this.loadingWidget,
    required this.isLoading,
    this.minSize,
    this.maxSize,
    this.baseColor,
    this.highlightColor,
    this.duration,
    this.direction,
    this.gradient,
    this.isGradient = false,
    this.onClick,
    this.onLongPress,
    this.onDoubleTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.onFocusChange,
  }) : icon = null,
       text = null,
       label = null,
       isIconButton = false,
       isTextButton = false,
       isIconTextButton = false,
       isOutlinedShimmer = false,
       iconPosition = null,
       isShimmerButton = true,
       animatedOutlineStyle = null,
       splashColor = null,
       backgroundColor = null,
       border = null,
       decoration = null;

  ///### Animated Outline LoaderButton
  ///
  /// Creates a button with an animated outline when [isLoading] is `false`,
  /// and shows a [loadingWidget] when [isLoading] is `true`.
  ///
  ///### Example:
  /// ```dart
  /// LoaderButton.animatedOutline(
  ///   child: Text('Submit'),
  ///   isLoading: isLoading,
  ///   loadingWidget: CircularProgressIndicator(),
  ///   animatedOutlineStyle: AnimatedOutlineStyles.defaultStyle(),
  ///   onClick: () {
  ///     // Handle tap
  ///   },
  /// )
  /// ```
  const LoaderButton.animatedOutline({
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
  }) : icon = null,
       text = null,
       label = null,
       isIconButton = false,
       isTextButton = false,
       isIconTextButton = false,
       isOutlinedShimmer = true,
       iconPosition = null,
       isShimmerButton = false,
       baseColor = null,
       highlightColor = null,
       duration = null,
       direction = null,
       shimmerChildKey = null,
       splashColor = null,
       backgroundColor = null,
       border = null,
       decoration = null,
       minSize = null,
       maxSize = null,
       gradient = null,
       isGradient = false;

  @override
  State<LoaderButton> createState() => _LoaderButtonState();
}

class _LoaderButtonState extends State<LoaderButton> {
  @override
  Widget build(BuildContext context) {
    return widget.isIconButton
        ? LoaderButtonIcon(
          focusNode: widget.focusNode,
          isLoading: widget.isLoading,
          loadingWidget: widget.loadingWidget,
          icon: widget.icon,
          backgroundColor: widget.backgroundColor,
          splashColor: widget.splashColor,
          minSize: widget.minSize,
          maxSize: widget.maxSize,
          border: widget.border,
          onClick: widget.onClick,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onHover: widget.onHover,
          mouseCursor: widget.mouseCursor,
          onFocusChange: widget.onFocusChange,
        )
        : widget.isTextButton
        ? LoaderButtonText(
          focusNode: widget.focusNode,
          isLoading: widget.isLoading,
          loadingWidget: widget.loadingWidget,
          text: widget.text,
          minSize: widget.minSize,
          maxSize: widget.maxSize,
          backgroundColor: widget.backgroundColor ?? Colors.black12,
          splashColor: widget.splashColor,
          border: widget.border,
          onClick: widget.onClick,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onHover: widget.onHover,
          mouseCursor: widget.mouseCursor,
          onFocusChange: widget.onFocusChange,
        )
        : widget.isIconTextButton
        ? LoaderButtonIconText(
          focusNode: widget.focusNode,
          isLoading: widget.isLoading,
          loadingWidget: widget.loadingWidget,
          backgroundColor: widget.backgroundColor,
          splashColor: widget.splashColor,
          border: widget.border,
          minSize: widget.minSize,
          maxSize: widget.maxSize,
          onClick: widget.onClick,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onHover: widget.onHover,
          mouseCursor: widget.mouseCursor,
          onFocusChange: widget.onFocusChange,
          child: widget.child,
        )
        : widget.isShimmerButton
        ? LoaderButtonShimmer(
          focusNode: widget.focusNode,
          isLoading: widget.isLoading,
          shimmerChildKey: widget.shimmerChildKey!,
          baseColor: widget.baseColor ?? Colors.grey.shade300,
          direction: widget.direction ?? ButtonShimmerDirection.ltr,
          highlightColor: widget.highlightColor ?? Colors.grey.shade600,
          duration: widget.duration ?? Duration(milliseconds: 1500),
          loadingWidget: widget.loadingWidget!,
          minSize: widget.minSize,
          maxSize: widget.maxSize,
          gradient: widget.gradient,
          isGradient: widget.isGradient,
          onClick: widget.onClick,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onHover: widget.onHover,
          mouseCursor: widget.mouseCursor,
          onFocusChange: widget.onFocusChange,
          child: widget.child!,
        )
        : (widget.isOutlinedShimmer)
        ? LoaderButtonAnimatedOutline(
          focusNode: widget.focusNode,
          isLoading: widget.isLoading,
          loadingWidget: widget.loadingWidget,
          animatedOutlineStyle: widget.animatedOutlineStyle,
          onClick: widget.onClick,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onHover: widget.onHover,
          mouseCursor: widget.mouseCursor,
          onFocusChange: widget.onFocusChange,
          child: widget.child!,
        )
        : LoaderButtonDefault(
          focusNode: widget.focusNode,
          isLoading: widget.isLoading,
          loadingWidget: widget.loadingWidget,
          minSize: widget.minSize,
          maxSize: widget.maxSize,
          decoration: widget.decoration,
          onClick: widget.onClick,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          onTapDown: widget.onTapDown,
          onTapUp: widget.onTapUp,
          onTapCancel: widget.onTapCancel,
          onHover: widget.onHover,
          mouseCursor: widget.mouseCursor,
          onFocusChange: widget.onFocusChange,
          child: widget.child,
        );
  }
}
