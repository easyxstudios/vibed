import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:vibed/i18n/translations.g.dart';
import 'package:flutter/material.dart';

typedef OnUpdateTrial = void Function(bool value);

class TrialSwitcher extends StatefulWidget {
  final bool? initialValue;
  final OnUpdateTrial? onUpdate;
  final int trialDays;

  const TrialSwitcher({
    super.key,
    this.initialValue = false,
    this.onUpdate,
    required this.trialDays,
  });

  @override
  State<TrialSwitcher> createState() => _TrialSwitcherState();
}

class _TrialSwitcherState extends State<TrialSwitcher> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue ?? false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.background.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colors.background.withValues(alpha: .2),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: SwitchListTile(
        value: _value,
        contentPadding: EdgeInsets.zero,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
          widget.onUpdate?.call(value);
        },
        title: switch (_value) {
          false => Text(
              Translations.of(context)
                  .paywallWithSwitch
                  .noTrial
                  .trial_switch_title,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.background,
              ),
            ),
          true => Text(
              Translations.of(context)
                  .paywallWithSwitch
                  .withTrial
                  .trial_switch_title(
                    days: widget.trialDays,
                  ),
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.background,
                fontWeight: FontWeight.w700,
              ),
            ),
        },
        subtitle: switch (_value) {
          false => Text(
              Translations.of(context)
                  .paywallWithSwitch
                  .noTrial
                  .trial_switch_subtitle,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.background,
                fontWeight: FontWeight.w700,
              ),
            ),
          true => null,
        },
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: context.colors.background.withValues(alpha: .2),
        activeColor: context.colors.background,
        activeTrackColor: context.colors.primary,
      ),
    );
  }
}
