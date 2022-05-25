import 'package:saffron_clarity/src/modules/dashboard/data/models/item_answer.dart';

class QuestionnaireResponse {
  String? title;
  String? id;
  List<ItemAnswer>? answers;
  QuestionnaireResponse({this.title, this.answers, this.id});
}
