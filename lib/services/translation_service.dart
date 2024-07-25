part of services;

///TranslationService contains methods for fetching translations in the assets
class TranslationService {
  static final TranslationService _instance = TranslationService._internal();
  ///Load user preferences
  final SettingsData settings = SettingsData();
  ///List containing all the translations once the app loaded them
  static List<Translation> translations = [];

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory TranslationService() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  TranslationService._internal() {}


  ///Load translations when the app is launched
  Future<void> loadTranslation() async {
    final String response =
        await rootBundle.loadString('assets/translation/translation.json');
    //print(response);
    var data = json.decode(response);
    var rest = data["DATA"] as List;
    translations =
        rest.map<Translation>((json) => Translation.fromJson(json)).toList();
  }

  ///Fetch a translation according to its tag
  String getTranslation(String tag) {
    return translations
        .singleWhere((e) => e.tag == tag)
        .translations
        .singleWhere((element) =>
            element.code ==
            LangCode.LANG
                .singleWhere((element) => element.isActive == true)
                .code)
        .traduction;
    
  }
}
