part of services;

///SettingsService contains methods to configure the application
class SettingsService with ChangeNotifier {
  static final SettingsService _instance = SettingsService._internal();

  ///User preferences are stored inside this object
  final SettingsData settings = SettingsData();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory SettingsService() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  SettingsService._internal() {}

  ///Set (configure) color mode
  setColorMode(bool value) {
    settings.colorMode = value;
    notifyListeners();
  }

  ///Get color mode enabled or not
  bool getColorMode() {
    return settings.colorMode;
  }

  ///Set (configure) multiple try
  setMultipleTry(bool value) {
    settings.multipleTryMode = value;
    notifyListeners();
  }

  ///Get multiple try enabled or not
  bool getMultipleTry() {
    return settings.multipleTryMode;
  }

  ///Set game mode
  setGameMode(bool value) {
    settings.handsFreeMode = value;
    notifyListeners();
  }

  ///Get game mode
  bool getGameMode() {
    return settings.handsFreeMode;
  }

  ///Get selected notes list
  List<bool> getSelectedNotes() {
    return settings.selectedNotes;
  }

  ///Set selected notes
  void setSelectedNotes(int index) {
    settings.selectedNotes[index] = !settings.selectedNotes[index];
    GameService().setAvailableNotes(settings.selectedNotes);
    notifyListeners();
  }

  ///Get selected instrument list
  List<bool> getSelectedInstruments() {
    return settings.selectedInstrument;
  }

  ///Set instrument selected
  void setSelectedInstruments(int index) {
    settings.selectedInstrument[index] = !settings.selectedInstrument[index];
    GameService().setAvailableInstruments(settings.selectedInstrument);
    notifyListeners();
  }

  ///Get language used in the app
  List<bool> getLanguage() {
    return settings.selectedLanguage;
  }

  ///Returns language code
  String getLanguageCode() {
    return LangCode.LANG
        .singleWhere((element) => element.isActive == true)
        .code;
  }

  ///Set global language
  void setLanguage(int index) {
    print('setLanguage');
    settings.selectedLanguage.forEachIndexed((i, element) {
      print(i.toString() + ':' + LangCode.LANG[i].tag);
      settings.selectedLanguage[i] = false;
      LangCode.LANG[i].isActive = false;
    });
    settings.selectedLanguage[index] = true;
    LangCode.LANG[index].isActive = true;
    inspect(settings.selectedLanguage);
    inspect(LangCode.LANG);
    notifyListeners();
  }
}
