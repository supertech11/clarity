import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';

class ReferralDetailMobileScreen extends StatelessWidget {
  const ReferralDetailMobileScreen({Key? key}) : super(key: key);

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
            text: StringConfig.text.referralDetail,
            weight: FontWeight.bold,
            size: 24,
          ),
          SizedBox(
            height: SizeConfig.verticalHeightScaled * 2,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 10),
              children: [
                Card(
                  color: Pallet.white,
                  elevation: 8,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Title",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Request for a consultation from a specialist",
                          weight: FontWeight.w500,
                          size: 14,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Status",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.green,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: "Active",
                              weight: FontWeight.w500,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Pallet.white,
                  elevation: 8,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Type",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Institutional",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Intent",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Proposal",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Priority",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Urgent",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Speciality",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Midwife",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Category",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Lorem ipsum ",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Pallet.white,
                  elevation: 8,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Problem",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Lorem ipsum ",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Goal",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Lorem ipsum",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Requester",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Michael Scott",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Organization",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "First memorial hospital",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Recipient",
                          color: Pallet.blackNeutral,
                          size: 12,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Dwight Schrute",
                          weight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
