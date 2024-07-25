part of settings_module;

///ToggleWidget is a custom form widget for Settings UI
///
/// See also:
/// - [ToggleState], which manages the state of the toggle.
class Toggle extends StatefulWidget {
  const Toggle(
      {Key? key,
      this.color = Colors.black,
      required this.title,
      this.description,
      this.defaultValue,
      required this.onTap})
      : super(key: key);

  ///Label of the toggle
  final String title;

  ///Description (sublabel) of the toggle
  final String? description;
  
  ///Default value (check or not checked)
  final bool? defaultValue;

  ///Action to perform when the toggle is triggered
  final Function onTap;

  ///Color of the toggle (hexadecimal)
  final Color color;

  @override
  State<Toggle> createState() => ToggleState();
}

/// State class for [Toggle].
class ToggleState extends State<Toggle> {

  ///State of the toggle
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: widget.color),
                    ),
                    Text(
                      widget.description ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: widget.color),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: CupertinoSwitch(
                  value: widget.defaultValue ?? false,
                  onChanged: (value) {
                    state = value;
                    widget.onTap(value);
                    setState(
                      () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        /* SizedBox(height: 40),
        Text(
          state == true ? "Bluetooth turned on" : "Bluetooth turned off",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: state == true
                  ? CupertinoColors.secondaryLabel
                  : CupertinoColors.activeOrange),
        ), */
      ],
    );
  }
}
