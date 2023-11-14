import 'dart:math';

import 'package:flutter/material.dart';

class DashboardCircularProgressIndicator extends StatefulWidget {
  final double completedProgress;
  final Widget child;

  const DashboardCircularProgressIndicator(
      {super.key, required this.completedProgress, required this.child});

  @override
  State<DashboardCircularProgressIndicator> createState() =>
      _DashboardCircularProgressIndicatorState();
}

class _DashboardCircularProgressIndicatorState
    extends State<DashboardCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _radialProgressAnimationController;
  late Animation<double> _progressAnimation;

  double percentProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _progressAnimation = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          percentProgress =
              (widget.completedProgress * _progressAnimation.value);
        });
      });
    _radialProgressAnimationController.forward();
  }

  @override
  dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const size = 220.0;

    return Container(
      child: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            children: [
              CustomPaint(
                painter: ProgressPainter(percentProgress),
                child: const SizedBox(
                  width: size,
                  height: size,
                ),
              ),
              Center(
                child: widget.child,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  double progressPercentage;
  ProgressPainter(this.progressPercentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintMask = Paint()
      ..color = const Color(0xffB1B6A2)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18.0;

    Offset center = Offset(size.width / 2, size.height / 1.6);

    // Base Mask
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        pi / 1.1, pi * 1.18, false, paintMask);

    // Arc to go over
    Paint paintProgress = Paint()
      ..color = const Color(0xffFFD64E)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18.0;

    // change the percentage complete into radians and display progress
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        pi / 1.1, (progressPercentage * pi * 1.18) / 180, false, paintProgress);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
