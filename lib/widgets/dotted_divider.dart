import 'package:flutter/material.dart';
import 'package:modern_utils/modern_utils.dart';

class DottedDivider extends StatelessWidget {
  const DottedDivider({
    super.key,
    this.dashHeight = 1,
    this.height = 1,
    this.color,
  });
  final double dashHeight;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 6.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: color ?? ModernUtils.instance.primaryColor,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
