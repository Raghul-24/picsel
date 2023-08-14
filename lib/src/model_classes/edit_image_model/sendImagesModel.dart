class SendImagesModel {
  final List<String>? images;

  SendImagesModel({
    this.images,
  });

  SendImagesModel.fromJson(Map<String, dynamic> json)
      : images = (json['images'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'images' : images
  };
}