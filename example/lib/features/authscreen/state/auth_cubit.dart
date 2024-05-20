import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:wireguard_dart_example/config/api.dart';
import 'package:wireguard_dart_example/config/constants.dart';
import 'package:wireguard_dart_example/config/storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthState(
          isAuthorized: false,
          isSubscribed: false,
          uid: null,
        ));

  Future<void> logout() async {
    LocalStorage().storage.delete(key: StorageConstants().idToken);
    state.uid = null;
    emit(state.copyWith(isAuthorized: false, uid: state.uid));
  }

  Future<void> checkIsAuth() async {
    final value = await LocalStorage().storage.read(key: StorageConstants().idToken) ?? state.uid;
    state.isAuthorized = value != null;
    await checkSubscribe();
    emit(state.copyWith(
      isAuthorized: state.isAuthorized,
    ));
  }

  Future<void> checkSubscribe() async {
    try {
      final String? uid =
          await LocalStorage().storage.read(key: StorageConstants().idToken) ?? state.uid;

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

  signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      if (credential.userIdentifier != null) {
        state.uid = credential.userIdentifier;
        emit(state.copyWith(uid: state.uid));
        await LocalStorage()
            .storage
            .write(key: StorageConstants().idToken, value: credential.userIdentifier);
        await checkIsAuth();
      }
    } catch (e) {
      inspect(e);
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

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser?.id != null) {
        state.uid = googleUser!.id;
        emit(state.copyWith(uid: state.uid));
        await LocalStorage().storage.write(key: StorageConstants().idToken, value: googleUser!.id);
        await checkIsAuth();
      }
    } catch (e) {
      inspect(e);
    }
  }
}
