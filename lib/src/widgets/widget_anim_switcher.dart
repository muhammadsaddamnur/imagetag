import 'dart:async';
import 'package:flutter/material.dart';

class WidgetAnimSwitcher extends StatefulWidget {
  final Widget firstWidget, secondWidget;
  final bool isShow;

  const WidgetAnimSwitcher({
    Key? key,
    required this.firstWidget,
    required this.secondWidget,
    required this.isShow,
  }) : super(key: key);

  @override
  _WidgetAnimSwitcherState createState() => _WidgetAnimSwitcherState();
}

class _WidgetAnimSwitcherState extends State<WidgetAnimSwitcher>
    with SingleTickerProviderStateMixin {
  Widget firstWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      key: const ValueKey(true),
      child: widget.firstWidget,
    );
  }

  Widget secondWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      key: const ValueKey(false),
      child: widget.secondWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: widget.isShow ? firstWidget() : secondWidget());
  }
}
