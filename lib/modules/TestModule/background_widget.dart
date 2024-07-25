import 'package:flutter/material.dart';

class FullScreenColorBackground extends StatefulWidget {
  @override
  _FullScreenColorBackgroundState createState() =>
      _FullScreenColorBackgroundState();
}

class _FullScreenColorBackgroundState extends State<FullScreenColorBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ColorTween _colorTween;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _colorTween = ColorTween(begin: Colors.red, end: Colors.green);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorTween
          .evaluate(AlwaysStoppedAnimation(_animationController.value)),
      body: const Center(
        child: Text('Full Screen Random Color Background',
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
