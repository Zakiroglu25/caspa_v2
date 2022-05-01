class LocalSmsList {
  List<LocalSms>? data;

  LocalSmsList({this.data});

  LocalSmsList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LocalSms>[];
      json['data'].forEach((v) {
        data!.add(LocalSms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
        smsList!.add(LocalSmsElement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    if (smsList != null) {
      data['sms_list'] = smsList!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['sms'] = sms;
    return data;
  }

  @override
  String toString() {
    return 'SmsList{date: $date, sms: $sms}';
  }
}
