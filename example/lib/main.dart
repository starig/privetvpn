import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireguard_dart_example/app.dart';
import 'package:wireguard_dart_example/config/theme.dart';
import 'package:wireguard_dart_example/screens/home/state/home_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => HomeCubit())),
        // BlocProvider(create: ((context) => AuthCubit())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: '/',
        themeAnimationCurve: Curves.easeInOut,
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const MyApp(),
          // '/register': (BuildContext context) => const RegisterView(),
          // '/login': (BuildContext context) => const LoginView(),
          // '/reset_password': (BuildContext context) => const ResetPasswordView(),
          // '/new_password': (BuildContext context) => const NewPasswordView(),
          // '/home': (BuildContext context) => const HomeView(),
          // '/menu': (BuildContext context) => const MenuView(),
          // '/profile': (BuildContext context) => const ProfileView(),
        },
      )));
}
