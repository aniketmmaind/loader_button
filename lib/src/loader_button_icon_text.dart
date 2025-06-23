import 'package:flutter/material.dart';

class LoaderButtonIconText extends StatelessWidget {
  final Widget? child;
  final bool isLoading;
  final Widget? loadingWidget;
  final Color? backgroundColor;
  final Color? splashColor;
  final ShapeBorder? border;
  final Size? minSize;
  final Size? maxSize;
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

  const LoaderButtonIconText({
    super.key,
    this.focusNode,
    required this.child,
    required this.isLoading,
    this.loadingWidget,
    this.backgroundColor = Colors.transparent,
    this.splashColor = Colors.black12,
    this.border,
    this.minSize,
    this.maxSize,
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
      color: backgroundColor,
      shape: border,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        focusNode: focusNode,
        splashColor: splashColor,
        highlightColor: Colors.transparent,
        customBorder: border,
        onTap: isLoading ? null : onClick,
        onDoubleTap: isLoading ? null : onDoubleTap,
        onLongPress: isLoading ? null : onLongPress,
        onTapDown: isLoading ? null : onTapDown,
        onTapUp: isLoading ? null : onTapUp,
        onTapCancel: isLoading ? null : onTapCancel,
        onHover: onHover,
        mouseCursor: mouseCursor,
        onFocusChange: onFocusChange,
        child: Container(
          constraints: BoxConstraints(
            minWidth: minSize == null ? 50 : minSize!.width,
            minHeight: minSize == null ? 50 : minSize!.height,
            maxHeight: maxSize == null ? double.infinity : maxSize!.height,
            maxWidth: maxSize == null ? double.infinity : maxSize!.width,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AbsorbPointer(
              absorbing: isLoading,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child:
                    isLoading
                        ? loadingWidget ?? CircularProgressIndicator()
                        : child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
