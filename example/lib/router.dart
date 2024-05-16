import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wireguard_dart_example/app.dart';
import 'package:wireguard_dart_example/data/repositories/storage/storage_repository.dart';
import 'package:wireguard_dart_example/features/authscreen/auth_view.dart';
import 'package:wireguard_dart_example/features/home/home_view.dart';

final router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) async {
    final String? token = await StorageRepository().getToken();
    inspect(token);
    if (token != null) {
      // if (true) {
      return '/home';
    } else {
      return '/auth';
    }
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyApp(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => AuthView(),
    ),
  ],
);
