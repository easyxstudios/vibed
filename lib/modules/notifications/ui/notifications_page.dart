import 'package:vibed/core/widgets/page_background.dart';
import 'package:vibed/modules/notifications/providers/notifications_provider.dart';
import 'package:vibed/modules/notifications/ui/components/notification_tile.dart';
import 'package:vibed/modules/notifications/ui/widgets/empty_notifications.dart';
import 'package:vibed/modules/notifications/ui/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollChange);
    requestReadAll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScrollChange);
    super.dispose();
  }

  void _onScrollChange() {
    final direction = _scrollController.position.userScrollDirection;
    final isScrollingDown = direction == ScrollDirection.reverse;
    final isTriggered = _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100;

    if (isScrollingDown && isTriggered) {
      ref.read(notificationsPageStateProvider.notifier).fetchNextPage();
    }
  }

  void requestReadAll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!ref.context.mounted) {
        return;
      }
      ref.read(notificationsPageStateProvider.notifier).readAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationsState = ref.watch(notificationsPageStateProvider);
    return Background(
      bgColor: Colors.white,
      child: SafeArea(
        child: RefreshIndicator.adaptive(
          displacement: 100,
          onRefresh: () async {
            ref.read(notificationsPageStateProvider.notifier).refresh();
            requestReadAll();
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                backgroundColor: Colors.transparent,
                title: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: notificationsState.when(
                  loading: () => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => const NotificationSkeletonTile(),
                      childCount: 5,
                    ),
                  ),
                  data: (notification) => notification.data.isNotEmpty
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => NotificationTileComponent(
                              notification: notification.data[index],
                              index: index,
                              onTap: (notification) => ref
                                  .read(notificationsPageStateProvider.notifier)
                                  .onTapNotification(notification),
                            ),
                            childCount: notification.data.length,
                          ),
                        )
                      : SliverToBoxAdapter(
                          child: EmptyNotifications(),
                        ),
                  error: (err, stacktrace) => SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'Error fetching notifications',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
