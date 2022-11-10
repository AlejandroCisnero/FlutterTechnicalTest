import 'dart:convert';
import 'dart:math';

import 'package:dog_breeds/Http/urls.dart';
import 'package:dog_breeds/Models/breed.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dogs extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Breed> _breeds = [];
  List<Breed> _filteredDogs = [];
  List<dynamic> _dogsImages = [];

  List<Breed> get dogs => [..._filteredDogs];

  List<String> get dogsImages => [..._dogsImages];

  Future<List<Breed>> fetchDogs() async {
    //--------------------------Setting up the endpoint-------------------------
    const String url = '$apiBaseUrl/breeds/list/all';
    final Uri uri = Uri.parse(url);
    //--------------------------Making the HTTP request-------------------------
    try {
      http.Response response = await http.get(uri);
      final responseData = json.decode(response.body);
      //------------------------------Error handling----------------------------
      if (responseData['status'] == 'error') {
        throw FormatException(responseData['message']);
      }
      //------------------Parsing the fetch data to a List<Breed>---------------
      responseData['message'].forEach((k, v) {
        _breeds.add(Breed.fromJson(k, v));
      });
      _dogsImages = await fetchDogImages(50);
      _breeds.removeWhere((breed) => breed.dogs.isEmpty);
      _breeds.forEach((breed) {
        breed.dogs.forEach((dog) {
          Random random = Random();
          int randomNumber = random.nextInt(50);
          dog.imageUrl = _dogsImages[randomNumber];
        });
      });
      _filteredDogs = [..._breeds];
      notifyListeners();
      return _filteredDogs;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<String>> fetchDogImages(int countOfImages) async {
    final String url = '$apiBaseUrl/breeds/image/random/$countOfImages';
    final Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      final responseData = json.decode(response.body);
      if (responseData['status'] == 'error') {
        throw FormatException(responseData['message']);
      }

      return List<String>.from(responseData['message']);
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> filterBreeds(String searchedBreed) async {
    _filteredDogs = []; //clear the breed list

    _breeds.forEach((breed) {
      if (breed.breedName.contains(searchedBreed)) {
        _filteredDogs.add(breed);
      }
    });
    notifyListeners();
  }
}
