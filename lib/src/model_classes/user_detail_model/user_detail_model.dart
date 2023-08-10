class UserDetailModel {
  final String? idToken;

  UserDetailModel({
    this.idToken,
  });

  UserDetailModel.fromJson(Map<String, dynamic> json)
      : idToken = json['idToken'] as String?;

  Map<String, dynamic> toJson() => {
    'idToken' : idToken
  };
}