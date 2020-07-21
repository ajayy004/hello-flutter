import 'package:flutter/material.dart';

import './add.dart';
import './helpers/db_helper.dart';
import 'helpers/db_helper.dart';

class Home extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _getTodo() async {
    return await DbHelper.getTodo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo'),
        ),
        body: Column(
          children: <Widget>[
            AddTodo(),
            FutureBuilder(
              future: _getTodo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return CircularProgressIndicator(
                    strokeWidth: 5,
                  );
                }

                if (snapshot.hasError) {
                  return Text('Error');
                }

                if (snapshot.hasData) {
                  return Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, index) => ListTile(
                        title: Text(snapshot.data[index]['title']),
                      ),
                    ),
                  );
                }

                return Text('Nothing');
              },
            )
          ],
        ),
      ),
    );
  }
}
