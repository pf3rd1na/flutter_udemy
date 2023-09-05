// @immutable
import 'dart:io';

import 'package:favorite_places/models/place_location.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  const Place({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
  });

  factory Place.uuid(String title, File image, PlaceLocation location) {
    return Place(id: uuid.v4(), title: title, image: image, location: location);
  }

  @override
  String toString() {
    return 'PlaceModel(id: $id, title: $title, image: ${image.path})';
  }
}
