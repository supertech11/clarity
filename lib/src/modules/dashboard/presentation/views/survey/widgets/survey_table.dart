import 'package:flutter/material.dart';

import 'package:saffron_clarity/src/modules/dashboard/presentation/logic/dashboard_navigation_controller.dart';
import 'package:get/get.dart';

class SurveyTable extends StatelessWidget {
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
      child: Row(
        children: [
          // DataTable2(
          //   columnSpacing: 12,
          //   horizontalMargin: 12,
          //   minWidth: 600,
          //   headingRowColor: MaterialStateProperty.all(Pallet.primaryLight),
          //   dividerThickness: 0.1,
          //   columns: [
          //     DataColumn2(
          //       label: CustomText(
          //         text: StringConfig.text.nameOfSurvey,
          //       ),
          //       size: ColumnSize.L,
          //     ),
          //     DataColumn(
          //       label: CustomText(
          //         text: StringConfig.text.noOfQuestions,
          //       ),
          //     ),
          //     DataColumn(
          //       label: CustomText(
          //         text: StringConfig.text.date,
          //       ),
          //     ),
          //     DataColumn(
          //       label: CustomText(
          //         text: StringConfig.text.requester,
          //       ),
          //     ),
          //   ],
          //   rows: List<DataRow>.generate(
          //     5,
          //     (index) => DataRow2(
          //       // onSelectChanged: (value) {
          //       //   print("seleted");
          //       // },
          //       onTap: () {
          //         print("taped: " + index.toString());
          //         Get.to(RenderSurvey());
          //       },
          //       cells: [
          //         DataCell(CustomText(
          //           text: "Housing questionnaire",
          //           isUnderlined: true,
          //         )),
          //         DataCell(Row(
          //           children: [
          //             // CircleAvatar(
          //             //   radius: 3,
          //             //   backgroundColor: Colors.green,
          //             // ),
          //             // SizedBox(
          //             //   width: 5,
          //             // ),
          //             CustomText(
          //               text: "21",
          //               color: Pallet.blackNeutral,
          //             ),
          //           ],
          //         )),
          //         DataCell(CustomText(text: "21 Jan 2022")),
          //         DataCell(
          //           Row(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               CircleAvatar(
          //                 backgroundImage: AssetImage(AppImageAssets.sample_user),
          //                 radius: 20,
          //               ),
          //               SizedBox(
          //                 width: 5,
          //               ),
          //               CustomText(text: "Michael Scott")
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
