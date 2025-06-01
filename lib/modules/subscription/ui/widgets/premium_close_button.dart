import 'package:flutter/material.dart';

class AppCloseButton extends StatelessWidget {
  final VoidCallback? onTap;

  const AppCloseButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTapUp: (_) {
          onTap?.call();
        },
        child: Ink(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.2),
          ),
          child: const Center(
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
