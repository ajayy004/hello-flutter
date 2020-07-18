import 'package:flutter/material.dart';

import 'dart:async';

StreamController<double> controller = StreamController.broadcast();

class DragBlock extends StatelessWidget {
  double height = 200;

  double startPosition;
  double draggingPosition;
  double startHeight;
  double lastHeight = 200;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: controller.stream,
      builder: (context, snapshot) => GestureDetector(
        onVerticalDragStart: (details) {
          startPosition = details.globalPosition.dy;
          startHeight = height;
        },
        onVerticalDragEnd: (details) {
          final heightDelta = startPosition - draggingPosition;
          if (heightDelta > 50) {
            height = deviceSize.height;
            lastHeight = height;
            controller.add(height);
          } else if (heightDelta < -50 && height > 200) {
            height = 200;
            lastHeight = height;
            controller.add(height);
          } else {
            controller.add(lastHeight);
          }

          if (height < 200) {
            height = 200;
            controller.add(height);
          }
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          draggingPosition = details.globalPosition.dy;
          if (startPosition - draggingPosition > 50 ||
              startPosition - draggingPosition < -50) {
            height = MediaQuery.of(context).size.height - draggingPosition;

            if (height > 200) {
              height.isNegative
                  ? Navigator.pop(context)
                  : controller.add(height);
            }
          }
        },
        behavior: HitTestBehavior.translucent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          color: Colors.green,
          height: snapshot.hasData ? snapshot.data : 200,
          width: double.infinity,
          child: Text('Child'),
        ),
      ),
    );
  }
}
