part of models;
///Instrument is an object model for a music instrument
class Instrument {
  ///Name of the instrument
  final String name;

  ///Translation of the instrument name
  final List<Language> text;

  ///Code/Short name of the instrument
  final String code;

  /// True if the instrument is enabled by the user
  /// 
  /// [DefaultValue] = true
  bool isActive;

  Instrument(
      {required this.name,
      required this.text,
      required this.code,
      this.isActive = true});


  ///Static value, contains the instrument available in the app
  static List<Instrument> INSTRUMENTS = [
    Instrument(
        name: "Alarm",
        text: [
          Language(code: "FR", traduction: "Alarme"),
          Language(code: "US", traduction: "Alarm")
        ],
        code: "alarm"),
    Instrument(
        name: "Bass",
        text: [
          Language(code: "FR", traduction: "Basse"),
          Language(code: "US", traduction: "Bass")
        ],
        code: "bass"),
    Instrument(
        name: "Bell",
        text: [
          Language(code: "FR", traduction: "Cloche"),
          Language(code: "US", traduction: "Bell")
        ],
        code: "bell"),
    Instrument(
        name: "Flute",
        text: [
          Language(code: "FR", traduction: "Flûte"),
          Language(code: "US", traduction: "Flute")
        ],
        code: "flute"),
    Instrument(
        name: "Guitar",
        text: [
          Language(code: "FR", traduction: "Guitare"),
          Language(code: "US", traduction: "Guitar")
        ],
        code: "guitar"),
    Instrument(
        name: "Kalimba",
        text: [
          Language(code: "FR", traduction: "Kalimba"),
          Language(code: "US", traduction: "Kalimba")
        ],
        code: "kalimba"),
    Instrument(
        name: "Laser",
        text: [
          Language(code: "FR", traduction: "Laser"),
          Language(code: "US", traduction: "Laser")
        ],
        code: "laser"),
    Instrument(
        name: "Organ",
        text: [
          Language(code: "FR", traduction: "Orgue"),
          Language(code: "US", traduction: "Organ")
        ],
        code: "organ"),
    Instrument(
        name: "Piano",
        text: [
          Language(code: "FR", traduction: "Piano"),
          Language(code: "US", traduction: "Piano")
        ],
        code: "piano"),
    Instrument(
        name: "Strings",
        text: [
          Language(code: "FR", traduction: "Violon"),
          Language(code: "US", traduction: "Strings")
        ],
        code: "string"),
  ];
}
