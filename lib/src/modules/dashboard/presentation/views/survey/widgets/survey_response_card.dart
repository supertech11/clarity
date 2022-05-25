import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/modules/dashboard/data/models/item_answer.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/survey_answer_widget.dart';

class SurveyResponseCard extends StatelessWidget {
  final ItemAnswer item;

  const SurveyResponseCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        shadowColor: Color(0xFF0d3f67).withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpandablePanel(
                header: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10),
                        child: CustomText(
                          text: item.text!,
                          key: Key("question"),
                          weight: FontWeight.w500,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                collapsed: SizedBox(),
                expanded: item.isGrouped!
                    ? ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 10, top: 10),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  key: Key("grouped_question"),
                                  text: item.itemAnswer![index].text!,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(left: 10),
                                  itemBuilder: (ctx, index) {
                                    return SurveyAnswerWidget(
                                      key: Key("grouped_answer"),
                                      answer: item.itemAnswer![index]
                                                  .answer![index].valueCoding !=
                                              null
                                          ? item
                                              .itemAnswer![index]
                                              .answer![index]
                                              .valueCoding!
                                              .display
                                          : item
                                                  .itemAnswer![index]
                                                  .answer![index]
                                                  .valueString!
                                                  .isNotEmpty
                                              ? item.itemAnswer![index]
                                                  .answer![index].valueString
                                              : item
                                                          .itemAnswer![index]
                                                          .answer![index]
                                                          .valueDecimal !=
                                                      null
                                                  ? item
                                                      .itemAnswer![index]
                                                      .answer![index]
                                                      .valueDecimal
                                                      .toString()
                                                  : "",
                                    );
                                  },
                                  itemCount:
                                      item.itemAnswer![index].answer!.length,
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: item.itemAnswer!.length,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return SurveyAnswerWidget(
                            key: Key("ungrouped_answer"),
                            answer: item.answer![index].valueCoding != null
                                ? item.answer![index].valueCoding!.display
                                : item.answer![index].valueString!.isNotEmpty
                                    ? item.answer![index].valueString
                                    : item.answer![index].valueDecimal != null
                                        ? item.answer![index].valueDecimal
                                            .toString()
                                        : "",
                            // item.answer![index].valueCoding != null
                            //     ? item.answer![index].valueCoding!.display
                            //     : item.answer![index].valueString,
                          );
                        },
                        itemCount: item.answer!.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
