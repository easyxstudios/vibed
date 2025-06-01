import 'package:vibed/core/initializer/models/run_state.dart';
import 'package:vibed/core/initializer/onstart_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef OnInitErrorBuilder =
    Widget Function(BuildContext context, String error);

class Initializer extends ConsumerStatefulWidget {
  final Widget onReady;
  final Widget onLoading;
  final OnInitErrorBuilder? onError;
  final List<ProviderListenable<OnStartService>> services;

  const Initializer({
    super.key,
    required this.onReady,
    required this.onLoading,
    this.onError,
    this.services = const [],
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitializerState();
}

class _InitializerState extends ConsumerState<Initializer> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      try {
        final onStartHandler = ref.read(onStartProvider.notifier);
        for (final service in widget.services) {
          final serviceInstance = ref.read(service);
          await serviceInstance.init();
          onStartHandler.register(serviceInstance); // useless now
        }
        onStartHandler.onEnded();
      } catch (e) {
        ref.read(onStartProvider.notifier).notifyError(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final onStartState = ref.watch(onStartProvider);

    return switch (onStartState) {
      AppLoadingState() => widget.onLoading,
      AppReadyState() => widget.onReady,
      AppErrorState(:final error) =>
        widget.onError?.call(context, error) ??
            const Center(child: Text('An error occured')),
    };
  }
}
