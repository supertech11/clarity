import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/sizes/size_config.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/widgets/dual_custom_row.dart';

class ReferralDetailLargeScreen extends StatelessWidget {
  const ReferralDetailLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallet.white,
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
          Row(
            children: [
              CustomText(text: "Title"),
              SizedBox(
                width: 10,
              ),
              CustomText(
                text: "Request for a consultation from a specialist",
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 10),
              children: [
                DualCustomRow(
                  widget1: CustomTextFormField(
                    key: Key(""),
                    labelText: "Status",
                    initialValue: "Active",
                    enabled: false,
                  ),
                  widget2: CustomTextFormField(
                    key: Key(""),
                    labelText: "Type",
                    initialValue: "Referral",
                    enabled: false,
                  ),
                ),
                DualCustomRow(
                  widget1: CustomTextFormField(
                    key: Key(""),
                    labelText: "Priority",
                    initialValue: "Urgent",
                    enabled: false,
                  ),
                  widget2: CustomTextFormField(
                    key: Key(""),
                    labelText: "Intent",
                    initialValue: "Urgent",
                    enabled: false,
                  ),
                ),
                DualCustomRow(
                  widget1: CustomTextFormField(
                    key: Key(""),
                    labelText: "Problem",
                    initialValue: "Lorem ipsum",
                    enabled: false,
                  ),
                  widget2: CustomTextFormField(
                    key: Key(""),
                    labelText: "Goal",
                    initialValue: "Lorem ipsum",
                    enabled: false,
                  ),
                ),
                DualCustomRow(
                  widget1: CustomTextFormField(
                    key: Key(""),
                    labelText: "Category",
                    initialValue: "Lorem ipsum",
                    enabled: false,
                  ),
                  widget2: CustomTextFormField(
                    key: Key(""),
                    labelText: "Requester",
                    initialValue: "Micheal Scott",
                    enabled: false,
                  ),
                ),
                DualCustomRow(
                  widget1: CustomTextFormField(
                    key: Key(""),
                    labelText: "Organization",
                    initialValue: "First memorial hospital",
                    enabled: false,
                  ),
                  widget2: CustomTextFormField(
                    key: Key(""),
                    labelText: "Recipient",
                    initialValue: "Dwight Schrute",
                    enabled: false,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
