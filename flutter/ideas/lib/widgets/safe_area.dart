import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

class IdeaSafeArea extends StatefulWidget {
  @override
  _IdeaSafeAreaState createState() => _IdeaSafeAreaState();
}

class _IdeaSafeAreaState extends State<IdeaSafeArea> {
  bool _top = true;
  bool _left = true;
  bool _bottom = true;
  bool _right = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: _top,
        left: _left,
        bottom: _bottom,
        right: _right,
        // Default all true, top, bottom, right, left
        child: Column(
          children: <Widget>[
            Text(
                "SafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafeareaSafearea"),
            ListTile(
              leading: Switch(
                value: _top,
                onChanged: (value) {
                  setState(() {
                    _top = value;
                  });
                },
              ),
              title: Text('Top'),
            ),
            ListTile(
              leading: Switch(
                value: _left,
                onChanged: (value) {
                  setState(() {
                    _left = value;
                  });
                },
              ),
              title: Text('Left'),
            ),
            ListTile(
              leading: Switch(
                value: _bottom,
                onChanged: (value) {
                  setState(() {
                    _bottom = value;
                  });
                },
              ),
              title: Text('Bottom'),
            ),
            ListTile(
              leading: Switch(
                value: _right,
                onChanged: (value) {
                  setState(() {
                    _right = value;
                  });
                },
              ),
              title: Text('Right'),
            )
          ],
        ),
      ),
    );
  }
}
