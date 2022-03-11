class LocalSmsList {
  List<LocalSms>? data;

  LocalSmsList({this.data});

  LocalSmsList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LocalSms>[];
      json['data'].forEach((v) {
        data!.add(new LocalSms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocalSmsList{data: $data}';
  }
}

class LocalSms {
  String? date;
  List<LocalSmsElement>? smsList;

  LocalSms({this.date, this.smsList});

  LocalSms.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['sms_list'] != null) {
      smsList = <LocalSmsElement>[];
      json['sms_list'].forEach((v) {
        smsList!.add(new LocalSmsElement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.smsList != null) {
      data['sms_list'] = this.smsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'LocalSms{date: $date, smsList: $smsList}';
  }
}

class LocalSmsElement {
  String? date;
  String? sms;

  LocalSmsElement({this.date, this.sms});

  LocalSmsElement.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    sms = json['sms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['sms'] = this.sms;
    return data;
  }

  @override
  String toString() {
    return 'SmsList{date: $date, sms: $sms}';
  }
}
