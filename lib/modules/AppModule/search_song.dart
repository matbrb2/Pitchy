part of app_module;

class TrackListScreen extends StatefulWidget {
  const TrackListScreen({Key? key}) : super(key: key);

  @override
  _TrackListScreenState createState() => _TrackListScreenState();
}

class _TrackListScreenState extends State<TrackListScreen> {
  List<Track>? _tracks;
  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();

  Future<void> _fetchTracks(String keyword) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final tracks = await SpotifyService().search(keyword: keyword);
      setState(() {
        _tracks = tracks;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  controller: _searchController,
                  placeholder: 'Enter keyword',
                ),
              ),
              const SizedBox(width: 8.0),
              CupertinoButton(
                onPressed: () {
                  _fetchTracks(_searchController.text);
                },
                child: const Text('Search'),
              ),
            ],
          ),
        ),
        Expanded(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : _tracks == null || _tracks!.isEmpty
                  ? Center(child: Text('No tracks found'))
                  : ListView.builder(
                      itemCount: _tracks!.length,
                      itemBuilder: (context, index) {
                        final track = _tracks![index];
                        return ListTile(
                          leading: track.album.images.isNotEmpty
                              ? Image.network(track.album.images[0].url,
                                  width: 50, height: 50)
                              : null,
                          title: Text(track.name),
                          subtitle: Text(track.artists
                              .map((artist) => artist.name)
                              .join(', ')),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                track.audioAnalysis != null
                                    ? track.audioAnalysis!.key!.text.singleWhere((element) => element.code == SettingsService().getLanguageCode()).traduction
                                    : "",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                track.audioAnalysis != null
                                    ? track.audioAnalysis!.isMajor ? "Major":"Minor"
                                    : "",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}
