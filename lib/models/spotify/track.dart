part of spotify_models;

/// Represents a track in Spotify.
class Track {
  /// The name of the track.
  final String name;

  /// The URL to a preview of the track.
  final String? previewUrl;

  /// The list of artists who performed the track.
  final List<Artist> artists;

  /// The album in which the track is included.
  final Album album;

  /// The duration of the track in milliseconds.
  final int durationMs;

  /// The popularity of the track (0-100).
  final int popularity;

  /// The Spotify ID of the track.
  final String id;

  /// Indicates if the track is playable.
  final bool isPlayable;

  /// Indicates if the track is playable.
   AudioAnalysis? audioAnalysis;

  /// Creates a [Track] instance with the given properties.
  Track({
    required this.name,
    this.previewUrl,
    required this.artists,
    required this.album,
    required this.durationMs,
    required this.popularity,
    required this.id,
    required this.isPlayable,
    this.audioAnalysis
  });

 factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      name: json['name'] ?? 'Unknown Name',  // Default value if null
      previewUrl: json['preview_url'],  // Allow null values
      artists: List<Artist>.from(json['artists'].map((artist) => Artist.fromJson(artist))),
      album: Album.fromJson(json['album']),
      durationMs: json['duration_ms'] ?? 0,  // Default value if null
      popularity: json['popularity'] ?? 0,  // Default value if null
      id: json['id'] ?? 'Unknown ID',  // Default value if null
      isPlayable: json['is_playable'] ?? false,  // Default value if null
    );
  }
}
