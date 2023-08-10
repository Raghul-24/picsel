class SignInModel {
  final String? email;
  final String? password;
  final bool? returnSecureToken;

  SignInModel({
    this.email,
    this.password,
    this.returnSecureToken,
  });

  SignInModel.fromJson(Map<String, dynamic> json)
      : email = json['email'] as String?,
        password = json['password'] as String?,
        returnSecureToken = json['returnSecureToken'] as bool?;

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password,
    'returnSecureToken' : returnSecureToken
  };
}