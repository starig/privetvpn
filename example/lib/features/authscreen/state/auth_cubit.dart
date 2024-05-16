import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wireguard_dart_example/config/api.dart';
import 'package:wireguard_dart_example/config/constants.dart';
import 'package:wireguard_dart_example/config/storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthState(
          isAuthorized: false,
          isSubscribed: false,
        ));

  Future<void> logout() async {
    LocalStorage().storage.delete(key: StorageConstants().idToken);
    emit(state.copyWith(isAuthorized: false));
  }

  Future<void> checkIsAuth() async {
    final value = await LocalStorage().storage.read(key: StorageConstants().idToken);
    state.isAuthorized = value != null;
    await checkSubscribe();
    emit(state.copyWith(
      isAuthorized: state.isAuthorized,
    ));
  }

  Future<void> checkSubscribe() async {
    try {
      final String? uid = await LocalStorage().storage.read(key: StorageConstants().idToken);

      Response response = await PrivetAPI().dio.get('$baseURL/checkSubscribe?uid=$uid');
      bool value = response.data['isValidLicense'];
      state.isSubscribed = value;
      emit(state.copyWith(
        isSubscribed: state.isSubscribed,
      ));
    } catch (e) {
      print(e);
    }
  }

  signInWithGoogle() async {
    try {
      const List<String> scopes = <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ];

      GoogleSignIn googleSignIn = GoogleSignIn(
        // Optional clientId
        clientId: '591551138638-f50joc4j3gj66ud8cd059rldhpivam7l.apps.googleusercontent.com',
        // scopes: scopes,
      );

      inspect(googleSignIn);

      inspect(FirebaseAuth.instance);
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      inspect(googleUser);
      if (googleUser?.id != null) {
        await LocalStorage().storage.write(key: StorageConstants().idToken, value: googleUser!.id);
        checkIsAuth();
      }
      // Obtain the auth details from the request
      // final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      //
      // // Create a new credential
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.accessToken,
      //   idToken: googleAuth?.idToken,
      // );

      // Once signed in, return the UserCredential
      // return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      inspect(e);
    }
  }
}
