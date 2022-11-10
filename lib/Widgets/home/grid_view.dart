import 'dart:math';

import 'package:dog_breeds/Models/breed.dart';
import 'package:dog_breeds/Models/dog.dart';
import 'package:dog_breeds/Providers/dogs.dart';
import 'package:dog_breeds/Widgets/dog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePageGridView extends StatelessWidget {
  HomePageGridView({Key? key, required this.breeds, required this.dogImages})
      : super(key: key);
  final List<Breed> breeds;
  final List<dynamic> dogImages;

  @override
  Widget build(BuildContext context) {
    List<Dog> dogs = [];

    breeds.forEach((breed) {
      breed.dogs.forEach((dog) {
        dogs.add(Dog(name: dog.name, imageUrl: dog.imageUrl));
      });
    });

    if (dogs.isNotEmpty) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return DogCard(dog: dogs[index]);
        },
        itemCount:
            dogs.length, //Due to the maximum of images that the API can deliver
      );
    } else {
      //In case of no reults
      return Center(
        child: SizedBox(
          height: 350,
          child: Column(
            children: [
              Text(
                "We couldn't find your dog",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "but here's a hot dog!",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                'lib/assets/icons/hotdog-solid.svg',
                width: 64,
                height: 64,
              ),
            ],
          ),
        ),
      );
    }
  }
}
