class FhirObservation {
  String? fullUrl;
  Resource? resource;
  Search? search;
  Response? response;

  FhirObservation({this.fullUrl, this.resource, this.search, this.response});

  FhirObservation.fromJson(Map<String, dynamic> json) {
    fullUrl = json['fullUrl'];
    resource = json['resource'] != null
        ? new Resource.fromJson(json['resource'])
        : null;
    search =
        json['search'] != null ? new Search.fromJson(json['search']) : null;
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullUrl'] = this.fullUrl;
    if (this.resource != null) {
      data['resource'] = this.resource!.toJson();
    }
    if (this.search != null) {
      data['search'] = this.search!.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Resource {
  String? resourceType;
  String? id;
  Meta? meta;
  String? status;
  Code? code;
  Subject? subject;
  String? effectiveDateTime;
  String? issued;
  Code? valueCodeableConcept;
  List<DerivedFrom>? derivedFrom;

  Resource(
      {this.resourceType,
      this.id,
      this.meta,
      this.status,
      this.code,
      this.subject,
      this.effectiveDateTime,
      this.issued,
      this.valueCodeableConcept,
      this.derivedFrom});

  Resource.fromJson(Map<String, dynamic> json) {
    resourceType = json['resourceType'];
    id = json['id'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    status = json['status'];
    code = json['code'] != null ? new Code.fromJson(json['code']) : null;
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    effectiveDateTime = json['effectiveDateTime'];
    issued = json['issued'];
    valueCodeableConcept = json['valueCodeableConcept'] != null
        ? new Code.fromJson(json['valueCodeableConcept'])
        : null;
    if (json['derivedFrom'] != null) {
      derivedFrom = <DerivedFrom>[];
      json['derivedFrom'].forEach((v) {
        derivedFrom!.add(new DerivedFrom.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceType'] = this.resourceType;
    data['id'] = this.id;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['status'] = this.status;
    if (this.code != null) {
      data['code'] = this.code!.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    data['effectiveDateTime'] = this.effectiveDateTime;
    data['issued'] = this.issued;
    if (this.valueCodeableConcept != null) {
      data['valueCodeableConcept'] = this.valueCodeableConcept!.toJson();
    }
    if (this.derivedFrom != null) {
      data['derivedFrom'] = this.derivedFrom!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  String? versionId;
  String? lastUpdated;

  Meta({this.versionId, this.lastUpdated});

  Meta.fromJson(Map<String, dynamic> json) {
    versionId = json['versionId'];
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['versionId'] = this.versionId;
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}

class Code {
  List<Coding>? coding;
  String? text;

  Code({this.coding, this.text});

  Code.fromJson(Map<String, dynamic> json) {
    if (json['coding'] != null) {
      coding = <Coding>[];
      json['coding'].forEach((v) {
        coding!.add(new Coding.fromJson(v));
      });
    }
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coding != null) {
      data['coding'] = this.coding!.map((v) => v.toJson()).toList();
    }
    data['text'] = this.text;
    return data;
  }
}

class Coding {
  String? code;
  String? display;

  Coding({this.code, this.display});

  Coding.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['display'] = this.display;
    return data;
  }
}

class Subject {
  String? reference;

  Subject({this.reference});

  Subject.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    return data;
  }
}

class Search {
  String? mode;

  Search({this.mode});

  Search.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mode'] = this.mode;
    return data;
  }
}

class Response {
  String? status;
  String? etag;

  Response({this.status, this.etag});

  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    etag = json['etag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['etag'] = this.etag;
    return data;
  }
}

class DerivedFrom {
  String? reference;

  DerivedFrom({this.reference});

  DerivedFrom.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    return data;
  }
}
