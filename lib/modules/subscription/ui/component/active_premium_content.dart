import 'package:vibed/core/data/models/subscription.dart';
import 'package:vibed/modules/subscription/ui/widgets/premium_background.dart';
import 'package:vibed/modules/subscription/ui/widgets/premium_card.dart';
import 'package:vibed/modules/subscription/ui/widgets/premium_feature.dart';
import 'package:vibed/modules/subscription/ui/widgets/selectable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnTapUnSubscribe = void Function();

class ActivePremiumContent extends StatelessWidget {
  final SubscriptionProduct? offer;
  final OnTapUnSubscribe? onTap;

  const ActivePremiumContent({
    super.key,
    required this.offer,
    required this.onTap,
  });

  const ActivePremiumContent.earlyBird({
    super.key,
    required this.onTap,
  }) : offer = null;

  @override
  Widget build(BuildContext context) {
    return PremiumBackground(
      bgImagePath: "assets/images/premium-bg.jpg",
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: PremiumCard(
                  bgColor: Colors.black54,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Chip(
                          backgroundColor: Theme.of(context).primaryColor,
                          label: Text(
                            "ACTIVE",
                            style: GoogleFonts.albertSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Premium",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.albertSans(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        children: AnimateList(
                          interval: 150.ms,
                          delay: 500.ms,
                          effects: [FadeEffect(duration: 300.ms)],
                          children: [
                            const PremiumFeature(
                              text:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                            ),
                            const PremiumFeature(
                              text: "Lorem ipsum dolor sit amet, consectetur",
                            ),
                            const PremiumFeature(
                              text:
                                  "Lorem ipsum dolor sit amet, feature lore at est",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      if (offer != null)
                        SelectableRow(
                          label: offer!.durationType.name.toUpperCase(),
                          price: offer!.formattedPrice(context),
                          priceDescription: switch (offer!.durationType) {
                            DurationType.month => "Lorem ipsum dolor sit amet",
                            DurationType.year => "Lorem ipsum dolor sit amet",
                            DurationType.lifetime =>
                              "Lorem ipsum dolor sit amet",
                            _ => '',
                          },
                          selected: true,
                          disabled: true,
                        ),
                      if (offer == null)
                        SelectableRow(
                          label: "Early bird".toUpperCase(),
                          price: "Free",
                          priceDescription: "Lifetime access",
                          selected: true,
                          disabled: true,
                        ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 12),
                child: TextButton(
                  onPressed: () => onTap?.call(),
                  child: const Text(
                    "Je veux me désabonner",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
