class SavedImagesResponse {
  final String? id;
  final List<dynamic>? images;

  SavedImagesResponse({
    this.id,
    this.images
  });

}

class ClassName {
  final String? images;

  ClassName({
    this.images,
  });

  ClassName.fromJson(Map<String, dynamic> json)
      : images = json['images'] as String?;

  Map<String, dynamic> toJson() => {
    'images' : images
  };
}
