import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:wireguard_dart_example/config/colors.dart';
import 'package:wireguard_dart_example/config/constants.dart';
import 'package:wireguard_dart_example/features/authscreen/state/auth_cubit.dart';
import 'package:wireguard_dart_example/features/wrapper/wrapper_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        inspect(state);
        if (state.isAuthorized) {
          if (state.isSubscribed) {
            context.go('/home');
          } else {
            context.go('/subscribe');
          }
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return WrapperView(
            // ignoresSafeArea: true,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/logoAnimated.gif"),
                        width: 281,
                        height: 281,
                      ),
                      const Text(
                        "PRIVET \nVPN",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: labelFontName,
                          color: AppColors.primaryPurple,
                          fontSize: 64,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 77,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            InkWell(
                              onTap: () async {
                                await context.read<AuthCubit>().signInWithGoogle();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                height: 44,
                                decoration: BoxDecoration(
                                  color: AppColors.defaultWhite,
                                  borderRadius: BorderRadius.circular(55),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/images/googleIcon.svg"),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Sign in with Google",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            SignInWithAppleButton(
                              onPressed: () async {
                                await context.read<AuthCubit>().signInWithApple();
                              },
                              borderRadius: BorderRadius.circular(55),
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     // Navigator.pushNamed(context, "/register");
                            //   },
                            //   child: Container(
                            //     padding: const EdgeInsets.symmetric(vertical: 8),
                            //     height: 44,
                            //     decoration: BoxDecoration(
                            //       color: AppColors.defaultWhite,
                            //       borderRadius: BorderRadius.circular(55),
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         SvgPicture.asset("assets/images/appleIcon.svg"),
                            //         SizedBox(
                            //           width: 8,
                            //         ),
                            //         Text(
                            //           "Sign in with Apple",
                            //           style: TextStyle(
                            //             fontWeight: FontWeight.w500,
                            //             fontSize: 16,
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
