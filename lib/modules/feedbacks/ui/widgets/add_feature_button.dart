import 'package:vibed/core/theme/extensions/theme_extension.dart';

import 'package:flutter/material.dart';

class AddFeatureButton extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const AddFeatureButton({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  State<AddFeatureButton> createState() => _AddFeatureButtonState();
}

class _AddFeatureButtonState extends State<AddFeatureButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colors.onBackground.withValues(alpha: .05),
          ),
          boxShadow: [
            BoxShadow(
              color: context.colors.primary.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.add,
              size: 32,
              color: context.colors.background,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    widget.title,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colors.background,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.colors.background.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
