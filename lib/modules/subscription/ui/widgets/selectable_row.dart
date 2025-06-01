import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnSelectItem<T> = void Function(T data);

class SelectableRowGroup<T> extends StatefulWidget {
  final List<SelectableOption<T>> items;
  final OnSelectItem<T> onSelectItem;

  const SelectableRowGroup({
    super.key,
    required this.items,
    required this.onSelectItem,
  });

  @override
  State<SelectableRowGroup> createState() => _SelectableRowGroupState<T>();
}

class _SelectableRowGroupState<T> extends State<SelectableRowGroup<T>> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  OnSelectItem<T> get onSelectItem => widget.onSelectItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < widget.items.length; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                if (selectedIndex == i) {
                  return;
                }
                HapticFeedback.heavyImpact();
                selectedIndex = i;
                onSelectItem(widget.items[i].data);
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: i == widget.items.length - 1 ? 0 : 12.0),
              child: Animate(
                effects: [
                  FadeEffect(
                    delay: Duration(milliseconds: 100 + 100 * i),
                    duration: const Duration(milliseconds: 500),
                  ),
                ],
                child: SelectableRow.fromOption(
                  key: ValueKey('item_$i'),
                  widget.items[i],
                  selected: selectedIndex == i,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class SelectableOption<T> {
  final String label;
  final String price;
  final String priceDescription;
  final T data;

  const SelectableOption({
    required this.label,
    required this.price,
    required this.priceDescription,
    required this.data,
  });
}

class SelectableRow extends StatefulWidget {
  final bool selected;
  final String label;
  final String price;
  final String priceDescription;
  final bool disabled;

  const SelectableRow({
    super.key,
    required this.selected,
    required this.label,
    required this.price,
    required this.priceDescription,
    this.disabled = false,
  });

  factory SelectableRow.fromOption(
    SelectableOption option, {
    Key? key,
    required bool selected,
  }) {
    return SelectableRow(
      key: key,
      selected: selected,
      label: option.label,
      price: option.price,
      priceDescription: option.priceDescription,
    );
  }

  @override
  State<SelectableRow> createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _iconSizeAnimation;

  @override
  void didUpdateWidget(covariant SelectableRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected && widget.selected) {
      _controller.forward();
    } else if (oldWidget.selected != widget.selected && !widget.selected) {
      _controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    _iconSizeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    if (widget.selected) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: widget.disabled ? .6 : 1,
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: widget.selected
                ? Theme.of(context).colorScheme.onSurface.withValues(alpha: .05)
                : Theme.of(context).colorScheme.onSurface.withValues(alpha: .15),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.selected
                  ? Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: _opacityAnimation.value)
                  : Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: .15 * _opacityAnimation.value),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 4),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  widget.label,
                  style: GoogleFonts.albertSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 44,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Expanded(
                        child: Text(
                          widget.price,
                          style: GoogleFonts.albertSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.priceDescription,
                          style: GoogleFonts.albertSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: .8),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              if (widget.selected)
                RoundRadioBox.selected(
                  context,
                  iconOpacity: _opacityAnimation.value,
                  iconSize: _iconSizeAnimation.value,
                )
              else
                RoundRadioBox.unselected(context)
            ],
          ),
        ),
      ),
    );
  }
}

class RoundRadioBox extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final IconData? icon;
  final double iconOpacity;
  final double iconSize;

  const RoundRadioBox({
    super.key,
    required this.bgColor,
    required this.borderColor,
    this.iconOpacity = 1,
    this.iconSize = 1,
    this.icon,
  });

  factory RoundRadioBox.selected(
    BuildContext context, {
    double iconOpacity = 1,
    double iconSize = 1,
  }) {
    return RoundRadioBox(
      bgColor: Theme.of(context).colorScheme.primary,
      borderColor: Colors.black.withValues(alpha: .3),
      icon: Icons.check,
      iconOpacity: iconOpacity,
      iconSize: iconSize,
    );
  }

  // ignore: avoid_unused_constructor_parameters
  factory RoundRadioBox.unselected(BuildContext context) {
    return RoundRadioBox(
      bgColor: const Color(0xFFD9D9D9).withValues(alpha: .6),
      borderColor: Colors.black.withValues(alpha: .3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: Center(
        child: icon != null
            ? Opacity(
                opacity: iconOpacity,
                child: Transform.scale(
                  scale: iconSize,
                  child: Icon(icon, color: Colors.white, size: 21),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
