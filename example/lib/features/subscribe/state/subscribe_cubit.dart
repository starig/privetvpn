import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:wireguard_dart_example/config/api.dart';
import 'package:wireguard_dart_example/config/constants.dart';
import 'package:wireguard_dart_example/config/storage.dart';

part 'subscribe_state.dart';

class SubscribeCubit extends Cubit<SubscribeState> {
  SubscribeCubit()
      : super(
          SubscribeState(
            showPromoInput: false,
            hasPromoError: false,
          ),
        );

  void setShowPromo() {
    state.showPromoInput = true;
    emit(state.copyWith(showPromoInput: state.showPromoInput));
  }

  Future<void> activatePromo(String promo) async {
    try {
      final String? uid = await LocalStorage().storage.read(key: StorageConstants().idToken);
      Response response = await PrivetAPI().dio.get("$baseURL/activatePromo?promo=$promo&uid=$uid");
      inspect(response);
      if (response.data['error'] != 'no') {
        state.hasPromoError = true;
        emit(state.copyWith(hasPromoError: state.hasPromoError));
      }
    } catch (e) {
      inspect(e);
    }
  }

  void clearError() {
    state.hasPromoError = false;
    emit(state.copyWith(hasPromoError: state.hasPromoError));
  }
}
