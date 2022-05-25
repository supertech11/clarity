import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';

class DualCustomRow extends StatelessWidget {
  final Widget widget1, widget2;
  const DualCustomRow({Key? key, required this.widget1, required this.widget2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Column(
            children: [
              widget1,
              widget2,
            ],
          )
        : Row(
            children: [
              Expanded(child: widget1),
              SizedBox(
                width: 10,
              ),
              Expanded(child: widget2),
            ],
          );
  }
}
