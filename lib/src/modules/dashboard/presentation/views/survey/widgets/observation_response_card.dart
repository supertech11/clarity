import 'package:flutter/material.dart';
import 'package:fhir/r4.dart' as fhir;
import 'package:expandable/expandable.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/observation_detail_panel.dart';

class ObservationResponseCard extends StatelessWidget {
  final fhir.Observation observation;

  const ObservationResponseCard({
    Key? key,
    required this.observation,
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
                        child: CustomText(
                          key: Key("display"),
                          text: observation.code.text ??
                              observation.code.coding!.last.display ??
                              '[Not reported]', //observation.resource!.code!.text!,
                          weight: FontWeight.bold,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  collapsed: SizedBox(),
                  expanded: ObservationDetailPanel(
                    key: Key("details"),
                    observation: observation,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
