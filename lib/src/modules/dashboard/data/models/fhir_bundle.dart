class FhirBundle {
  int? status;
  Headers? headers;
  Data? data;
  String? message;

  FhirBundle({this.status, this.headers, this.data, this.message});

  FhirBundle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    headers =
        json['headers'] != null ? new Headers.fromJson(json['headers']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.headers != null) {
      data['headers'] = this.headers!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Headers {
  String? xPoweredBy;
  String? lastModified;
  String? contentType;
  String? date;
  String? connection;

  Headers(
      {this.xPoweredBy,
      this.lastModified,
      this.contentType,
      this.date,
      this.connection});

  Headers.fromJson(Map<String, dynamic> json) {
    xPoweredBy = json['x-powered-by'];
    lastModified = json['last-modified'];
    contentType = json['content-type'];
    date = json['date'];
    connection = json['connection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x-powered-by'] = this.xPoweredBy;
    data['last-modified'] = this.lastModified;
    data['content-type'] = this.contentType;
    data['date'] = this.date;
    data['connection'] = this.connection;
    return data;
  }
}

class Data {
  String? resourceType;
  String? id;
  Meta? meta;
  String? type;
  int? total;
  List<Link>? link;
  List<Entry>? entry;

  Data(
      {this.resourceType,
      this.id,
      this.meta,
      this.type,
      this.total,
      this.link,
      this.entry});

  Data.fromJson(Map<String, dynamic> json) {
    resourceType = json['resourceType'];
    id = json['id'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    type = json['type'];
    total = json['total'];

    if (json['link'] != null) {
      link = <Link>[];
      json['link'].forEach((v) {
        link!.add(new Link.fromJson(v));
      });
    }

    if (json['entry'] != null) {
      entry = <Entry>[];
      json['entry'].forEach((v) {
        entry!.add(new Entry.fromJson(v));
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
    data['type'] = this.type;
    data['total'] = this.total;
    if (this.link != null) {
      data['link'] = this.link!.map((v) => v.toJson()).toList();
    }
    if (this.entry != null) {
      data['entry'] = this.entry!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  String? lastUpdated;

  Meta({this.lastUpdated});

  Meta.fromJson(Map<String, dynamic> json) {
    lastUpdated = json['lastUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdated'] = this.lastUpdated;
    return data;
  }
}

class Link {
  String? relation;
  String? url;

  Link({this.relation, this.url});

  Link.fromJson(Map<String, dynamic> json) {
    relation = json['relation'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['relation'] = this.relation;
    data['url'] = this.url;
    return data;
  }
}

class Entry {
  dynamic data;

  Entry({this.data});

  Entry.fromJson(dynamic json) {
    data = json;
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }

  @override
  String toString() {
    return data.toString();
  }
}
