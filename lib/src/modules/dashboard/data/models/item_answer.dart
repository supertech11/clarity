class ItemAnswer {
  String? linkId;
  String? text;
  bool? isGrouped;
  List<Answer>? answer;
  List<ItemAnswer>? itemAnswer;

  ItemAnswer(
      {this.linkId,
      this.text,
      this.answer,
      this.isGrouped = false,
      this.itemAnswer});

  ItemAnswer.fromJson(Map<String, dynamic> json) {
    linkId = json['linkId'];
    text = json['text'];
    isGrouped = json['answer'] != null ? false : true;
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(new Answer.fromJson(v));
      });
    } else {
      itemAnswer = [];
      List<dynamic> innerQuestion = json["item"];
      innerQuestion.forEach((qst) {
        itemAnswer!.add(ItemAnswer.fromJson(qst));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkId'] = this.linkId;
    data['text'] = this.text;
    if (this.answer != null) {
      data['answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  ValueCoding? valueCoding;
  String? valueString;
  double? valueDecimal;

  Answer({this.valueCoding, this.valueString, this.valueDecimal});

  Answer.fromJson(Map<String, dynamic> json) {
    valueCoding = json['valueCoding'] != null
        ? new ValueCoding.fromJson(json['valueCoding'])
        : null;
    valueString = json["valueString"] != null ? json["valueString"] : "";
    valueDecimal = json["valueDecimal"] != null
        ? double.parse(json["valueDecimal"].toString())
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.valueCoding != null) {
      data['valueCoding'] = this.valueCoding!.toJson();
    }
    return data;
  }
}

class ValueCoding {
  String? system;
  String? code;
  String? display;

  ValueCoding({this.system, this.code, this.display});

  ValueCoding.fromJson(Map<String, dynamic> json) {
    system = json['system'];
    code = json['code'];
    display = json['display'] != null ? json['display'] : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system'] = this.system;
    data['code'] = this.code;
    data['display'] = this.display;
    return data;
  }
}
