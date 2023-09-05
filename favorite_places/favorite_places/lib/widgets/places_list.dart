import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'white_text.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (places.isEmpty) {
      return const Center(
        child: WhiteText(text: 'No places yet, start adding some!'),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(places[index].id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (direction) =>
            ref.read(placesProvider.notifier).removePlace(places[index]),
        child: ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),
          title: WhiteText(text: places[index].title),
          subtitle:
              WhiteText(text: places[index].location.address, fontSize: 10),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PlaceDetailScreen(
                  place: places[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
