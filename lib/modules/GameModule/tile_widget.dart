part of game_module;


///TileWidget is a button representing a note from chromatic scale.
class Tile extends StatefulWidget {
  const Tile({Key? key, required this.note, required this.onTap})
      : super(key: key);

  ///Note (from chromatic scale) represented by the widget
  final Note note;
  ///Action when the tile is pressed
  final Function onTap;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsService>(context, listen: true);

    var provider = Provider.of<GameService>(context, listen: true);

    var pressed = false;
    return settingsProvider.getSelectedNotes()[widget.note.position]
        ? Listener(
                    onPointerUp: (_) {
                      setState(() {
                        pressed = false;
                      });
                    },
                    onPointerDown: (_) {
                      setState(() {
                        pressed = true;
                        widget.onTap(widget.note);
                        GameService().clickTile(widget.note.position);
                      });
                    },
                    child:SizedBox(
            width: 55,
            height: 55,
            child: Stack(
              children: [
                 AnimatedContainer(
                      margin: const EdgeInsets.all(5),
                      duration: const Duration(milliseconds: 100),
                      decoration: BoxDecoration(
                        boxShadow: pressed
                            ? []
                            :const  [
                                BoxShadow(
                                  color: Color(0xFFA7A9AF),
                                  blurRadius: 10,
                                  offset: Offset(5, 5),
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-5, -5),
                                  blurRadius: 10,
                                )
                              ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: provider.clickedNotes.contains(widget.note)
                            ? (provider.currentNote?.position ==
                                    widget.note.position
                                ? Colors.green
                                : Colors.red)
                            : widget.note.type == "SEMI"
                                ? (pressed
                                    ? Colors.black.withOpacity(0.2)
                                    : Colors.black)
                                : (pressed
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.white),
/*                       color: provider.isTilePlayed &&
                              (widget.note.position ==
                                  provider.userChoice?.position)
                          ? (provider.isGoodAnswer ? Colors.green : Colors.red)
                          : widget.note.type == "SEMI"
                              ? Colors.black
                              : Colors.white, */
                      ),
                    ),
                Center(
                    child: Text(
                  "${widget.note.text.singleWhere((element) => element.code == SettingsService().getLanguageCode()).traduction}",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      color: widget.note.type == "TONE"
                          ? Colors.black
                          : Colors.white),
                ))
              ],
            ),
          ))
        : const SizedBox(
            width: 55,
            height: 55,
          );
  }
}
