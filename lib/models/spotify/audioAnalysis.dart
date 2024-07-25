part of spotify_models;

/// Represents the audio analysis of a Spotify track.
class AudioAnalysis {
  final double duration;

  /// Duration of the track in seconds

  /// Tempo of the track in beats per minute (BPM)
  final double tempo;

  /// Musical key of the track
  final Note? key;
  final bool isMajor;

  AudioAnalysis({
    required this.duration,
    required this.tempo,
    required this.key,
    required this.isMajor
  });

  factory AudioAnalysis.fromJson(Map<String, dynamic> json) {
    final track = json['track'] as Map<String, dynamic>;
    return AudioAnalysis(
      duration: track['duration'].toDouble() ?? 0.0,
      tempo: track['tempo'].toDouble() ?? 0.0,
      key: track['key'] !=null? Note.NOTES[track['key']] :null,
      isMajor: track['mode']==1 ? true:false
    );
  }
}
