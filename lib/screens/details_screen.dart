import 'package:flutter/material.dart';
import 'package:tourism_guide_with_firebase/widgets/favourite_button.dart';

import '../models/attraction.dart';

class DetailsScreen extends StatelessWidget {
  final Attraction attraction;

  const DetailsScreen({super.key, required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(attraction.title),
        actions: [FavouriteButton(attractionId: attraction.id)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              attraction.image,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attraction.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(attraction.location),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    attraction.description,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
