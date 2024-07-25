import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @nodoc
class ToggleButton extends StatefulWidget {
  const ToggleButton({Key? key}) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}
/// @nodoc
class _ToggleButtonState extends State<ToggleButton> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.black,
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {},
            color: CupertinoColors.white,
          ),
          middle: const Text(
            "Settings",
            style: TextStyle(color: Colors.white),
          )),
      child: Material(
        child: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Color mode",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Display the color of the note when it's played",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: CupertinoSwitch(
                          value: state,
                          onChanged: (value) {
                            state = value;
                            setState(
                              () {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 1,
                  color: CupertinoColors.systemGrey5,
                ),
                const SizedBox(height: 40),
                Text(
                  state == true
                      ? "Bluetooth turned on"
                      : "Bluetooth turned off",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: state == true
                          ? CupertinoColors.secondaryLabel
                          : CupertinoColors.activeOrange),
                ),
              ],
            )),
      ),
    );
  }
}
