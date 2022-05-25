import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/route_constants.dart';

import 'package:saffron_clarity/src/modules/dashboard/presentation/views/widgets/dashboard_item.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MenuController extends GetxController {
  final TickerProvider? vsync;
  final AnimationController _animationController;
  var state = MenuState.closed.obs;

  MenuController({
    this.vsync,
  }) : _animationController = new AnimationController(vsync: vsync!) {
    _animationController
      ..duration = const Duration(milliseconds: 300)
      ..addListener(() {
        // notifyListeners();
        update();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state.value = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state.value = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state.value = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state.value = MenuState.closed;
            break;
        }
        // notifyListeners();
      });
  }

  final currentPage = 0.obs;
  // final PageController pageController = PageController(
  //   initialPage: 0,
  //   viewportFraction: 0.7,
  // );
  // final CarouselSliderController carouselSliderController =
  //     CarouselSliderController();

  onPageChanged(int index) {
    currentPage.value = index;
  }

  List<DashboardItem>? sliderItems = [
    DashboardItem(
      title: "Surveys",
      subTitle:
          "Filling out the survey questions will help to get to know you better and match you with the best CBOs",
      bgColor: Pallet.primary,
      titleColor: Pallet.white,
      image: AppImageAssets.survey_bg,
      icon: AppImageAssets.survey_icon,
    ),
    DashboardItem(
      title: "Referral",
      subTitle:
          "Get quality and professional care from doctors around the world.",
      bgColor: Pallet.primaryLight,
      titleColor: Pallet.white,
      image: AppImageAssets.referral_bg,
      icon: AppImageAssets.referral_icon,
    ),
  ];

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state.value == MenuState.open) {
      close();
    } else if (state.value == MenuState.closed) {
      open();
    }
  }

  var activeItem = kIsWeb
      ? RouteConstants.referralPageRoute.obs
      : RouteConstants.homePageRoute.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  // Widget returnIconFor(String itemName) {
  //   switch (itemName) {
  //     case overviewPageDisplayName:
  //       return _customIcon(Icons.trending_up, itemName);
  //     case driversPageDisplayName:
  //       return _customIcon(Icons.drive_eta, itemName);
  //     case clientsPageDisplayName:
  //       return _customIcon(Icons.people_alt_outlined, itemName);
  //     case authenticationPageDisplayName:
  //       return _customIcon(Icons.exit_to_app, itemName);
  //     default:
  //       return _customIcon(Icons.exit_to_app, itemName);
  //   }
  // }

  // Widget _customIcon(IconData icon, String itemName) {
  //   if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

  //   return Icon(
  //     icon,
  //     color: isHovering(itemName) ? dark : lightGrey,
  //   );
  // }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
