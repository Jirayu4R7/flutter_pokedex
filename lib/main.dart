import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';
import 'routes/app_screens.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: AppRoutes.listPokemonScreen,
      getPages: AppPages.list,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
    );
  }
}
