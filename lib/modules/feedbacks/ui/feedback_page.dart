import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:vibed/core/widgets/responsive_layout.dart';
import 'package:vibed/i18n/translations.g.dart';
import 'package:vibed/modules/feedbacks/providers/feedback_page_notifier.dart';
import 'package:vibed/modules/feedbacks/ui/widgets/add_feature_button.dart';
import 'package:vibed/modules/feedbacks/ui/widgets/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedbackPage extends ConsumerWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(feedbackPageNotifierProvider);
    final translations = Translations.of(context).feature_requests;

    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: LargeLayoutContainer(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.transparent,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
                  child: Text(
                    translations.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                  child: Text(
                    translations.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: context.colors.onBackground.withValues(alpha:0.6),
                        ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                  child: AddFeatureButton(
                    title: translations.add_feature.title,
                    description: translations.add_feature.description,
                    onPressed: () => context.push('/feedback/new'),
                  ),
                ),
              ),
              state.map(
                data: (data) {
                  if (data.value.featureRequests.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                        child: Text(
                          "No feature requests yet",
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: context.colors.onBackground
                                .withValues(alpha: 0.6),
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverList.separated(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: FeatureCard(
                        title: data.value.featureRequests[index].title,
                        description:
                            data.value.featureRequests[index].description,
                        votes: data.value.featureRequests[index].votes,
                        onVote: () {
                          ref
                              .read(feedbackPageNotifierProvider.notifier)
                              .vote(data.value.featureRequests[index]);
                        },
                        voted: data.value.hasVoted(
                          data.value.featureRequests[index],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                    itemCount: data.value.featureRequests.length,
                  );
                },
                error: (error) => SliverFillRemaining(
                  child: Center(
                    child: Text(error.error.toString()),
                  ),
                ),
                loading: (data) {
                  if (!data.hasValue) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return SliverList.separated(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: FeatureCard(
                        title: data.value!.featureRequests[index].title,
                        description:
                            data.value!.featureRequests[index].description,
                        votes: data.value!.featureRequests[index].votes,
                        onVote: () {},
                        disabled: true,
                        voted: data.value!.hasVoted(
                          data.value!.featureRequests[index],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                    itemCount: data.value!.featureRequests.length,
                  );
                },
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 100),
              )
            ],
          ),
        ),
      ),
    );
  }
}
