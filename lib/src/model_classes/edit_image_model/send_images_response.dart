class SendImagesResponse {
  final String? name;

  SendImagesResponse({
    this.name,
  });

  SendImagesResponse.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name
  };
}