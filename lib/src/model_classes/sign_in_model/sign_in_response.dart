class SignInResponse {
  final String? kind;
  final String? localId;
  final String? email;
  final String? displayName;
  final String? idToken;
  final bool? registered;
  final String? refreshToken;
  final String? expiresIn;

  SignInResponse({
    this.kind,
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
    this.refreshToken,
    this.expiresIn,
  });

  SignInResponse.fromJson(Map<String, dynamic> json)
      : kind = json['kind'] as String?,
        localId = json['localId'] as String?,
        email = json['email'] as String?,
        displayName = json['displayName'] as String?,
        idToken = json['idToken'] as String?,
        registered = json['registered'] as bool?,
        refreshToken = json['refreshToken'] as String?,
        expiresIn = json['expiresIn'] as String?;

  Map<String, dynamic> toJson() => {
    'kind' : kind,
    'localId' : localId,
    'email' : email,
    'displayName' : displayName,
    'idToken' : idToken,
    'registered' : registered,
    'refreshToken' : refreshToken,
    'expiresIn' : expiresIn
  };
}