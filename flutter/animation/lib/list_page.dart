import 'package:flutter/material.dart';
import 'dart:async';

StreamController<double> controller = StreamController.broadcast();

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool _animatePosition = false;
  int initialDragTimeStamp;
  int currentDragTimeStamp;
  int timeDelta;
  double initialPositionY;
  double currentPositionY;
  double positionYDelta;
  double containerHeight = 200;

  void startAnimation() {
    setState(() {
      _animatePosition = !_animatePosition;
    });
  }

  void _startVerticalDrag(details) {
    // Timestamp of when drag begins
    initialDragTimeStamp = details.sourceTimeStamp.inMilliseconds;

    // Screen position of pointer when drag begins
    initialPositionY = details.globalPosition.dy;
    // print('initialPositionY $initialPositionY');
  }

  void _whileVerticalDrag(details) {
    // Gets current timestamp and position of the drag event
    currentDragTimeStamp = details.sourceTimeStamp.inMilliseconds;
    currentPositionY = details.globalPosition.dy;

    // How much time has passed since drag began
    timeDelta = currentDragTimeStamp - initialDragTimeStamp;

    // Distance pointer has travelled since drag began
    positionYDelta = currentPositionY - initialPositionY;
    containerHeight = currentPositionY;

    // print('timeDelta $timeDelta');
    // if (timeDelta > 50) {
    //   if (positionYDelta < -50) {
    //     setState(() {
    //       _animatePosition = true;
    //     });
    //   } else if (positionYDelta > 50 && _animatePosition) {
    //     setState(() {
    //       _animatePosition = false;
    //     });
    //   } else {
    //     containerHeight = 300;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              bottom: 0,
              left: 0,
              height:
                  containerHeight, //_animatePosition ? deviceSize.height : containerHeight,
              width: deviceSize.width,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInToLinear,
              child: GestureDetector(
                onVerticalDragStart: (details) => _startVerticalDrag(details),
                onVerticalDragUpdate: (details) => _whileVerticalDrag(details),
                // onTap: startAnimation,
                child: Container(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
