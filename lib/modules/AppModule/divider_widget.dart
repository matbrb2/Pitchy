part of app_module;

///Divider is a widget which draw a separation line in your UI
class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        Divider(
          height: 1,
          color: CupertinoColors.systemGrey5,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
