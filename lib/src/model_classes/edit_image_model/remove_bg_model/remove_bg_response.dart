class PicsArtSuccessResponse {
  final String? status;
  final Data? data;

  PicsArtSuccessResponse({
    this.status,
    this.data,
  });

  PicsArtSuccessResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.toJson()
  };
}

class Data {
  final String? id;
  final String? url;

  Data({
    this.id,
    this.url,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'url' : url
  };
}