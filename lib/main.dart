import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/localization/app_translation.dart';
import 'package:saffron_clarity/src/core/components/page_not_found.dart';
import 'package:saffron_clarity/src/core/navigation/app_router.dart';
import 'package:saffron_clarity/src/core/resources/theme/app_theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clarity',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => PageNotFound(),
        transition: Transition.fadeIn,
      ),
      translations: AppTranslations(),
      fallbackLocale: const Locale('en', 'US'),

      locale: Get.deviceLocale,
      initialRoute: kIsWeb
          ? AppRouter.it.webInitialRoute
          : AppRouter.it.mobileInitialRoute,
      getPages: AppRouter.it.all,

      // routingCallback: (route) {
      //   if (true) Get.offAllNamed(OnboardingModule.loginScreen.name);
      // },
    );
  }
}
