part of app_module;

///Header is a widget that constains the top UI of the App
///with the name and the buttons to access the menu
class Header extends StatelessWidget {
  const Header({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
      child: SizedBox(
        width: media.size.width,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
