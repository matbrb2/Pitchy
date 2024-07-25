part of game_module;

///VocalPitchPerfectTrainer is an alternative game mode
///
///The widget display a note (F# for example) and the user has to sing it to check if its pitch is correct
/// 
/// See also:
/// - [VocalPitchPerfectTrainerState], which manages the state of the vocal mode.
class VocalPitchPerfectTrainer extends StatefulWidget {
  const VocalPitchPerfectTrainer({
    Key? key,
  }) : super(key: key);

  @override
  State<VocalPitchPerfectTrainer> createState() =>
      VocalPitchPerfectTrainerState();
}

/// State class for [VocalPitchPerfectTrainer].
class VocalPitchPerfectTrainerState extends State<VocalPitchPerfectTrainer> {

  ///Init FlutterAudioCapture to record audio from user
  final _audioRecorder = FlutterAudioCapture();

  ///Init PitchDetector
  final pitchDetectorDart = PitchDetector(44100, 2000);

  ///Init PitchHandler
  final pitchupDart = PitchHandler(InstrumentType.guitar);

  ///Note sang by the user
  var note = "";

  ///True if user mic is opened
  var micOn = false;
  
  ///Label to display
  var status = "Click on start";

  initState() {
    super.initState();
    _audioRecorder.init();
  }

  ///Start Game staring the audio capture
  startGame() {
    //GameService().start();
    _startCapture();
  }

  ///Stop Game stoping the audio capture
  stopGame() {
    //GameService().start();
    _stopCapture();
  }

  Future<void> _startCapture() async {
    micOn = true;
    await _audioRecorder.start(listener, onError,
        sampleRate: 44100, bufferSize: 3000);

    setState(() {
      note = "";
      status = "Play something";
    });
  }

  Future<void> _stopCapture() async {
    micOn = false;
    await _audioRecorder.stop();

    setState(() {
      note = "";
      status = "Click on start";
    });
  }

  void listener(dynamic obj) {
    print("listener");
    //Gets the audio sample
    var buffer = Float64List.fromList(obj.cast<double>());
    final List<double> audioSample = buffer.toList();

    //Uses pitch_detector_dart library to detect a pitch from the audio sample
    final result = pitchDetectorDart.getPitch(audioSample);

    //If there is a pitch - evaluate it
    if (result.pitched) {
      //Uses the pitchupDart library to check a given pitch for a Guitar
      final handledPitchResult = pitchupDart.handlePitch(result.pitch);

      //Updates the state with the result
      setState(() {
        note = handledPitchResult.note;
        status = handledPitchResult.tuningStatus.toString();
      });
    }
  }

  void onError(Object e) {
    print(e);
    print("error");
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GameService>(context, listen: true);
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
        decoration: BoxDecoration(
            color: Provider.of<SettingsService>(context, listen: true)
                    .getColorMode()
                ? (provider.currentNote != null
                    ? Color(provider.currentNote!.colorCode)
                    : Colors.white)
                : Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child:  Text(
               TranslationService().getTranslation("SING_NOTE"),
                style:const TextStyle(fontSize: 20),
              ),
            ),
            Text(
              note,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              status,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              child: Center(
                child: Text(
                  provider.currentNote!.text
                      .singleWhere((element) =>
                          element.code == SettingsService().getLanguageCode())
                      .traduction,
                  style: const TextStyle(fontSize: 170),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [getStartButton(), getStopButton()],
            ),
            micOn ? ShazamCircleAnimation() : Container()
          ],
        ));
  }

  Widget getStartButton() {
    return TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () async => {startGame()},
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            TranslationService().getTranslation("START_GAME"),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
        ));
  }

  Widget getStopButton() {
    return TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () async => {stopGame()},
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            TranslationService().getTranslation("STOP_GAME"),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
        ));
  }
}
