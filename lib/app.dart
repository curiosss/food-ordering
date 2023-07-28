import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/utils.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rokus/core/network/network_service.dart';
import 'package:rokus/core/settings/app_settings.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';
import 'package:rokus/features/home/presentation/home_page.dart';

import 'core/snackbar/home_context.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isloading = true;

  @override
  void initState() {
    initAll();
    super.initState();
  }

  initAll() async {
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);

      AppSettings appSettings = AppSettings();
      await appSettings.init();

      NetworkService networkService = NetworkService();
      await networkService.init();
      Get.put(networkService);

      Get.put(AuthController());

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        isloading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    homeContext = context;
    print(homeContext.hashCode);
    if (isloading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    return const HomePage();
  }
}
