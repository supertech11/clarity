import 'package:flutter/material.dart';
import 'package:fhir/r4.dart' as fhir;

import 'package:saffron_clarity/src/core/resources/constants/observation_status.dart';
import 'package:saffron_clarity/src/modules/dashboard/presentation/views/survey/widgets/observation_value_widget.dart';

class ObservationDetailPanel extends StatelessWidget {
  final fhir.Observation observation;
  ObservationDetailPanel({Key? key, required this.observation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ObservationValueWidget(
            key: Key("actual_result"),
            title: "Actual result",
            value: observation.valueCodeableConcept != null
                ? observation.valueCodeableConcept!.text ??
                    observation.valueCodeableConcept!.coding!.last.display ??
                    '[Not reported]'
                : '[Not reported]',
          ),
          ObservationValueWidget(
            key: Key("status"),
            title: "Status",
            value: observation.status != null
                ? ObservationStatuses[observation.status!.index].toString()
                : '[Not reported]',
          ),
          ObservationValueWidget(
            key: Key("method"),
            title: "Method",
            value: observation.method != null
                ? observation.method!.text ?? '[Not reported]'
                : '[Not reported]',
          ),
          ObservationValueWidget(
            key: Key("performer"),
            title: "Performer",
            value: observation.performer != null
                ? observation.performer!
                    .map((e) => '${e.display} ')
                    .toList()
                    .toString()
                : '[Not reported]',
          ),
          ObservationValueWidget(
            key: Key("subject"),
            title: "Subject",
            value: observation.subject != null
                ? observation.subject!.display ?? '[Not reported]'
                : '[Not reported]',
          ),
        ],
      ),
    );
  }
}
