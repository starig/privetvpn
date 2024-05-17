import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireguard_dart_example/features/authscreen/auth_view.dart';
import 'package:wireguard_dart_example/features/authscreen/state/auth_cubit.dart';
import 'package:wireguard_dart_example/features/home/home_view.dart';
import 'package:wireguard_dart_example/features/subscribe/subscribe_view.dart';
import 'package:wireguard_dart_example/features/wrapper/wrapper_view.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final Future _future;
  var isAuthorized = false;

  @override
  void initState() {
    _future = context.read<AuthCubit>().checkIsAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return FutureBuilder(
            future: _future,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const WrapperView(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state.isAuthorized) {
                if (state.isSubscribed) {
                  return HomeView();
                } else {
                  return SubscribeView();
                }
              }
              return AuthView();
            },
          );
        },
      ),
    );
  }
}
