import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/utils.dart';
import 'package:rokus/core/network/network_service.dart';
import 'package:rokus/features/auth/presentation/controller/auth_controller.dart';
import 'package:rokus/features/home/presentation/home_page.dart';

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
    NetworkService networkService = NetworkService();
    await networkService.initHeaders();
    Get.put(networkService);

    Get.put(AuthController());

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
