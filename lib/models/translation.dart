part of models;

///Translation is an object model which contains multiple value on different languages for an unique tag
class Translation {
  ///Unique tag (name of the translation)
  final String tag;
  ///Values of translations
  final List<Language> translations;

  Translation({required this.tag, required this.translations});

  factory Translation.fromJson(Map<String, dynamic> json) {
    List<Language> translations = List<Language>.from(
        json["TRANSLATIONS"].map((model) => Language.fromJson(model)));
    return Translation(tag: json["TAG"], translations: translations);
  }
}
