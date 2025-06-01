
import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:vibed/core/widgets/keyboard_visibility.dart';
import 'package:vibed/core/widgets/toast.dart';
import 'package:vibed/i18n/translations.g.dart';
import 'package:vibed/modules/feedbacks/providers/feedback_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<void> showAddFeatureBottomSheet(BuildContext context) {
  return showModalBottomSheet<bool?>(
    context: context,
    isScrollControlled: true,
    builder: (context) => const FractionallySizedBox(
      heightFactor: .8,
      child: AddFeatureComponent(),
    ),
  ).then((res) {
    if (!context.mounted) {
      return;
    }
    final translations = Translations.of(context).feature_requests.add_feature;
    switch (res) {
      case true:
        showSuccessToast(
          context: context,
          title: translations.toast_success.title,
          text: translations.toast_success.description,
        );
      default:
        return;
    }
  });
}

class AddFeatureComponent extends ConsumerStatefulWidget {
  const AddFeatureComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddFeatureComponentState();
}

class _AddFeatureComponentState extends ConsumerState<AddFeatureComponent> {
  String? title;
  String? description;
  bool locked = false;

  final titleFocusNode = FocusNode();
  final textFocusNode = FocusNode();

  bool keyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context).feature_requests.add_feature;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.background,
      ),
      backgroundColor: context.colors.background,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 32),
                        Text(
                          translations.title,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: context.colors.onBackground,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          translations.description,
                          style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.colors.onBackground.withValues(alpha: 0.6),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Flexible(
                          flex: 0,
                          child: Text(
                            translations.title_label,
                            style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          flex: 0,
                          child: TextFormField(
                            decoration: InputDecoration(
                              // enabled: widget.locked == false,
                              hintText: translations.title_hint,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onChanged: (value) {
                              title = value;
                            },
                            focusNode: titleFocusNode,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {
                              titleFocusNode.unfocus();
                              textFocusNode.requestFocus();
                            },
                            maxLength: 40,
                          ),
                        ),
                        Text(
                          translations.description_label,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            // enabled: widget.locked == false,
                            hintText: translations.description_hint,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          maxLines: 6,
                          onChanged: (value) {
                            description = value;
                          },
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            textFocusNode.unfocus();
                          },
                          maxLength: 1000,
                          focusNode: textFocusNode,
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: KeyboardVisibility(
                      onKeyboardStateChanged: (state) {
                        setState(() => keyboardVisible = state == KeyboardVisibilityState.visible);
                      },
                      child: !keyboardVisible
                          ? ElevatedButton(
                              onPressed: () {
                                if (locked) {
                                  return;
                                }
                                FocusScope.of(context).unfocus();
                                locked = true;
                                ref
                                    .read(feedbackPageNotifierProvider.notifier)
                                    .createFeatureSuggestion(
                                      title: title,
                                      description: description,
                                    )
                                    .then(
                                  (value) {
                                    locked = false;
                                    if (context.mounted) {
                                      Future.delayed(
                                        Duration.zero,
                                        () => context.pop(true),
                                      );
                                    }
                                  },
                                  onError: (err) {
                                    locked = false;
                                    ref.read(toastProvider).error(
                                          title: "Error",
                                          text:
                                              "Error while creating feature suggestion",
                                        );
                                  },
                                );
                              },
                              child: Text(translations.save_button),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
