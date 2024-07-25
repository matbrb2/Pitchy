part of spotify_models;

/// Represents an artist in Spotify.
class Artist {
  /// The name of the artist.
  final String name;

  /// The Spotify ID of the artist.
  final String id;

  /// The Spotify URI of the artist.
  final String uri;

  /// The Spotify API endpoint for the artist.
  final String href;

  /// Creates an [Artist] instance with the given properties.
  Artist({
    required this.name,
    required this.id,
    required this.uri,
    required this.href,
  });

  /// Creates an [Artist] instance from a JSON object.
  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'] ?? 'Unknown Artist',  // Default value if null
      id: json['id'] ?? 'Unknown ID',  // Default value if null
      uri: json['uri'] ?? 'Unknown URI',  // Default value if null
      href: json['href'] ?? 'Unknown Href',  // Default value if null
    );
  }
}
