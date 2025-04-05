import 'package:flutter/material.dart';

class SnackBarProgressIndicator extends StatefulWidget {
  const SnackBarProgressIndicator({
    Key? key,
    required this.backGroundColor,
    required this.valueColor,
    required this.duration,
  }) : super(key: key);

  final Color backGroundColor;
  final Color valueColor;
  final Duration duration;

  @override
  _SnackBarProgressIndicatorState createState() => new _SnackBarProgressIndicatorState();
}

class _SnackBarProgressIndicatorState extends State<SnackBarProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final snackBarDelay = 250;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        milliseconds: widget.duration.inMilliseconds + snackBarDelay,
      ), 
      vsync: this,
    );
    
    animation = Tween(
      begin: 0.0, 
      end: 1.0,
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });
      
    controller.repeat();
  }


  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(4.0),
        bottomRight: Radius.circular(4.0),
      ),
      child: LinearProgressIndicator(
        minHeight: 6.0,
        value:  animation.value,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.valueColor,
        ),
        backgroundColor: widget.backGroundColor,
      ),
    );
  }
}
