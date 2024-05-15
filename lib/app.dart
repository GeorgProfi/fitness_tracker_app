import 'package:fitness_tracker_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/authentication/onboarding/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: PAppTheme.lightTheme,
        darkTheme: PAppTheme.darkTheme,
        home: const OnBoardingScreen());
  }
}
