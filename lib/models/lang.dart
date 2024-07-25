part of models;
///Language is a model for a human language
class Language {
  ///ISO code of the language
  final String code;

  ///Name of the language
  final String traduction;

  Language({required this.code, required this.traduction});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(code: json["CODE"], traduction: json["TRADUCTION"]);
  }
}

///Language is a model for a human language iso code
class LangCode {
  ///ISO code of the language
  final String code;

  ///Tag/ShortName for the language
  final String tag;

  ///True if the language is enabled by the user
  bool isActive;

  LangCode({required this.code, required this.tag, required this.isActive});

  ///Static value, contains the languages available in the app
  static List<LangCode> LANG = [
    LangCode(code: "FR", tag: "FRENCH", isActive: true),
    LangCode(code: "EN", tag: "ENGLISH", isActive: false),
    LangCode(code: "ES", tag: "SPANISH", isActive: false),
  ];
}
