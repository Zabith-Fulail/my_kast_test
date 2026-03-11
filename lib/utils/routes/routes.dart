import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kast_test/feature/presentation/views/main_screen/main_screen.dart';
import 'package:kast_test/feature/presentation/views/message_view/message_view.dart';
import 'package:kast_test/feature/presentation/views/notification/notification_view.dart';
import 'package:kast_test/feature/presentation/views/profile/profile_view.dart';
import 'package:kast_test/utils/routes/pages.dart';

import '../../feature/presentation/views/home_view/home_view.dart';

class AppRoutes {
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  late final GoRouter router;

  AppRoutes() {
    router = GoRouter(
      initialLocation: Pages.homeView.toPath(),
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return MainScreen(child: child);
          },
          routes: [
            GoRoute(
              builder: (context, state) => HomeView(),
              parentNavigatorKey: _shellNavigatorKey,
              name: Pages.homeView.toPathName(),
              path: Pages.homeView.toPath(),
            ),GoRoute(
              builder: (context, state) => MessageView(),
              parentNavigatorKey: _shellNavigatorKey,
              name: Pages.messageView.toPathName(),
              path: Pages.messageView.toPath(),
            ),GoRoute(
              builder: (context, state) => NotificationView(),
              parentNavigatorKey: _shellNavigatorKey,
              name: Pages.notificationView.toPathName(),
              path: Pages.notificationView.toPath(),
            ),GoRoute(
              builder: (context, state) => ProfileView(),
              parentNavigatorKey: _shellNavigatorKey,
              name: Pages.profileView.toPathName(),
              path: Pages.profileView.toPath(),
            ),
          ],
        ),
      ],
    );
  }
}
