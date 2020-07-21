import 'package:flutter/material.dart';

class IdeaSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Sliver App Bar List'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("Hello"),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
