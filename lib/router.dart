import 'package:vibed/core/bottom_menu/bottom_menu.dart';
import 'package:vibed/core/data/api/analytics_api.dart';
import 'package:vibed/core/guards/authenticated_guard.dart';
import 'package:vibed/core/guards/user_info_guard.dart';
import 'package:vibed/core/widgets/page_not_found.dart';
import 'package:vibed/modules/authentication/ui/phone_auth_page.dart';
import 'package:vibed/modules/authentication/ui/recover_password_page.dart';
import 'package:vibed/modules/authentication/ui/signin_page.dart';
import 'package:vibed/modules/authentication/ui/signup_page.dart';
import 'package:vibed/modules/feedbacks/ui/component/add_feature_form.dart';
import 'package:vibed/modules/feedbacks/ui/feedback_page.dart';
import 'package:vibed/modules/onboarding/ui/onboarding_page.dart';
import 'package:vibed/modules/subscription/ui/premium_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) => generateRouter(),
);

extension GoRouterRiverpod on Ref {
  GoRouter get goRouter => read(goRouterProvider);
}

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter generateRouter({
  String? initialLocation,
  List<GoRoute>? additionalRoutes,
  List<NavigatorObserver>? observers,
}) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    errorBuilder: (context, state) => const PageNotFound(),
    observers: [
      AnalyticsObserver(
        analyticsApi: MixpanelAnalyticsApi.instance(),
      ),
      
      ...?observers,
    ],
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const UserInfosGuard(
          fallbackRoute: '/onboarding',
          child: BottomMenu(),
        ),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        name: 'signin',
        path: '/signin',
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        name: 'signinWithPhone',
        path: '/signinWithPhone',
        builder: (context, state) => const PhoneAuthPage(),
      ),
      GoRoute(
        name: 'premium',
        path: '/premium',
        builder: (context, state) => const PremiumPage(),
      ),
      GoRoute(
        name: 'feedback',
        path: '/feedback',
        builder: (context, state) => const FeedbackPage(),
      ),
      GoRoute(
        name: 'feedback_new',
        path: '/feedback/new',
        builder: (context, state) => const AddFeatureComponent(),
      ),
      GoRoute(
        name: 'recover_password',
        path: '/recover_password',
        builder: (context, state) => const RecoverPasswordPage(),
      ),
      GoRoute(
        name: '404',
        path: '/404',
        builder: (context, state) => const PageNotFound(),
      ),
    ],
  );
}

