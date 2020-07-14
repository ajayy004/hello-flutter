import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/framework.dart';

import './counter_bloc.dart';
import './counter_event.dart';

import './input_bloc.dart';
import './input_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc();
  final _inputBloc = InputBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder(
                stream: _bloc.counter,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  );
                }),
            StreamBuilder(
                stream: _inputBloc.location,
                initialData: '',
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(40),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Location',
                          ),
                          onSubmitted: (value) => _inputBloc.locationEventSink
                              .add(LocationInput(value)),
                        ),
                      ),
                      Text(snapshot.data),
                    ],
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
