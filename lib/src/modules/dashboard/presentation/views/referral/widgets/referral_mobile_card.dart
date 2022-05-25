import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/route_constants.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/dashboard_navigation_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/widgets/tag_widget.dart';
import 'package:get/get.dart';

class ReferralMobileCard extends StatelessWidget {
  const ReferralMobileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardNavigationController navigationController = Get.find();

    return GestureDetector(
      onTap: () {
        navigationController.navigateTo(RouteConstants.referralDetailPageRoute);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
          color: Pallet.white,
          elevation: 0,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TagWidget(
                  color: Color(0xffCE3E52),
                  text: "Urgent",
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Referral for support from community services",
                  weight: FontWeight.w500,
                  size: 14,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      text: "Active",
                      color: Pallet.blackNeutral,
                      size: 12,
                      weight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 1.5,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      text: "27 June 2021",
                      color: Pallet.blackNeutral,
                      size: 12,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(AppImageAssets.sample_user),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      text: "Michael Scott",
                      color: Pallet.blackNeutral,
                      size: 12,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
