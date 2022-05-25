import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/route_constants.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/dashboard_navigation_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/menu_controller.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/widgets/drawer_profile_title.dart';
import 'package:saffron_clarity/src/modules/onboarding/onboarding_module.dart';
import 'package:saffron_clarity/src/modules/onboarding/presentation/logic/login_controller.dart';

// import 'package:lafia/providers/App.dart';

import './app_drawer_item.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with TickerProviderStateMixin {
  late MenuController menuController;
  DashboardNavigationController navigationController = Get.find();
  LoginController loginController = Get.find();

  @override
  void initState() {
    super.initState();
    menuController = Get.put(MenuController(vsync: this));
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback? closeDrawer() {
      if (ResponsiveWidget.isSmallScreen(context) ||
          ResponsiveWidget.isMediumScreen(context)) menuController.toggle();
    }

    return Container(
      color: Pallet.primary,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.verticalHeightScaled * 2),
                  Row(
                    children: [
                      ResponsiveWidget.isLargeScreen(context)
                          ? Image.asset(AppImageAssets.logo_light)
                          : GestureDetector(
                              onTap: () {
                                menuController.toggle();
                              },
                              child: Image.asset(
                                AppImageAssets.cancel,
                                width: 20,
                              ),
                            ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.verticalHeightScaled),
                  ResponsiveWidget.isLargeScreen(context)
                      ? SizedBox()
                      : DrawerProfileTitleWidget(
                          firstName: "${loginController.firstName}",
                          lastName: "${loginController.lastName}",
                          isHorizontal: false,
                        ),
                  SizedBox(height: 20),
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      color: Pallet.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          kIsWeb
                              ? SizedBox()
                              : AppDrawerItem(
                                  key: Key("home"),
                                  label: StringConfig.text.home,
                                  routeName: RouteConstants.homePageRoute,
                                  iconUrl: AppImageAssets.home,
                                  onTap: () {
                                    closeDrawer();
                                    menuController.activeItem.value =
                                        RouteConstants.homePageRoute;
                                    navigationController.navigateTo(
                                        RouteConstants.homePageRoute);
                                  },
                                ),
                          AppDrawerItem(
                            key: Key("surveys"),
                            label: "Surveys",
                            routeName: RouteConstants.surveyPageRoute,
                            iconUrl: AppImageAssets.survey,
                            onTap: () {
                              closeDrawer();
                              menuController.activeItem.value =
                                  RouteConstants.surveyPageRoute;
                              navigationController
                                  .navigateTo(RouteConstants.surveyPageRoute);
                            },
                          ),
                          AppDrawerItem(
                            key: Key("referrals"),
                            label: StringConfig.text.referrals,
                            routeName: RouteConstants.referralPageRoute,
                            iconUrl: AppImageAssets.referral,
                            onTap: () {
                              closeDrawer();
                              menuController.activeItem.value =
                                  RouteConstants.referralPageRoute;
                              navigationController
                                  .navigateTo(RouteConstants.referralPageRoute);
                            },
                          ),
                          AppDrawerItem(
                            key: Key("settings"),
                            label: StringConfig.text.settings,
                            routeName: RouteConstants.settingsPageRoute,
                            iconUrl: AppImageAssets.settings,
                            onTap: () {
                              closeDrawer();
                              menuController.activeItem.value =
                                  RouteConstants.settingsPageRoute;
                              navigationController
                                  .navigateTo(RouteConstants.settingsPageRoute);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ResponsiveWidget.isLargeScreen(context)
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: CustomText(
                        text: "Profile",
                        color: Pallet.white,
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Pallet.white,
            ),
          ),
          SizedBox(height: 20),
          ResponsiveWidget.isLargeScreen(context)
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      AppImageAssets.logout,
                      width: 25,
                      height: 25,
                      color: Pallet.primary,
                    ),
                    tileColor: Pallet.white,
                    minLeadingWidth: 20,
                    title: CustomText(
                      text: StringConfig.text.signOut,
                      color: Pallet.primary,
                    ),
                    onTap: () {
                      menuController.activeItem.value =
                          RouteConstants.logoutPageRoute;
                    },
                  ),
                )
              : AppDrawerItem(
                  key: Key("signOut"),
                  label: StringConfig.text.signOut,
                  routeName: RouteConstants.logoutPageRoute,
                  iconUrl: AppImageAssets.logout,
                  onTap: () {
                    menuController.activeItem.value =
                        RouteConstants.logoutPageRoute;
                    menuController.toggle();
                    loginController.logout();
                    Get.offNamedUntil(
                        OnboardingModule.loginScreen.name, (route) => false);
                  },
                ),
          SizedBox(height: SizeConfig.verticalHeightScaled * 2.5),
        ],
      ),
    );
  }
}
