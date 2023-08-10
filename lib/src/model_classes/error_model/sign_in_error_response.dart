class SignInErrorResponse {
  final Error? error;

  SignInErrorResponse({
    this.error,
  });

  SignInErrorResponse.fromJson(Map<String, dynamic> json)
      : error = (json['error'] as Map<String,dynamic>?) != null ? Error.fromJson(json['error'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'error' : error?.toJson()
  };
}

class Error {
  final int? code;
  final String? message;
  final List<Errors>? errors;

  Error({
    this.code,
    this.message,
    this.errors,
  });

  Error.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?,
        errors = (json['errors'] as List?)?.map((dynamic e) => Errors.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'code' : code,
    'message' : message,
    'errors' : errors?.map((e) => e.toJson()).toList()
  };
}

class Errors {
  final String? message;
  final String? domain;
  final String? reason;

  Errors({
    this.message,
    this.domain,
    this.reason,
  });

  Errors.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        domain = json['domain'] as String?,
        reason = json['reason'] as String?;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'domain' : domain,
    'reason' : reason
  };
}