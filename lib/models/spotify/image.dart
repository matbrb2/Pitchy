part of spotify_models;

/// Represents an image associated with an album in Spotify.
class ImageCover {
  /// The height of the image in pixels.
  final int height;

  /// The width of the image in pixels.
  final int width;

  /// The URL of the image.
  final String url;

  /// Creates an [ImageCover] instance with the given properties.
  ImageCover({
    required this.height,
    required this.width,
    required this.url,
  });

  /// Creates an [ImageCover] instance from a JSON object.
  factory ImageCover.fromJson(Map<String, dynamic> json) {
    return ImageCover(
      height: json['height'] ?? 0,  // Default value if null
      width: json['width'] ?? 0,  // Default value if null
      url: json['url'] ?? '',  // Default value if null
    );
  
  }
}
