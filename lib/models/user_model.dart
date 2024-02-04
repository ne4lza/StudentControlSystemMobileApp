class UserModel {
  int? id;
  String? userName;
  String? userSurName;
  String? userUserName;
  String? password;
  bool? isActive;
  bool? isDeleted;
  String? insertedDate;
  String? updateDate;
  int? sysUserId;

  UserModel(
      {this.id,
      this.userName,
      this.userSurName,
      this.userUserName,
      this.password,
      this.isActive,
      this.isDeleted,
      this.insertedDate,
      this.updateDate,
      this.sysUserId});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    userSurName = json['userSurName'];
    userUserName = json['userUserName'];
    password = json['password'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    insertedDate = json['insertedDate'];
    updateDate = json['updateDate'];
    sysUserId = json['sysUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['userSurName'] = this.userSurName;
    data['userUserName'] = this.userUserName;
    data['password'] = this.password;
    data['isActive'] = this.isActive;
    data['isDeleted'] = this.isDeleted;
    data['insertedDate'] = this.insertedDate;
    data['updateDate'] = this.updateDate;
    data['sysUserId'] = this.sysUserId;
    return data;
  }
}