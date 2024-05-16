part of 'auth_cubit.dart';

class AuthState {
  bool isAuthorized;
  bool isSubscribed;

  AuthState({
    required this.isAuthorized,
    required this.isSubscribed,
  });

  AuthState copyWith({
    bool? isAuthorized,
    bool? isSubscribed,
  }) {
    return AuthState(
      isAuthorized: isAuthorized ?? this.isAuthorized,
      isSubscribed: isSubscribed ?? this.isSubscribed,
    );
  }
}
