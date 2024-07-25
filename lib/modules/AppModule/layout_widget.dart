part of app_module;

///Layout is the main component that integrates all the widgets together to build the UI
/// 
/// See also:
/// - [LayoutState], which manages the state of the layout.
class Layout extends StatefulWidget {
  ///Title of the screen
  final String title;

  ///True if the background color changes with the note
  final bool dynamicHeaderColor;

  ///Background color of the header (hexadecimal)
  final Color headerBackgroundColor;

  ///Color of the header (hexadecimal)
  final Color backgroundColor;

  ///Margin around the child widget
  final bool margin;

  ///Text/Button color
  final Color color;

  ///Child widget to display inside layout
  final Widget child;

  ///Display navigation button
  final bool navOptions;

  const Layout(
      {Key? key,
      required this.child,
      required this.title,
      this.navOptions = false,
      this.backgroundColor = Colors.white,
      this.dynamicHeaderColor = false,
      this.headerBackgroundColor = Colors.white,
      this.margin = true,
      this.color = Colors.black})
      : super(key: key);

  @override
  State<Layout> createState() => LayoutState();
}

/// State class for [Layout].
class LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    ///gameProvider bring the GameService with changeNotifier values
    var gameProvider = Provider.of<GameService>(context, listen: true);
    ///settingsProvider bring the SettingsService with changeNotifier values
    var settingsProvider = Provider.of<SettingsService>(context, listen: true);
    return CupertinoPageScaffold(
      backgroundColor: widget.dynamicHeaderColor &&
              gameProvider.currentNote != null &&
              settingsProvider.getColorMode()
          ? Color(Provider.of<GameService>(context, listen: true)
              .currentNote!
              .colorCode)
          : Colors.white,
      navigationBar: CupertinoNavigationBar(
          backgroundColor: widget.headerBackgroundColor,
          leading: widget.navOptions
              ? CupertinoNavigationBarBackButton(
                  onPressed: () {},
                  color: widget.color,
                )
              : null,
          middle: Text(
            TranslationService().getTranslation(widget.title),
            style: TextStyle(color: widget.color),
          )),
      child: SafeArea(
        bottom: false,
        child: Material(
          color: widget.backgroundColor,
          child: Container(
              margin: widget.margin
                  ? EdgeInsets.only(top: 20, left: 20, right: 20)
                  : null,
              width: double.infinity,
              child: widget.child),
        ),
      ),
    );
  }
}
