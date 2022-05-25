import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/widgets/referral_mobile_card.dart';

class ReferralMobileScreen extends StatelessWidget {
  const ReferralMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallet.bgWhite,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          CustomText(
            text: StringConfig.text.referrals,
            weight: FontWeight.bold,
            size: 16,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomTextFormField(
                  key: Key("search"),
                  hintText: "Search",
                  icon: Icon(
                    Icons.search,
                    color: Pallet.blackNeutral,
                  ),
                ),
              ),
              Container(
                  width: 48,
                  height: 48,
                  margin: EdgeInsets.only(left: 15, bottom: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Pallet.primaryDark),
                  child: Center(child: Image.asset(AppImageAssets.filter)))
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 20),
              children: [
                ReferralMobileCard(),
                ReferralMobileCard(),
                ReferralMobileCard(),
                ReferralMobileCard(),
                ReferralMobileCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
