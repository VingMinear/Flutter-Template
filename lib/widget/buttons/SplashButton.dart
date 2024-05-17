import 'package:flutter/material.dart';

import '../../styles/Colors.dart';

class SplashButton extends StatefulWidget {
  const SplashButton({
    super.key,
    this.onTap,
    required this.child,
    this.boxShadow,
    this.color,
    this.borderRaduis,
    this.vertical,
    this.horizontal,
    this.border,
    this.gradient,
    this.animate = true,
    this.highlightColor,
    this.splashColor,
  });
  final void Function()? onTap;
  final List<BoxShadow>? boxShadow;
  final Color? color, highlightColor, splashColor;
  final Widget child;
  final double? borderRaduis, vertical, horizontal;
  final BoxBorder? border;
  final Gradient? gradient;
  final bool animate;
  @override
  State<SplashButton> createState() => _SplashButtonState();
}

class _SplashButtonState extends State<SplashButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 200);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: widget.color ?? AppColor.whiteColor,
        border: widget.border,
        gradient: widget.gradient,
        borderRadius: BorderRadius.circular(widget.borderRaduis ?? 16),
        boxShadow: widget.boxShadow ??
            [
              BoxShadow(
                color: AppColor.shadowColor,
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
      ),
      child: InkWell(
        onTap: () {
          if (widget.animate) {
            _controller.forward().then((_) {
              _controller.reverse();
            });
          }

          if (widget.onTap != null) widget.onTap!();
        },
        onLongPress: () {},
        onTapDown: (details) {
          if (widget.animate) {
            _controller.forward().then((_) {
              _controller.reverse();
            });
          }
        },
        splashFactory: InkSparkle.splashFactory,
        borderRadius: BorderRadius.circular(widget.borderRaduis ?? 16),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: widget.vertical ?? 0,
            horizontal: widget.horizontal ?? 0,
          ),
          child: ScaleTransition(
            scale: _tween.animate(
              CurvedAnimation(
                parent: _controller,
                curve: Curves.easeOut,
                reverseCurve: Curves.easeIn,
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
