import 'dart:async';

import './input_event.dart';

class InputBloc {
  String _location = '';

  final _inputStateController = StreamController<String>();
  StreamSink<String> get _locationSink => _inputStateController.sink;
  Stream<String> get location => _inputStateController.stream;

  final _locationEventController = StreamController<InputEvent>();
  Sink<InputEvent> get locationEventSink => _locationEventController.sink;

  InputBloc() {
    _locationEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(InputEvent event) {
    if (event is LocationInput) {
      _locationSink.add(event.location);
    }
  }
}
