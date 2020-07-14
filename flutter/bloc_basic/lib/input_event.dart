abstract class InputEvent {}

class LocationInput extends InputEvent {
  String location;
  LocationInput(this.location);
}
