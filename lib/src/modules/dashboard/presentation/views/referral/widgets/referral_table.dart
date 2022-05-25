import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/resources/string/route_constants.dart';
import 'package:saffron_clarity/src/core/resources/string/string_constant.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/dashboard_navigation_controller.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/referral/widgets/tag_widget.dart';
import 'package:get/get.dart';

/// Example without datasource
class ReferralTable extends StatelessWidget {
  final DashboardNavigationController navigationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   border: Border.all(color: Colors.grey.withOpacity(.4), width: .5),
      //   boxShadow: [
      //     BoxShadow(
      //         offset: Offset(0, 6),
      //         color: Colors.grey.withOpacity(.1),
      //         blurRadius: 12)
      //   ],
      //   borderRadius: BorderRadius.circular(8),
      // ),
      // padding: const EdgeInsets.all(16),
      // margin: EdgeInsets.only(bottom: 30),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        headingRowColor: MaterialStateProperty.all(Pallet.primaryLight),
        dividerThickness: 0.1,
        columns: [
          DataColumn2(
            label: CustomText(
              text: StringConfig.text.nameOfReferral,
            ),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: CustomText(
              text: StringConfig.text.status,
            ),
          ),
          DataColumn(
            label: CustomText(
              text: StringConfig.text.date,
            ),
          ),
          DataColumn(
            label: CustomText(
              text: StringConfig.text.priority,
            ),
          ),
        ],
        rows: List<DataRow>.generate(
          5,
          (index) => DataRow2(
            // onSelectChanged: (value) {
            //   print("seleted");
            // },
            onTap: () {
              print("taped: " + index.toString());
              navigationController
                  .navigateTo(RouteConstants.referralDetailPageRoute);
            },
            cells: [
              DataCell(CustomText(
                  text: "Referral for support from community services")),
              DataCell(Row(
                children: [
                  CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: "Active",
                    color: Pallet.blackNeutral,
                  ),
                ],
              )),
              DataCell(CustomText(text: "01/21/2022")),
              DataCell(
                TagWidget(
                  color: Color(0xffFF6263),
                  text: "Urgent",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
