import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Survey extends Equatable {
  int? id, numberOfQuestionnaire;
  String? user, questionnaire, title, createdAt, practitioner;
  bool? seen, attempted;

  Survey(
      {this.attempted,
      this.id,
      this.questionnaire,
      this.seen,
      this.user,
      this.practitioner,
      this.createdAt,
      this.numberOfQuestionnaire,
      this.title});

  @override
  List<Object?> get props => [id, user, questionnaire];
}
