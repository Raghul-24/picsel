class UserDetailResponse {
  final String? kind;
  final List<Users>? users;

  UserDetailResponse({
    this.kind,
    this.users,
  });

  UserDetailResponse.fromJson(Map<String, dynamic> json)
      : kind = json['kind'] as String?,
        users = (json['users'] as List?)?.map((dynamic e) => Users.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'kind' : kind,
    'users' : users?.map((e) => e.toJson()).toList()
  };
}

class Users {
  final String? localId;
  final String? email;
  final String? passwordHash;
  final bool? emailVerified;
  final int? passwordUpdatedAt;
  final List<ProviderUserInfo>? providerUserInfo;
  final String? validSince;
  final String? lastLoginAt;
  final String? createdAt;
  final String? lastRefreshAt;
  final int? statusCode;

  Users({
    this.localId,
    this.email,
    this.passwordHash,
    this.emailVerified,
    this.passwordUpdatedAt,
    this.providerUserInfo,
    this.validSince,
    this.lastLoginAt,
    this.createdAt,
    this.lastRefreshAt,
    this.statusCode
  });

  Users.fromJson(Map<String, dynamic> json)
      : localId = json['localId'] as String?,
        email = json['email'] as String?,
        passwordHash = json['passwordHash'] as String?,
        emailVerified = json['emailVerified'] as bool?,
        passwordUpdatedAt = json['passwordUpdatedAt'] as int?,
        providerUserInfo = (json['providerUserInfo'] as List?)?.map((dynamic e) => ProviderUserInfo.fromJson(e as Map<String,dynamic>)).toList(),
        validSince = json['validSince'] as String?,
        lastLoginAt = json['lastLoginAt'] as String?,
        createdAt = json['createdAt'] as String?,
        lastRefreshAt = json['lastRefreshAt'] as String?,
        statusCode = json['statusCode'] as int;

  Map<String, dynamic> toJson() => {
    'localId' : localId,
    'email' : email,
    'passwordHash' : passwordHash,
    'emailVerified' : emailVerified,
    'passwordUpdatedAt' : passwordUpdatedAt,
    'providerUserInfo' : providerUserInfo?.map((e) => e.toJson()).toList(),
    'validSince' : validSince,
    'lastLoginAt' : lastLoginAt,
    'createdAt' : createdAt,
    'lastRefreshAt' : lastRefreshAt,
    'statusCode' : statusCode
  };
}

class ProviderUserInfo {
  final String? providerId;
  final String? federatedId;
  final String? email;
  final String? rawId;

  ProviderUserInfo({
    this.providerId,
    this.federatedId,
    this.email,
    this.rawId,
  });

  ProviderUserInfo.fromJson(Map<String, dynamic> json)
      : providerId = json['providerId'] as String?,
        federatedId = json['federatedId'] as String?,
        email = json['email'] as String?,
        rawId = json['rawId'] as String?;

  Map<String, dynamic> toJson() => {
    'providerId' : providerId,
    'federatedId' : federatedId,
    'email' : email,
    'rawId' : rawId
  };
}