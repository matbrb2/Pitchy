part of settings_module;

///SettingsWidget is the main component for displaying settings UI.
/// 
/// See also:
/// - [SettingsState], which manages the state of the settings UI.
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => SettingsState();
}

/// State class for [Settings].
class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var settingsProvider = Provider.of<SettingsService>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Toggle(
          title: TranslationService().getTranslation("COLOR_MODE"),
          color: Colors.white,
          description:
              TranslationService().getTranslation("SETTINGS_DISPLAY_COLOR"),
          onTap: (value) {
            SettingsService().setColorMode(value);
          },
          defaultValue: settingsProvider.getColorMode(),
        ),
        const DividerWidget(),
        Toggle(
          title: TranslationService().getTranslation("MULTI_TRY_MODE"),
          color: Colors.white,
          description:
              TranslationService().getTranslation("SETTINGS_MULTI_TRY_MODE"),
          onTap: (value) {
            SettingsService().setMultipleTry(value);
          },
          defaultValue: settingsProvider.getMultipleTry(),
        ),
        const DividerWidget(),
        Toggle(
          title: TranslationService().getTranslation("VOCAL_MODE"),
          color: Colors.white,
          description:
              TranslationService().getTranslation("SETTINGS_VOCAL_MODE"),
          onTap: (value) {
            SettingsService().setGameMode(value);
          },
          defaultValue: settingsProvider.getGameMode(),
        ),
        const DividerWidget(),
        const Text(
          "Select notes to play",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 5),
        ToggleButtons(
          direction: Axis.horizontal,
          onPressed: (int index) {
            // All buttons are selectable.
            setState(() {
              SettingsService().setSelectedNotes(index);
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.green[700],
          selectedColor: Colors.white,
          fillColor: Colors.green[200],
          color: Colors.green[400],
          constraints: BoxConstraints(
            minHeight: 40.0,
            minWidth: ((media.size.width - (Note.NOTES.length + 1)) - 40) /
                Note.NOTES.length,
          ),
          isSelected: settingsProvider.getSelectedNotes(),
          children: Note.NOTES
              .map((e) => Text(
                    e.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.white),
                  ))
              .toList(),
        ),
        const DividerWidget(),
        const Text(
          "Select instruments to play",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 5),
        ToggleButtons(
          direction: Axis.horizontal,
          onPressed: (int index) {
            // All buttons are selectable.
            setState(() {
              SettingsService().setSelectedInstruments(index);
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.green[700],
          selectedColor: Colors.white,
          fillColor: Colors.green[200],
          color: Colors.green[400],
          constraints: BoxConstraints(
            minHeight: 40.0,
            minWidth:
                ((media.size.width - (Instrument.INSTRUMENTS.length + 1)) -
                        44) /
                    Instrument.INSTRUMENTS.length,
          ),
          isSelected: settingsProvider.getSelectedInstruments(),
          children: Instrument.INSTRUMENTS
              .map((e) => Text(
                    e.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.white),
                  ))
              .toList(),
        ),
        const DividerWidget(),
        const Text(
          "Select application language",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 5),
        ToggleButtons(
          direction: Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              SettingsService().setLanguage(index);
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.red[700],
          selectedColor: Colors.white,
          fillColor: Colors.red[200],
          color: Colors.red[400],
          constraints: BoxConstraints(
            minHeight: 40.0,
            minWidth: ((media.size.width - (LangCode.LANG.length + 1)) - 40) /
                LangCode.LANG.length,
          ),
          isSelected: settingsProvider.getLanguage(),
          children: LangCode.LANG
              .map((e) => Text(
                    TranslationService().getTranslation(e.tag),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.white),
                  ))
              .toList(),
        ),
        Expanded(child: Container()),
        const SizedBox(
            child: Center(
          child: Text('Version 0.0, beta 1',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12)),
        )),
        Container(
          height: 20,
        )
      ],
    );
  }
}
