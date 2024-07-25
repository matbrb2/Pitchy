part of services;

///SpotifyService contains methods to configure the application
class SpotifyService {
  ///Spotify Client ID for APP Pitchy
  static const _CLIENT_ID = "7cb4c57fcad04fe9b6b545512e6a6e71";

  ///Spotify Secret Client ID for APP Pitchy
  static const _CLIENT_SECRET = "13adb47afe994490b3b828d4672e5784";

  String accessToken = "";

  Future<String> fetchSpotifyToken() async {
    final String url = 'https://accounts.spotify.com/api/token';
    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final Map<String, String> body = {
      'grant_type': 'client_credentials',
      'client_id': _CLIENT_ID,
      'client_secret': _CLIENT_SECRET,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['access_token'];
    } else {
      throw Exception('Failed to fetch token');
    }
  }

  Future<List<Track>> getPitch({required List<Track> list}) async {
    print("FETCH PITCH");

  final futures = list.map((element) async {
      String url = 'https://api.spotify.com/v1/audio-analysis/${element.id}';
      final Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
      };

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("PITCH FOR ${element.name}");

        element.audioAnalysis = AudioAnalysis.fromJson(jsonResponse);
        print("PITCH FOR ${element.name} = ${element.audioAnalysis!.key!.name}");
      } else {
        throw Exception('Failed to fetch audio analysis');
      }
    });

     await Future.wait(futures);
    print("RETURN PITCH");
    return list;
  }

  Future<List<Track>> search({required String keyword}) async {
    accessToken = await fetchSpotifyToken();

    print(accessToken);
    const String url = 'https://api.spotify.com/v1/search';
    final Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
    };
    final Map<String, String> queryParams = {
      'q': keyword,
      'type': 'track',
      'limit': '20',
      'market': 'FR',
    };
    final Uri uri = Uri.parse(url).replace(queryParameters: queryParams);

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      final List<dynamic> trackJsonList = jsonResponse['tracks']['items'];
      List<Track> list =
          trackJsonList.map((json) => Track.fromJson(json)).toList();
      list = await getPitch(list: list);
      inspect(list);
      return list;
    } else {
      throw Exception('Failed to search tracks');
    }
  }
}
