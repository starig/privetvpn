part of 'subscribe_cubit.dart';

class SubscribeState {
  bool showPromoInput;
  bool hasPromoError;

  SubscribeState({
    required this.showPromoInput,
    required this.hasPromoError,
  });

  SubscribeState copyWith({
    bool? showPromoInput,
    bool? hasPromoError,
  }) {
    return SubscribeState(
      showPromoInput: showPromoInput ?? this.showPromoInput,
      hasPromoError: hasPromoError ?? this.hasPromoError,
    );
  }
}
