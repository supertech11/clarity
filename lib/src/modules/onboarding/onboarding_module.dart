import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:saffron_clarity/src/modules/module.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/complete_profile/complete_profile.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/login_screen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/login/login_with_medicare_webview.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/otp_verification/otp_verification.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/register/register.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/new_password.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/reset_password.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/reset_password/reset_password_otp.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/splashscreen/splashscreen.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/views/walkthrough/walkthrough.dart';

class OnboardingModule extends Module {
  // NavigationController navigationController = Get.put(NavigationController());

  static final loginScreen = GetPage(
    name: '/login',
    page: () => LoginScreen(),
    binding: OnboardingBinding(),
  );

  static final loginWithMedicareScreen = GetPage(
    name: '/loginWithMedicare',
    page: () => LoginWithMedicareWebview(),
    binding: OnboardingBinding(),
  );

  static final registerScreen = GetPage(
    name: '/register',
    page: () => RegisterScreen(),
    binding: OnboardingBinding(),
  );

  static final splashScreen = GetPage(
    name: '/splashscreen',
    page: () => SplashScreen(),
    binding: OnboardingBinding(),
  );

  static final completeProfileScreen = GetPage(
    name: '/complete-profile',
    page: () => CompleteProfileScreen(),
    binding: OnboardingBinding(),
  );

  static final otpVerificationScreen = GetPage(
    name: '/otp-verification',
    page: () => OtpVerificationScreen(),
    binding: OnboardingBinding(),
  );

  static final resetPasswordScreen = GetPage(
    name: '/reset-password',
    page: () => ResetPasswordScreen(),
    binding: OnboardingBinding(),
  );

  static final newPasswordScreen = GetPage(
    name: '/new-password',
    page: () => NewPasswordScreen(),
    binding: OnboardingBinding(),
  );
  static final resetPasswordOtpScreen = GetPage(
    name: '/reset-password-otp',
    page: () => ResetPasswordOtpScreen(),
    binding: OnboardingBinding(),
  );

  static final walkThroughScreen = GetPage(
    name: '/walkthrough',
    page: () => WalkThroughScreen(),
    binding: OnboardingBinding(),
  );

  @override
  void register(List<GetPage> routes) {
    routes.addAll([
      loginScreen,
      loginWithMedicareScreen,
      registerScreen,
      splashScreen,
      completeProfileScreen,
      otpVerificationScreen,
      resetPasswordScreen,
      newPasswordScreen,
      resetPasswordOtpScreen,
      walkThroughScreen
    ]);
  }
}
