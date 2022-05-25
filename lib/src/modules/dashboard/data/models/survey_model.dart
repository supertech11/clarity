import 'package:saffron_clarity/src/modules/dashboard/domain/entities/survey.dart';

// ignore: must_be_immutable
class SurveyModel extends Survey {
  // int? id;
  // String? user;
  // String? questionnaire;
  // bool? seen;
  // bool? attempted;

  SurveyModel(
      {id,
      user,
      questionnaire,
      seen,
      attempted,
      title,
      createdAt,
      numberOfQuestionnaire,
      practitioner})
      : super(
          id: id,
          attempted: attempted,
          questionnaire: questionnaire,
          seen: seen,
          user: user,
          createdAt: createdAt,
          numberOfQuestionnaire: numberOfQuestionnaire,
          title: title,
          practitioner: practitioner,
        );

  SurveyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    questionnaire = json['questionnaire'];
    seen = json['seen'];
    attempted = json['attempted'];
    createdAt = json['created_at'];
    numberOfQuestionnaire = json['number_of_questionnaire'];
    title = json['title'];
    practitioner = json['practitioner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['questionnaire'] = this.questionnaire;
    data['seen'] = this.seen;
    data['attempted'] = this.attempted;
    data['created_at'] = this.createdAt;
    data['number_of_questionnaire'] = this.numberOfQuestionnaire;
    data['title'] = this.title;
    data['practitioner'] = this.practitioner;

    return data;
  }
}
