part of game_module;

///PitchPerfectTrainer is the default game mode
///
///This game mode plays a song and display the Piano widget so the user can choose the note previously heard. 
/// See also:
/// - [PitchPerfectTrainerState], which manages the state of the game UI.
class PitchPerfectTrainer extends StatefulWidget {
  const PitchPerfectTrainer({Key? key}) : super(key: key);

  @override
  State<PitchPerfectTrainer> createState() => PitchPerfectTrainerState();
}

/// State class for [PitchPerfectTrainer].
class PitchPerfectTrainerState extends State<PitchPerfectTrainer> {

  ///Return Text Widget with correct label according to the user answer
  Widget getTextLabel(GameService provider) {
    return provider.clickedNotes.length > 0
        ? SettingsService().getMultipleTry()
            ? provider.isGoodAnswer
                ? Text(provider.currentNote!.text
                        .singleWhere((element) =>
                            element.code == SettingsService().getLanguageCode())
                        .traduction +
                    TranslationService().getTranslation("GOOD_ANSWER_SENTENCE"))
                : Text(provider.currentNote!.text
                        .singleWhere((element) =>
                            element.code == SettingsService().getLanguageCode())
                        .traduction +
                    TranslationService().getTranslation("IS_A_WRONG_ANSWER"))
            : provider.isGoodAnswer
                ? Text(provider.currentNote!.text
                        .singleWhere((element) =>
                            element.code == SettingsService().getLanguageCode())
                        .traduction +
                    TranslationService().getTranslation("GOOD_ANSWER_SENTENCE"))
                : Text(provider.currentNote!.text
                        .singleWhere((element) =>
                            element.code == SettingsService().getLanguageCode())
                        .traduction +
                    TranslationService()
                        .getTranslation("WRONG_ANSWER_SENTENCE"))
        :  Text(
               TranslationService().getTranslation("CHOOSE_NOTE"));
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<GameService>(context, listen: true);

    var media = MediaQuery.of(context);

    return Container(
        decoration: BoxDecoration(
            color: Provider.of<SettingsService>(context, listen: true)
                    .getColorMode()
                ? (provider.currentNote != null
                    ? Color(provider.currentNote!.colorCode)
                    : Colors.white)
                : Colors.white),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 75),
                child: Image.asset(
                  "assets/images/key.png",
                  height: 150,
                ),
              ),
              getTextLabel(provider),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:
                            !Provider.of<GameService>(context, listen: true)
                                    .isGameRunning
                                ? [getStartButton()]
                                : (provider.isFirstAnswerDone == true
                                    ? [getPlayAgainButton(), getNextButton()]
                                    : [getPlayAgainButton()]),
                      ),
                    ),
                    const Piano()
                  ],
                ),
              ),
            ]));
  }

  Widget getStartButton() {
    return TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () async => {GameService().start()},
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            TranslationService().getTranslation("START_GAME"),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
        ));
  }

  Widget getPlayAgainButton() {
    return TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () async => {await GameService().play()},
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            TranslationService().getTranslation("PLAY_AGAIN"),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
        ));
  }

  Widget getNextButton() {
    return TextButton(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () => {GameService().next()},
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            TranslationService().getTranslation("NEXT"),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ));
  }
}
