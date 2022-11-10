import 'package:dog_breeds/Models/dog.dart';

class Breed {
  Breed({required this.breedName, required this.dogs});
  final String breedName;
  List<Dog> dogs;

  factory Breed.fromJson(dynamic jsonBreedName, dynamic jsonDogsName) {
    List<Dog> dogs = [];
    jsonDogsName.forEach((dogName) {
      dogs.add(Dog(name: dogName));
    });

    return Breed(breedName: jsonBreedName, dogs: dogs);
  }
}
