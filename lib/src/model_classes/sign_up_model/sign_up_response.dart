class SignUpResponse {
  final String? kind;
  final String? idToken;
  final String? email;
  final String? refreshToken;
  final String? expiresIn;
  final String? localId;

  SignUpResponse({
    this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  SignUpResponse.fromJson(Map<String, dynamic> json)
      : kind = json['kind'] as String?,
        idToken = json['idToken'] as String?,
        email = json['email'] as String?,
        refreshToken = json['refreshToken'] as String?,
        expiresIn = json['expiresIn'] as String?,
        localId = json['localId'] as String?;

  Map<String, dynamic> toJson() => {
    'kind' : kind,
    'idToken' : idToken,
    'email' : email,
    'refreshToken' : refreshToken,
    'expiresIn' : expiresIn,
    'localId' : localId
  };
}