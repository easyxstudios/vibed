import 'package:flutter/material.dart';

class PremiumBackground extends StatelessWidget {
  final Widget child;
  final String? bgImagePath;

  const PremiumBackground({
    super.key,
    required this.child,
    this.bgImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        if (bgImagePath != null)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: .60,
              child: Image.asset(
                bgImagePath!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        Positioned.fill(
          child: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFFFFFF).withOpacity(0),
                const Color(0xFF9997A1).withOpacity(.4),
                const Color(0xFF130F26),
              ],
              stops: const [0, 0.4, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          )),
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
