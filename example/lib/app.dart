import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wireguard_dart/connection_status.dart';
import 'package:wireguard_dart/wireguard_dart.dart';
import 'package:wireguard_dart_example/screens/home/home_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _wireguardDartPlugin = WireguardDart();
  ConnectionStatus _status = ConnectionStatus.unknown;
  late Stream<ConnectionStatus> _statusStream;

  @override
  void initState() {
    super.initState();
    _statusStream = _wireguardDartPlugin.statusStream();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = '';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      debugPrint(_platformVersion);
    });
  }

  void status() async {
    try {
      var status = await _wireguardDartPlugin.status();
      debugPrint("Connection status: $status");
      setState(() {
        _status = status;
      });
    } catch (e) {
      developer.log("Connection status", error: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
