import 'package:flutter/material.dart';

class LoaderButtonIcon extends StatelessWidget {
  final Icon? icon;
  final bool isLoading;
  final Widget? loadingWidget;
  final Color? backgroundColor;
  final Color? splashColor;
  final Size? minSize;
  final Size? maxSize;
  final ShapeBorder? border;
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

  const LoaderButtonIcon({
    super.key,
    this.focusNode,
    required this.icon,
    required this.isLoading,
    this.loadingWidget,
    this.backgroundColor,
    this.splashColor = Colors.black38,
    this.minSize,
    this.maxSize,
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
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.black12,
      shape: border ?? CircleBorder(),
      child: InkWell(
        focusNode: focusNode,
        splashColor: splashColor,
        highlightColor: Colors.transparent,
        customBorder: border ?? CircleBorder(),
        onTap: isLoading ? null : onClick,
        onDoubleTap: isLoading ? null : onDoubleTap,
        onLongPress: isLoading ? null : onLongPress,
        onTapDown: isLoading ? null : onTapDown,
        onTapUp: isLoading ? null : onTapUp,
        onTapCancel: isLoading ? null : onTapCancel,
        onHover: onHover,
        mouseCursor: mouseCursor,
        onFocusChange: onFocusChange,
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: minSize == null ? 50 : minSize!.width,
                minHeight: minSize == null ? 50 : minSize!.height,
                maxHeight: maxSize == null ? double.infinity : maxSize!.height,
                maxWidth: maxSize == null ? double.infinity : maxSize!.width,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Center(
                  child:
                      isLoading
                          ? loadingWidget ?? CircularProgressIndicator()
                          : icon,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
