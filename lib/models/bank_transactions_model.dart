class BankTransactionsModel {
  Data? data;
  int? code;
  bool? status;

  BankTransactionsModel({this.data, this.code, this.status});

  BankTransactionsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? accountName;
  String? accountNumber;
  String? bankName;
  String? date;
  String? amount;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.accountName,
        this.accountNumber,
        this.bankName,
        this.date,
        this.amount,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    bankName = json['bank_name'];
    date = json['date'];
    amount = json['amount'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_name'] = this.accountName;
    data['account_number'] = this.accountNumber;
    data['bank_name'] = this.bankName;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
