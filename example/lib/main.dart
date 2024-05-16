import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireguard_dart_example/config/theme.dart';
import 'package:wireguard_dart_example/features/authscreen/state/auth_cubit.dart';
import 'package:wireguard_dart_example/features/home/state/home_cubit.dart';
import 'package:wireguard_dart_example/firebase_options.dart';
import 'package:wireguard_dart_example/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => HomeCubit())),
        BlocProvider(create: ((context) => AuthCubit())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        routerConfig: router,
        // initialRoute: '/',
        themeAnimationCurve: Curves.easeInOut,
        // routes: <String, WidgetBuilder>{
        //   '/': (BuildContext context) => const MyApp(),
        //   // '/register': (BuildContext context) => const RegisterView(),
        //   // '/login': (BuildContext context) => const LoginView(),
        //   // '/reset_password': (BuildContext context) => const ResetPasswordView(),
        //   // '/new_password': (BuildContext context) => const NewPasswordView(),
        //   // '/home': (BuildContext context) => const HomeView(),
        //   // '/menu': (BuildContext context) => const MenuView(),
        //   // '/profile': (BuildContext context) => const ProfileView(),
        // },
      )));
}
