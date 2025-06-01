import 'package:vibed/core/data/api/analytics_api.dart';
import 'package:vibed/modules/onboarding/ui/animations/page_transitions.dart';

import 'package:vibed/modules/onboarding/ui/components/onboarding_features.dart';
import 'package:vibed/modules/onboarding/ui/components/onboarding_loader.dart';
import 'package:vibed/modules/onboarding/ui/components/onboarding_notifications_setup.dart';
import 'package:vibed/modules/onboarding/ui/components/onboarding_questions.dart';
import 'package:vibed/modules/subscription/ui/premium_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Navigator(
      initialRoute: 'feature_1',
      observers: [
        AnalyticsObserver(
          prefix: 'userOnboarding/',
          analyticsApi: MixpanelAnalyticsApi.instance(),
        ),
      ],
      onGenerateRoute: (settings) => switch (settings.name) {
        'feature_1' => OnboardingRouteTransition(
          builder: (context) =>
              const OnboardingFeatureOne(nextRoute: 'feature_2'),
          settings: settings,
        ),
        'feature_2' => OnboardingRouteTransition(
          builder: (context) =>
              const OnboardingFeatureTwo(nextRoute: 'feature_3'),
          settings: settings,
        ),
        'feature_3' => OnboardingRouteTransition(
          builder: (context) =>
              const OnboardingFeatureThree(nextRoute: 'sexe_question'),
          settings: settings,
        ),
        'sexe_question' => OnboardingRouteTransition(
          builder: (context) =>
              const UserSexeOnboardingQuestion(nextRoute: 'age_question'),
          settings: settings,
        ),
        'age_question' => OnboardingRouteTransition(
          builder: (context) =>
              const UserAgeOnboardingQuestion(nextRoute: 'notifications'),
          settings: settings,
        ),
        'notifications' => OnboardingRouteTransition(
          builder: (context) =>
              const NotificationsPermissionStep(nextRoute: 'loader'),
          settings: settings,
        ),

        'loader' => OnboardingRouteTransition(
          builder: (context) => OnboardingLoader(
            onCompleted: () =>
                Navigator.of(context).pushReplacementNamed('paywall'),
          ),
          settings: settings,
        ),
        'paywall' => OnboardingRouteTransition(
          builder: (context) =>
              const PremiumPage(args: PremiumPageArgs(redirect: '/')),
          settings: settings,
        ),
        String() || null => throw 'Unimplemented route: $settings.name',
      },
    );
  }
}
