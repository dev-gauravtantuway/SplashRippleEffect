import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      title: "Ripple-Effect-Animation",
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController firstRippleController;
  AnimationController secondRippleController;
  AnimationController thirdRippleController;
  AnimationController centerCircleController;
  Animation<double> firstRippleRadiusAnimation;
  Animation<double> firstRippleOpacityAnimation;
  Animation<double> firstRippleWidthAnimation;
  Animation<double> secondRippleRadiusAnimation;
  Animation<double> secondRippleOpacityAnimation;
  Animation<double> secondRippleWidthAnimation;
  Animation<double> thirdRippleRadiusAnimation;
  Animation<double> thirdRippleOpacityAnimation;
  Animation<double> thirdRippleWidthAnimation;
  Animation<double> centerCircleRadiusAnimation;

  @override
  void initState() {
    super.initState();
    firstRippleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    firstRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
        CurvedAnimation(parent: firstRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstRippleController.forward();
        }
      });
    firstRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: firstRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    firstRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
        CurvedAnimation(parent: firstRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    secondRippleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    secondRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
        CurvedAnimation(parent: secondRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          secondRippleController.forward();
        }
      });
    secondRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: secondRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    secondRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
        CurvedAnimation(parent: secondRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    thirdRippleController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );
    thirdRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
        CurvedAnimation(parent: thirdRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdRippleController.forward();
        }
      });
    thirdRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: thirdRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    thirdRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
        CurvedAnimation(parent: thirdRippleController, curve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    centerCircleController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    centerCircleRadiusAnimation = Tween<double>(begin: 35, end: 50).animate(
        CurvedAnimation(
            parent: centerCircleController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          centerCircleController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          centerCircleController.forward();
        }
      });
    firstRippleController.forward();
    Timer(Duration(milliseconds: 800), () => secondRippleController.forward());
    Timer(Duration(milliseconds: 1050), () => thirdRippleController.forward());
    centerCircleController.forward();
  }

  @override
  void dispose() {
    firstRippleController.dispose();
    secondRippleController.dispose();
    thirdRippleController.dispose();
    centerCircleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff312B47),
      body: Center(
        child: CustomPaint(
          painter: MyPainter(
            firstRippleRadiusAnimation.value,
            firstRippleOpacityAnimation.value,
            firstRippleWidthAnimation.value,
            secondRippleRadiusAnimation.value,
            secondRippleOpacityAnimation.value,
            secondRippleWidthAnimation.value,
            thirdRippleRadiusAnimation.value,
            thirdRippleOpacityAnimation.value,
            thirdRippleWidthAnimation.value,
            centerCircleRadiusAnimation.value,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double _firstRippleRadius;
  final double _firstRippleOpacity;
  final double _firstRippleStrokeWidth;
  final double _secondRippleRadius;
  final double _secondRippleOpacity;
  final double _secondRippleStrokeWidth;
  final double _thirdRippleRadius;
  final double _thirdRippleOpacity;
  final double _thirdRippleStrokeWidth;
  final double _centerCircleRadius;

  MyPainter(
      this._firstRippleRadius,
      this._firstRippleOpacity,
      this._firstRippleStrokeWidth,
      this._secondRippleRadius,
      this._secondRippleOpacity,
      this._secondRippleStrokeWidth,
      this._thirdRippleRadius,
      this._thirdRippleOpacity,
      this._thirdRippleStrokeWidth,
      this._centerCircleRadius);

  @override
  void paint(Canvas canvas, Size size) {
    Color myColor = Color(0xff653FF4);

    Paint firstPaint = Paint();
    firstPaint.color = myColor.withOpacity(_firstRippleOpacity);
    firstPaint.style = PaintingStyle.stroke;
    firstPaint.strokeWidth = _firstRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, _firstRippleRadius, firstPaint);

    Paint secondPaint = Paint();
    secondPaint.color = myColor.withOpacity(_secondRippleOpacity);
    secondPaint.style = PaintingStyle.stroke;
    secondPaint.strokeWidth = _secondRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, _secondRippleRadius, secondPaint);

    Paint thirdPaint = Paint();
    thirdPaint.color = myColor.withOpacity(_thirdRippleOpacity);
    thirdPaint.style = PaintingStyle.stroke;
    thirdPaint.strokeWidth = _thirdRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, _thirdRippleRadius, thirdPaint);

    Paint fourthPaint = Paint();
    fourthPaint.color = myColor;
    fourthPaint.style = PaintingStyle.fill;

    canvas.drawCircle(Offset.zero, _centerCircleRadius, fourthPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
