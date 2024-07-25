
part of app_module;

///SoundWave display an animation when the user's microphone is open
class ShazamCircleAnimation extends StatefulWidget {
  @override
  _ShazamCircleAnimationState createState() => _ShazamCircleAnimationState();
}

class _ShazamCircleAnimationState extends State<ShazamCircleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(alignment: Alignment.center, children: [
        SizedBox(
          height: 200,
          width: 200,
          child: CustomPaint(
            painter: ShazamCirclePainter(_animation.value),
          ),
        ),
        Container(
          child: Image.asset(
            "assets/images/microphone.png",
            height: 70,
          ),
        ),
      ]),
    );
  }
}

///ShazamCirclePainter is a Part of SoundWave widget animation

class ShazamCirclePainter extends CustomPainter {
  final double animationValue;

  ShazamCirclePainter(this.animationValue);

  Paint getPaint(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    canvas.drawCircle(center, radius * animationValue, getPaint(Colors.blue));
    canvas.drawCircle(
        center, radius * animationValue * 0.75, getPaint(Colors.green));
    canvas.drawCircle(
        center, radius * animationValue * 0.50, getPaint(Colors.yellow));
    canvas.drawCircle(
        center, radius * animationValue * 0.25, getPaint(Colors.red));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
