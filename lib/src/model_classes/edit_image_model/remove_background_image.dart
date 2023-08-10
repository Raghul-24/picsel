class BackgroundRemoveField {
  final String? outputType;
  final String? bgBlur;
  final String? scale;
  final String? format;

  BackgroundRemoveField({
    this.outputType,
    this.bgBlur,
    this.scale,
    this.format,
  });

  BackgroundRemoveField.fromJson(Map<String, dynamic> json)
      : outputType = json['output_type'] as String?,
        bgBlur = json['bg_blur'] as String?,
        scale = json['scale'] as String?,
        format = json['format'] as String?;

  Map<String, String>? toJson() => {
    'output_type' : outputType!,
    'bg_blur' : bgBlur!,
    'scale' : scale!,
    'format' : format!
  };
}