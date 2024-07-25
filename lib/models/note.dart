part of models;
///Note is a model for a musical note from chromatic scale
class Note {

  ///Note name in international naming convention
  final String name;

  ///Note name in others languages
  final List<Language> text;

  ///Audio file link
  final String linkAudioFile;

  ///Color or the note in hexadecimal
  final int colorCode;

  ///Range in the complete key
  final int position;

  ///Type of note (Tone or SemiTone)
  final String type;

  ///Text color
  final String textColor;

  ///Note name in international naming convention
  ///
  /// [DefaultValue] = true
  bool isActive;

  Note(
      {required this.name,
      required this.text,
      required this.linkAudioFile,
      required this.colorCode,
      required this.position,
      required this.type,
      required this.textColor,
      this.isActive = true});

  ///Static value, contains the notes available in the app
  static List<Note> NOTES = [
    Note(
        name: "C",
        text: [
          Language(code: "FR", traduction: "Do"),
          Language(code: "EN", traduction: "C"),
          Language(code: "ES", traduction: "C")
        ],
        linkAudioFile: "",
        colorCode: 0xffff0000,
        position: 0,
        type: "TONE",
        textColor: "WHITE"),
    Note(
        name: "C♯/D♭",
        text: [
          Language(code: "FR", traduction: "Do♯"),
          Language(code: "EN", traduction: "C♯"),
          Language(code: "ES", traduction: "C♯")
        ],
        linkAudioFile: "",
        colorCode: 0xffcf9bff,
        position: 1,
        type: "SEMI",
        textColor: "BLACK"),
    Note(
        name: "D",
        text: [
          Language(code: "FR", traduction: "Ré"),
          Language(code: "EN", traduction: "D"),
          Language(code: "ES", traduction: "D")
        ],
        linkAudioFile: "",
        colorCode: 0xffffff00,
        position: 2,
        type: "TONE",
        textColor: "BLACK"),
    Note(
        name: "D♯/E♭",
        text: [
          Language(code: "FR", traduction: "Ré♯"),
          Language(code: "EN", traduction: "D♯"),
          Language(code: "ES", traduction: "D♯")
        ],
        linkAudioFile: "",
        colorCode: 0xff65659a,
        position: 3,
        type: "SEMI",
        textColor: "WHITE"),
    Note(
        name: "E",
        text: [
          Language(code: "FR", traduction: "Mi"),
          Language(code: "EN", traduction: "E"),
          Language(code: "ES", traduction: "E")
        ],
        linkAudioFile: "",
        colorCode: 0xffe4fbff,
        position: 4,
        type: "TONE",
        textColor: "BLACK"),
    Note(
        name: "F",
        text: [
          Language(code: "FR", traduction: "Fa"),
          Language(code: "EN", traduction: "F"),
          Language(code: "ES", traduction: "F")
        ],
        linkAudioFile: "",
        colorCode: 0xffad1600,
        position: 5,
        type: "TONE",
        textColor: "WHITE"),
    Note(
        name: "F♯/G♭",
        text: [
          Language(code: "FR", traduction: "Fa♯"),
          Language(code: "EN", traduction: "F♯"),
          Language(code: "ES", traduction: "F♯")
        ],
        linkAudioFile: "",
        colorCode: 0xff00cdff,
        position: 6,
        type: "SEMI",
        textColor: "BLACK"),
    Note(
        name: "G",
        text: [
          Language(code: "FR", traduction: "Sol"),
          Language(code: "EN", traduction: "G"),
          Language(code: "ES", traduction: "G")
        ],
        linkAudioFile: "",
        colorCode: 0xffff6500,
        position: 7,
        type: "TONE",
        textColor: "BLACK"),
    Note(
        name: "G♯/A♭",
        text: [
          Language(code: "FR", traduction: "Sol♯"),
          Language(code: "EN", traduction: "G♯"),
          Language(code: "ES", traduction: "G♯")
        ],
        linkAudioFile: "",
        colorCode: 0xffff00ff,
        position: 8,
        type: "SEMI",
        textColor: "BLACK"),
    Note(
        name: "A",
        text: [
          Language(code: "FR", traduction: "La"),
          Language(code: "EN", traduction: "A"),
          Language(code: "ES", traduction: "A")
        ],
        linkAudioFile: "",
        colorCode: 0xff2fcd30,
        position: 9,
        type: "TONE",
        textColor: "WHITE"),
    Note(
        name: "A♯/B♭",
        text: [
          Language(code: "FR", traduction: "La♯"),
          Language(code: "EN", traduction: "A♯"),
          Language(code: "ES", traduction: "A♯")
        ],
        linkAudioFile: "",
        colorCode: 0xff8d8b8d,
        position: 10,
        type: "SEMI",
        textColor: "WHITE"),
    Note(
        name: "B",
        text: [
          Language(code: "FR", traduction: "Si"),
          Language(code: "EN", traduction: "B"),
          Language(code: "ES", traduction: "B")
        ],
        linkAudioFile: "",
        colorCode: 0xff0000fe,
        position: 11,
        type: "TONE",
        textColor: "WHITE"),
  ];
}
