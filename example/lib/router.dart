import 'package:go_router/go_router.dart';
import 'package:wireguard_dart_example/app.dart';
import 'package:wireguard_dart_example/features/authscreen/auth_view.dart';
import 'package:wireguard_dart_example/features/home/home_view.dart';
import 'package:wireguard_dart_example/features/menu/menu_view.dart';
import 'package:wireguard_dart_example/features/profile/profile_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AppView(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => HomeView(),
      routes: [
        GoRoute(
          name: 'menu',
          path: 'menu',
          builder: (context, state) => MenuView(),
          routes: [
            GoRoute(
              name: 'profile',
              path: 'profile',
              builder: (context, state) => ProfileView(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => AuthView(),
    ),
  ],
);
