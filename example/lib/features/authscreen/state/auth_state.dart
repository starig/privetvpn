part of 'auth_cubit.dart';

class AuthState {
  bool isAuthorized;
  bool isSubscribed;
  String? uid;

  AuthState({
    required this.isAuthorized,
    required this.isSubscribed,
    this.uid,
  });

  AuthState copyWith({
    bool? isAuthorized,
    bool? isSubscribed,
    String? uid,
  }) {
    return AuthState(
      isAuthorized: isAuthorized ?? this.isAuthorized,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      uid: uid ?? this.uid,
    );
  }
}
