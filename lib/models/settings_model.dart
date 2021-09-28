class SettingsModel {

  int? hide_documentations;
  int? hide_contracts;


  SettingsModel({this.hide_documentations, this.hide_contracts});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    hide_contracts = json['hide_contracts'];
    hide_documentations = json['hide_documentations'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['hide_contracts'] = this.hide_contracts;
    data['hide_documentations'] = this.hide_documentations;


    return data;
  }
}





