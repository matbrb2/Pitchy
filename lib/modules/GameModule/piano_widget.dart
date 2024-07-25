part of game_module;

///The Piano widget build a piano with 12 TileWidget
///
///This follows the Chromatic scalea set of twelve pitches (more completely, pitch classes) used in tonal music, with notes separated by the interval of a semitone
///
///Each tile represent a semi-tone
///
/// See also:
/// - [PianoState], which manages the state of the piano.
class Piano extends StatefulWidget {
  const Piano({Key? key}) : super(key: key);

  @override
  State<Piano> createState() => PianoState();
}

/// State class for [Piano].
class PianoState extends State<Piano> {

  ///Note selected by the user
  Note? selectedTile;

  ///Action to perform when user hit a tile
  void _refresh(Note note) {
    setState(() {
      selectedTile = note;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    ///settingsProvider bring the SettingsService with changeNotifier values
    var settingsProvider = Provider.of<SettingsService>(context, listen: true);

    ///gameProvider bring the GameService with changeNotifier values
    var gameProvider = Provider.of<GameService>(context, listen: true);

    return Container(
        width: media.size.width,
        child: gameProvider.isGameRunning
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 1),
                              onTap: _refresh),
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 3),
                              onTap: _refresh),
                        ],
                      ),
                      Row(
                        children: [
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 0),
                              onTap: _refresh),
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 2),
                              onTap: _refresh),
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 4),
                              onTap: _refresh),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 6),
                              onTap: _refresh),
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 8),
                              onTap: _refresh),
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 10),
                              onTap: _refresh),
                        ],
                      ),
                      Row(
                        children: [
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 5),
                              onTap: _refresh),
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 7),
                              onTap: _refresh),
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 9),
                              onTap: _refresh),
                          Tile(
                              note: Note.NOTES.singleWhere(
                                  (element) => element.position == 11),
                              onTap: _refresh),
                        ],
                      )
                    ],
                  )
                ],
              )
            : SizedBox(
                height: 110,
                child: Container(),
              ));
  }
}
