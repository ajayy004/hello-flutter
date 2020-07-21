import 'package:flutter/material.dart';

import './widgets/safe_area.dart';
import './widgets/sliver_app_bar.dart';
import './widgets/full-screen-dialog/full_screen_home.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Idea"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('SafeArea'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IdeaSafeArea(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('SliverAppBar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IdeaSliverAppBar(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Full-Screen Dailog'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenHome(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Explore Ideas'),
        ),
      ),
    );
  }
}
