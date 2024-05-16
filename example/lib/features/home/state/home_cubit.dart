import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wireguard_dart/wireguard_dart.dart';
import 'package:wireguard_dart_example/config/api.dart';
import 'package:wireguard_dart_example/config/colors.dart';
import 'package:wireguard_dart_example/config/constants.dart';
import 'package:wireguard_dart_example/data/models/server_item/server_item.dart';
import 'package:wireguard_dart_example/features/home/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          currentBorderColor: AppColors.defaultWhite,
          currentStatusColor: AppColors.primaryGray,
          currentStatusText: "Disconnected",
          connectionState: VpnConnectionState.disconnected,
          currentCrossFadeState: CrossFadeState.showFirst,
          servers: [],
          selectedServer: null,
          isGetServersPending: false,
        ));

  void setConnectionStatus(int status) async {
    switch (status) {
      case 0:
        setPendingStatus();
      case 1:
        setConnectedStatus();
      case 2:
        setDisconnectedStatus();
    }
    emit(state.copyWith(connectionState: state.connectionState));
  }

  Future<void> getServers() async {
    state.isGetServersPending = true;
    emit(state.copyWith(isGetServersPending: state.isGetServersPending));
    try {
      Response response = await PrivetAPI().dio.get("$baseURL/getServers");
      if (response.data != null) {
        List<ServerItem> serversList = [];
        response.data.forEach((server) => serversList.add(ServerItem.fromJson(server)));
        state.servers = serversList;
        if (state.selectedServer == null) {
          state.selectedServer = serversList.first;
        }
        state.isGetServersPending = false;
        emit(state.copyWith(
          servers: state.servers,
          selectedServer: state.selectedServer,
          isGetServersPending: state.isGetServersPending,
        ));
      }
    } catch (e) {
      // inspect(e);
      state.isGetServersPending = false;
      emit(state.copyWith(isGetServersPending: state.isGetServersPending));
    }
  }

  listenVpnStatus() {}

  selectServer(ServerItem server) {
    state.selectedServer = server;
    emit(state.copyWith(selectedServer: state.selectedServer));
  }

  Future<void> setupTunnel(WireguardDart plugin) async {
    try {
      await plugin.setupTunnel(
          bundleId: tunBundleId, tunnelName: "PrivetVPN", win32ServiceName: winSvcName);
      debugPrint("Setup tunnel success");
    } catch (e) {
      developer.log(
        'Setup tunnel',
        error: e,
      );
    }
  }

  void connectVPN(WireguardDart plugin) async {
    setPendingStatus();
    try {
      await setupTunnel(plugin);
    } catch (e) {
      developer.inspect(e);
    }
    // late WireguardItem? wireguardItem;

    if (state.selectedServer != null) {
      // final String? uid = await LocalStorage().storage.read(key: StorageConstants().idToken);

      // try {
      //   Response response = await PrivetAPI()
      //       .dio
      //       .get("$baseURL/getKey?uid=$uid&serverId=${state.selectedServer!.id}");
      //   wireguardItem = WireguardItem.fromJson(response.data);
      // } catch (e, stack) {
      //   // inspect(e);
      //   // print("error: $e stack: $stack");
      //   developer.log(
      //     'Get server',
      //     error: e,
      //   );
      // }

      try {
        // replace with valid config file before running
        await plugin.connect(cfg: """
        [Interface]
Address = 192.168.6.17/32
PrivateKey = ICaY4MQyA9HvswoSndrQNXmo65+JnU42Xf6NZ6TGKk0=
DNS = 9.9.9.9,8.8.8.8

[Peer]
PublicKey = DXhMcAAAS6kqFHjdeM6feVOd2wixzWMX3PJcO37LekM=
PresharedKey = NKNDce2yZsCkWHv21DALliygv4nuUt5zDSq8z0E78No=
AllowedIPs = 0.0.0.0/0
Endpoint = 213.226.100.9:41194
PersistentKeepalive = 15
""");
        debugPrint("Connect success");
      } catch (e) {
        developer.log(
          'Connect',
          error: e.toString(),
        );
      }
    }
  }

  void disconnectVPN(WireguardDart plugin) async {
    try {
      await plugin.disconnect();
      debugPrint("Disconnect success");
    } catch (e) {
      developer.log(
        'Disconnect',
        error: e.toString(),
      );
    }
    setDisconnectedStatus();
  }

  setDisconnectedStatus() {
    state.currentBorderColor = AppColors.defaultWhite;
    state.connectionState = VpnConnectionState.disconnected;
    state.currentCrossFadeState = CrossFadeState.showFirst;
    state.currentStatusText = "Disconnected";
    state.currentStatusColor = AppColors.primaryGray;
    emit(state.copyWith(
      currentBorderColor: state.currentBorderColor,
      connectionState: state.connectionState,
      currentCrossFadeState: state.currentCrossFadeState,
      currentStatusText: state.currentStatusText,
      currentStatusColor: state.currentStatusColor,
    ));
  }

  setPendingStatus() {
    state.currentBorderColor = AppColors.primaryOrange;
    state.connectionState = VpnConnectionState.pending;
    state.currentStatusText = 'Connecting';
    state.currentStatusColor = AppColors.primaryOrange;
    state.currentCrossFadeState = CrossFadeState.showSecond;

    emit(state.copyWith(
      connectionState: state.connectionState,
      currentStatusColor: state.currentStatusColor,
      currentStatusText: state.currentStatusText,
      currentBorderColor: state.currentBorderColor,
    ));
  }

  setConnectedStatus() {
    state.currentBorderColor = AppColors.primaryPurple;
    state.connectionState = VpnConnectionState.connected;
    state.currentStatusText = 'Connected';
    state.currentStatusColor = AppColors.primaryPurple;
    state.currentCrossFadeState = CrossFadeState.showSecond;

    emit(state.copyWith(
      connectionState: state.connectionState,
      currentStatusColor: state.currentStatusColor,
      currentStatusText: state.currentStatusText,
      currentBorderColor: state.currentBorderColor,
    ));
  }
}
