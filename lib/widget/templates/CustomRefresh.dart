import 'package:flutter/material.dart';

import '../../utils/Utils.dart';

class CustomRefresh extends StatefulWidget {
  const CustomRefresh({
    super.key,
    required this.child,
    required this.onRefresh,
    this.onPagination,
    this.isLoading = false,
  });
  final Future<void> Function() onRefresh;
  final void Function()? onPagination;

  final bool isLoading;
  final Widget child;
  @override
  State<CustomRefresh> createState() => _CustomRefreshState();
}

class _CustomRefreshState extends State<CustomRefresh> {
  var isRefreshing = false;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        if (checkPagination(
          isRefreshing: isRefreshing,
          isLoading: widget.isLoading,
          scrollPosition: notification.metrics.pixels,
          maxScrollExtent: notification.metrics.maxScrollExtent,
        )) {
          if (widget.onPagination != null) widget.onPagination!();
        }
        isRefreshing = checkIsRefreshing(notification);
        return true;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          await widget.onRefresh();
        },
        child: widget.child,
      ),
    );
  }
}
