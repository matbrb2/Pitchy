part of spotify_models;

/// Represents an album in Spotify.
class Album {
  /// The name of the album.
  final String name;

  /// The Spotify ID of the album.
  final String id;

  /// The Spotify URI of the album.
  final String uri;

  /// The Spotify API endpoint for the album.
  final String href;

  /// The list of images associated with the album.
  final List<ImageCover> images;

  /// Creates an [Album] instance with the given properties.
  Album({
    required this.name,
    required this.id,
    required this.uri,
    required this.href,
    required this.images,
  });

  /// Creates an [Album] instance from a JSON object.
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'] ?? 'Unknown Album',  // Default value if null
      id: json['id'] ?? 'Unknown ID',  // Default value if null
      uri: json['uri'] ?? 'Unknown URI',  // Default value if null
      href: json['href'] ?? 'Unknown Href',  // Default value if null
      images: List<ImageCover>.from(json['images'].map((image) => ImageCover.fromJson(image))),
    );
  }
}
