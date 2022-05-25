import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_button.dart';
import 'package:saffron_clarity/src/core/components/custom_textformfield.dart';
import 'package:saffron_clarity/src/core/components/reponsive_widget.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/app_image_assets.dart';

class SearchSurveyWidget extends StatelessWidget {
  const SearchSurveyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResponsiveWidget.isSmallScreen(context)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    key: Key("search"),
                    hintText: "Search",
                    icon: Icon(Icons.search),
                    labelText: "",
                  ),
                ),
                Container(
                  width: 60,
                  margin: EdgeInsets.only(top: 25, left: 10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Pallet.primary,
                  ),
                  child: Container(
                    height: 50,
                    child: Center(child: Image.asset(AppImageAssets.filter)),
                  ),
                )
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    key: Key("search"),
                    hintText: "Search",
                    icon: Icon(Icons.search),
                    labelText: "",
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 140,
                        padding: EdgeInsets.only(top: 25, left: 10),
                        child: CustomButton(
                          label: "Filter",
                          key: Key("Filter"),
                          onPressed: () {},
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
