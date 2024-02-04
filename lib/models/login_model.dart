class LoginModel {
  String? userName;
  String? password;
  String? token;

  LoginModel({this.userName, this.password, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    password = json['Password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['token'] = this.token;
    return data;
  }
}