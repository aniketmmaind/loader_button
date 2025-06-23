import 'package:flutter/material.dart';
import 'package:loader_button/loader_button.dart';
import 'package:loader_button/widgets/button_shimmer.dart';

class LoaderButtonShimmer extends StatelessWidget {
  final Widget child;
  final Widget loadingWidget;
  final bool isLoading;
  final Key shimmerChildKey;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration duration;
  final ButtonShimmerDirection direction;
  final Size? minSize;
  final Size? maxSize;
  final Gradient? gradient;
  final bool? isGradient;
  final FocusNode? focusNode;

  //Events
  final VoidCallback? onClick;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final VoidCallback? onTapCancel;
  final void Function(bool)? onHover;
  final MouseCursor? mouseCursor;
  final void Function(bool)? onFocusChange;

  const LoaderButtonShimmer({
    super.key,
    this.focusNode,
    required this.child,
    required this.loadingWidget,
    required this.isLoading,
    required this.shimmerChildKey,
    this.baseColor,
    required this.direction,
    this.highlightColor,
    required this.duration,
    this.minSize,
    this.maxSize,
    this.gradient,
    this.isGradient,
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
  Widget build(BuildContext context) {
    final Widget wrappedChild = Container(
      constraints: BoxConstraints(
        minWidth: minSize == null ? 100 : minSize!.width,
        minHeight: minSize == null ? 50 : minSize!.height,
        maxHeight: maxSize == null ? double.infinity : maxSize!.height,
        maxWidth: maxSize == null ? double.infinity : maxSize!.width,
      ),
      child: isLoading ? _wrapWithShimmer(loadingWidget) : child,
    );

    return InkWell(
      focusNode: focusNode,
      onTap: isLoading ? null : onClick,
      onDoubleTap: isLoading ? null : onDoubleTap,
      onLongPress: isLoading ? null : onLongPress,
      onTapDown: isLoading ? null : onTapDown,
      onTapUp: isLoading ? null : onTapUp,
      onTapCancel: isLoading ? null : onTapCancel,
      onHover: onHover,
      mouseCursor: mouseCursor,
      onFocusChange: onFocusChange,
      child: AbsorbPointer(
        absorbing: isLoading,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: wrappedChild,
        ),
      ),
    );
  }

  Widget _wrapWithShimmer(Widget childWidget) {
    if (childWidget.key == shimmerChildKey) {
      return (isGradient!)
          ? ButtonShimmer(
            useGradient: true,
            gradient:
                gradient ??
                LinearGradient(
                  colors: [
                    Colors.grey.shade300,
                    Colors.grey.shade600,
                    Colors.black87,
                  ],
                ),
            duration: duration,
            direction: direction,
            child: childWidget,
          )
          : ButtonShimmer(
            useGradient: false,
            baseColor: baseColor!,
            highlightColor: highlightColor!,
            duration: duration,
            direction: direction,
            child: childWidget,
          );
    }

    if (childWidget is Padding && childWidget.child != null) {
      return Padding(
        key: childWidget.key,
        padding: childWidget.padding,
        child: _wrapWithShimmer(childWidget.child!),
      );
    }

    if (childWidget is Center && childWidget.child != null) {
      return Center(
        key: childWidget.key,
        child: _wrapWithShimmer(childWidget.child!),
      );
    }

    if (childWidget is Align && childWidget.child != null) {
      return Align(
        key: childWidget.key,
        alignment: childWidget.alignment,
        child: _wrapWithShimmer(childWidget.child!),
      );
    }

    if (childWidget is Container && childWidget.child != null) {
      return Container(
        key: childWidget.key,
        alignment: childWidget.alignment,
        padding: childWidget.padding,
        color: childWidget.color,
        decoration: childWidget.decoration,
        foregroundDecoration: childWidget.foregroundDecoration,
        constraints: childWidget.constraints,
        margin: childWidget.margin,
        transform: childWidget.transform,
        transformAlignment: childWidget.transformAlignment,
        clipBehavior: childWidget.clipBehavior,
        child: _wrapWithShimmer(childWidget.child!),
      );
    }

    if (childWidget is SizedBox && childWidget.child != null) {
      return SizedBox(
        key: childWidget.key,
        width: childWidget.width,
        height: childWidget.height,
        child: _wrapWithShimmer(childWidget.child!),
      );
    }

    if (childWidget is Column) {
      return Column(
        key: childWidget.key,
        mainAxisSize: childWidget.mainAxisSize,
        mainAxisAlignment: childWidget.mainAxisAlignment,
        crossAxisAlignment: childWidget.crossAxisAlignment,
        children: childWidget.children.map(_wrapWithShimmer).toList(),
      );
    }

    if (childWidget is Row) {
      return Row(
        key: childWidget.key,
        mainAxisSize: childWidget.mainAxisSize,
        mainAxisAlignment: childWidget.mainAxisAlignment,
        crossAxisAlignment: childWidget.crossAxisAlignment,
        children: childWidget.children.map(_wrapWithShimmer).toList(),
      );
    }

    return childWidget;
  }
}
