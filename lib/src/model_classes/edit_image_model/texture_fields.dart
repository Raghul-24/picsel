class BackgroundTextureField {
  final String? format;
  final String? width;
  final String? height;
  final String? offsetX;
  final String? offsetY;
  final String? pattern;
  final String? rotate;
  final String? scale;

  BackgroundTextureField({
    this.format,
    this.width,
    this.height,
    this.offsetX,
    this.offsetY,
    this.pattern,
    this.rotate,
    this.scale,
  });

  Map<String, String>? toJson() => {
    'format' : format!,
    'width' : width!,
    'height' : height!,
    'offset_x' : offsetX!,
    'offset_y' : offsetY!,
    'pattern' : pattern!,
    'rotate' : rotate!,
    'scale' : scale!
  };
}