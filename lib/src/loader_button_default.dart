import 'package:flutter/material.dart';

class LoaderButtonDefault extends StatelessWidget {
  final Widget? child;
  final bool isLoading;
  final Widget? loadingWidget;
  final Size? minSize;
  final Size? maxSize;
  final Decoration? decoration;
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

  const LoaderButtonDefault({
    super.key,
    this.child,
    required this.isLoading,
    this.loadingWidget,
    this.minSize,
    this.maxSize,
    this.decoration,
    this.focusNode,
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
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Container(
            constraints: BoxConstraints(
              minWidth: minSize == null ? 100 : minSize!.width,
              minHeight: minSize == null ? 60 : minSize!.height,
              maxHeight: maxSize == null ? double.infinity : maxSize!.height,
              maxWidth: maxSize == null ? double.infinity : maxSize!.width,
            ),
            decoration:
                decoration ??
                BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
            child: AbsorbPointer(
              absorbing: isLoading,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child:
                    isLoading
                        ? loadingWidget ??
                            CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            )
                        : child ??
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),

                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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
