import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FullScreenDialog extends StatelessWidget {
  static String routeName = '/full-screen-dialog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FullScreenDialog'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context, "Testing Save");
            },
            child: Text('Save'),
          )
        ],
      ),
      body: SafeArea(child: Text("Testing")),
    );
  }
}
