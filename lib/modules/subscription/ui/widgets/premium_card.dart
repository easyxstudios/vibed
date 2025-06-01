import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  final Color bgColor;
  final Widget child;

  const PremiumCard({
    super.key,
    required this.bgColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.fromLTRB(20, 21, 20, 12),
      child: child,
    );
  }
}
