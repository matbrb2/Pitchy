part of game_module;


///Layout is the main component that integrates all the widgets together to build the UI
/// 
/// See also:
/// - [GameState], which manages the state of the game UI.
class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => GameState();
}
/// State class for [Game].
class GameState extends State<Game> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    
    ///gameProvider bring the GameService with changeNotifier values
    var provider = Provider.of<GameService>(context, listen: true);

    CarouselController carouselController = CarouselController();
    var media = MediaQuery.of(context);
    return Stack(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
              height: media.size.height,
              autoPlay: false,
              scrollDirection: Axis.vertical,
              initialPage: 1,
              enableInfiniteScroll: false,
              viewportFraction: 1),
          items: const [
            VocalPitchPerfectTrainer(),
            PitchPerfectTrainer(),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: media.size.width,
            height: 100,
            color: Colors.black.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      carouselController.nextPage();
                    },
                    icon: const Icon(Icons.arrow_drop_down_circle)),
                IconButton(
                    onPressed: () {
                      carouselController.previousPage();
                    },
                    icon: const Icon(Icons.arrow_drop_up)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
