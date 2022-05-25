// class QuestionnaireResponse {
//   String? resourceType;
//   Meta? meta;
//   String? status;
//   String? authored;
//   List<Item>? item;

//   QuestionnaireResponse(
//       {this.resourceType, this.meta, this.status, this.authored, this.item});

//   QuestionnaireResponse.fromJson(Map<String, dynamic> json) {
//     resourceType = json['resourceType'];
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//     status = json['status'];
//     authored = json['authored'];
//     if (json['item'] != null) {
//       item = <Item>[];
//       json['item'].forEach((v) {
//         item!.add(new Item.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['resourceType'] = this.resourceType;
//     if (this.meta != null) {
//       data['meta'] = this.meta!.toJson();
//     }
//     data['status'] = this.status;
//     data['authored'] = this.authored;
//     if (this.item != null) {
//       data['item'] = this.item!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Meta {
//   List<String>? profile;
//   List<Tag>? tag;

//   Meta({this.profile, this.tag});

//   Meta.fromJson(Map<String, dynamic> json) {
//     profile = json['profile'].cast<String>();
//     if (json['tag'] != null) {
//       tag = <Tag>[];
//       json['tag'].forEach((v) {
//         tag!.add(new Tag.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['profile'] = this.profile;
//     if (this.tag != null) {
//       data['tag'] = this.tag!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Tag {
//   String? code;

//   Tag({this.code});

//   Tag.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     return data;
//   }
// }

// class Item {
//   String? linkId;
//   String? text;
//   List<ItemAnswer>? item;

//   Item({this.linkId, this.text, this.item});

//   Item.fromJson(Map<String, dynamic> json) {
//     linkId = json['linkId'];
//     text = json['text'];
//     if (json['item'] != null) {
//       item = <ItemAnswer>[];
//       json['item'].forEach((v) {
//         item!.add(new ItemAnswer.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['linkId'] = this.linkId;
//     data['text'] = this.text;
//     if (this.item != null) {
//       data['item'] = this.item!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ItemAnswer {
//   String? linkId;
//   String? text;
//   List<Answer>? answer;

//   ItemAnswer({this.linkId, this.text, this.answer});

//   ItemAnswer.fromJson(Map<String, dynamic> json) {
//     linkId = json['linkId'];
//     text = json['text'];
//     if (json['answer'] != null) {
//       answer = <Answer>[];
//       json['answer'].forEach((v) {
//         answer!.add(new Answer.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['linkId'] = this.linkId;
//     data['text'] = this.text;
//     if (this.answer != null) {
//       data['answer'] = this.answer!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Answer {
//   ValueCoding? valueCoding;

//   Answer({this.valueCoding});

//   Answer.fromJson(Map<String, dynamic> json) {
//     valueCoding = json['valueCoding'] != null
//         ? new ValueCoding.fromJson(json['valueCoding'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.valueCoding != null) {
//       data['valueCoding'] = this.valueCoding!.toJson();
//     }
//     return data;
//   }
// }

// class ValueCoding {
//   String? system;
//   String? code;
//   String? display;

//   ValueCoding({this.system, this.code, this.display});

//   ValueCoding.fromJson(Map<String, dynamic> json) {
//     system = json['system'];
//     code = json['code'];
//     display = json['display'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['system'] = this.system;
//     data['code'] = this.code;
//     data['display'] = this.display;
//     return data;
//   }
// }
