import 'package:flutter/material.dart';
import './full_screen_dailog.dart';

class FullScreenHome extends StatelessWidget {
  Future _openAddEntryDialog(BuildContext context) async {
    final save = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => FullScreenDialog(),
        fullscreenDialog: true,
      ),
    );
    print(save);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Home'),
      ),
      body: SafeArea(
        child: RaisedButton(
          onPressed: () {
            _openAddEntryDialog(context);
          },
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}
