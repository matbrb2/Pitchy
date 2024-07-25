part of models;

///SettingsData is an object model that contains user preferences
class SettingsData {
  ///true if the player plays without hand
  bool handsFreeMode;
  ///true if the player wants colored note to help him
  bool colorMode;
  ///true if the player pwants multiple attemps
  bool multipleTryMode = false;
  ///Selected notes
  List<bool> selectedNotes = List.filled(12, true);
  ///Selected instruments
  List<bool> selectedInstrument = List.filled(10, true);
  ///Selected languages
  List<bool> selectedLanguage = [true, false, false];

  SettingsData({this.colorMode = false, this.handsFreeMode = false});
}
