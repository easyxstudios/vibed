import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class PremiumBackgroundGradient extends StatelessWidget {
  final Widget child;

  const PremiumBackgroundGradient({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          child: ColoredBox(
            color: context.colors.primary,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.colors.primary.withValues(alpha: 0),
                  context.colors.primary.withValues(alpha: 0),
                  context.colors.primary.withValues(alpha: 1),
                  Colors.black.withValues(alpha: 1),
                ],
                stops: const [0, 0.2, 0.4, 1],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: child,
              );
            },
          ),
        )
      ],
    );
  }
}
