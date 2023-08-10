class BackgroundStyleTransferField {
  final String? level;
  final String? format;

  BackgroundStyleTransferField({
    this.level,
    this.format,
  });

  BackgroundStyleTransferField.fromJson(Map<String, dynamic> json)
      : level = json['level'] as String?,
        format = json['format'] as String?;

  Map<String, String>? toJson() => {
    'level' : level!,
    'format' : format!
  };
}