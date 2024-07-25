part of services;

///GameService contains methods for controlling the Game
///From this service, you should be able to run the game from his start to his end
class GameService with ChangeNotifier {
  static final GameService _instance = GameService._internal();
  static final AudioPlayer player = AudioPlayer();

  ///Color of the note (hexadecimal)
  static int color = 0xFF00FFFF;

  ///True if user is playong
  bool isGameRunning = false;

  ///True if user already answer once
  bool isFirstAnswerDone = false;

  ///True if player got good answer
  bool isGoodAnswer = false;

  ///Current note to guess/sing
  Note? currentNote;

  ///Selected instrument to play
  Instrument? currentInstrument;

  ///Note selected by the user
  Note? userChoice;

  ///Available notes in game
  late List<Note> availableNotes;

  ///Clicked notes during round of the game
  List<Note> clickedNotes = List<Note>.empty(growable: true);

  ///Available instruments in game
  late List<Instrument> availableInstruments;

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory GameService() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  GameService._internal() {
    availableNotes = Note.NOTES;
    availableInstruments = Instrument.INSTRUMENTS;

    getRandomNote();
  }

  ///Select random note in the enabled note list
  void getRandomNote() {
    var filteredNotes =
        availableNotes.where((element) => element.isActive).toList();
    var filteredInstruments =
        availableInstruments.where((element) => element.isActive).toList();

    var i = filteredNotes.length;
    var random = Random();
    currentNote = filteredNotes[random.nextInt(i)];
    i = filteredInstruments.length;
    currentInstrument = filteredInstruments[random.nextInt(i)];
  }


  ///Init the game
  void start() {
    isGameRunning = true;
    notifyListeners();
    play();
  }

  ///Action to perform when user hit "play" button
  Future<void> play() async {
    String sourceUrl = "audio/notes/1/" +
        currentInstrument!.code +
        "/" +
        currentInstrument!.code +
        "_" +
        currentNote!.position.toString() +
        ".wav";
    await player.play(AssetSource(sourceUrl));
  }

  ///Action to perform when user hit "next" button at the end of the round
  void next([bool playNote = true]) {
    clickedNotes = [];
    getRandomNote();
    isFirstAnswerDone = false;
    isGoodAnswer = false;
    userChoice = null;
    notifyListeners();
    if (playNote) {
      play();
    }
  }

  ///Action to perform when user click tile
  clickTile(int position) {
    print(position);
    var len = clickedNotes.length;
    if (clickedNotes.where((element) => element.position == position).length ==
        0) {
      if (!(!SettingsService().getMultipleTry() && clickedNotes.length > 0)) {
        clickedNotes.add(availableNotes
            .singleWhere((element) => element.position == position));
      }
    } else {
      print("already clicked");
    }

    if (!isFirstAnswerDone) {
      if (currentNote?.position == position) {
        userChoice = availableNotes[position];
        isGoodAnswer = true;
      }
    }

    isFirstAnswerDone = true;

    notifyListeners();
  }

  ///Set notes to play with
  setAvailableNotes(List<bool> notes) {
    availableNotes.forEachIndexed((index, element) {
      element.isActive = notes[index];
    });
    next(false);
  }

  ///Set instrument to play with
  setAvailableInstruments(List<bool> instruments) {
    availableInstruments.forEachIndexed((index, element) {
      element.isActive = instruments[index];
    });
    next(false);
  }

  ///return game color
  getColor() {
    return color;
  }
}
