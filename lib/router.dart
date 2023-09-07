import 'package:daejeon/first/first_page.dart';
import 'package:daejeon/main/main_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MainPage()),
    ),
    GoRoute(
      path: '/first',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: FirstPage()),
    ),
  ],
);
