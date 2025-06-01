import 'dart:math';

import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:vibed/core/widgets/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeatureCard extends StatefulWidget {
  final String title;
  final String description;
  final int votes;
  final VoidCallback onVote;
  final bool disabled;
  final bool voted;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.votes,
    required this.onVote,
    this.disabled = false,
    required this.voted,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.colors.onBackground.withValues(alpha: .05),
        ),
        boxShadow: [
          BoxShadow(
            color: context.colors.primary.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.description,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: context.colors.grey2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          switch (widget.voted) {
            false => VoteCard.blank(
                context: context,
                id: widget.title,
                votes: widget.votes,
                onVote: widget.onVote,
                disabled: widget.disabled,
              ),
            true => VoteCard.voted(
                context: context,
                id: widget.title,
                votes: widget.votes,
                onVote: widget.onVote,
                disabled: widget.disabled,
              ),
          }
        ],
      ),
    );
  }
}

class VoteCard extends StatefulWidget {
  final int votes;
  final VoidCallback onVote;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;
  final bool isBold;
  final bool disabled;
  final String id;

  const VoteCard({
    super.key,
    required this.votes,
    required this.onVote,
    required this.bgColor,
    required this.textColor,
    required this.isBold,
    required this.borderColor,
    required this.disabled,
    required this.id,
  });

  factory VoteCard.blank({
    required BuildContext context,
    required VoidCallback onVote,
    required int votes,
    required bool disabled,
    required String id,
  }) =>
      VoteCard(
        id: id,
        onVote: onVote,
        votes: votes,
        bgColor: context.colors.primary,
        textColor: Colors.white,
        borderColor: context.colors.primary,
        isBold: false,
        disabled: disabled,
      );

  factory VoteCard.voted({
    required BuildContext context,
    required VoidCallback onVote,
    required int votes,
    required bool disabled,
    required String id,
  }) =>
      VoteCard(
        id: id,
        onVote: onVote,
        votes: votes,
        bgColor: context.colors.primary.withValues(alpha: .1),
        textColor: context.colors.onBackground,
        borderColor: context.colors.onBackground.withValues(alpha: .1),
        isBold: true,
        disabled: disabled,
      );

  @override
  State<VoteCard> createState() => _VoteCardState();
}

class _VoteCardState extends State<VoteCard>
    with SingleTickerProviderStateMixin {
  // ignore: use_late_for_private_fields_and_variables
  AnimationController? _controller;
  // ignore: use_late_for_private_fields_and_variables
  Animation<double>? _animation;

  final debouncer = Debouncer(delay: const Duration(milliseconds: 250));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation!.value,
          child: child,
        );
      },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (widget.disabled) {
              return;
            }
            HapticFeedback.selectionClick();
            SystemSound.play(SystemSoundType.click);
            widget.onVote();
            _controller!.forward().then((_) {
              _controller!.reverse();
            });
          },
          child: Ink(
            width: 48,
            height: 64,
            decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.borderColor,
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: pi / 2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: widget.textColor,
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Text(
                    key: ValueKey("votes-${widget.id}-${widget.votes}"),
                    widget.votes.toString(),
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight:
                          widget.isBold ? FontWeight.bold : FontWeight.w400,
                      color: widget.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
