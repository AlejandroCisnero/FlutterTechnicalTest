import 'package:dog_breeds/Models/breed.dart';
import 'package:dog_breeds/Providers/dogs.dart';
import 'package:dog_breeds/Widgets/home/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Breed>> fetchBreeds;

  @override
  void initState() {
    super.initState();
    fetchBreeds = Provider.of<Dogs>(context, listen: false).fetchDogs();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: FutureBuilder<List<Breed>>(
        future: fetchBreeds,
        builder: (BuildContext context, AsyncSnapshot<List<Breed>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircularProgressIndicator(),
                      Text(
                        'Loading angels',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasData) {
            List<Breed> dogs = Provider.of<Dogs>(context).dogs;
            List<String> resultTag = ['any'];
            resultTag.clear();
            dogs.forEach((dog) {
              resultTag.add('${dog.breedName}');
            });
            if (resultTag.length > 20) {
              resultTag.clear();
              resultTag.add('any');
            }
            return SizedBox(
              width: screenSize.width,
              height: screenSize.height,
              child: Column(
                children: [
                  const IslandSeachBar(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Text('Showing dogs for breed: ${resultTag}'),
                    ),
                  ),
                  Expanded(
                    child: HomePageGridView(
                      dogImages: Provider.of<Dogs>(context).dogsImages,
                      breeds: dogs,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: Center(
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: const [
                      Text('We could not fetch our dogs'),
                      Text("maybe they're eating")
                    ],
                  ),
                ),
              ),
            );
          }
        },
      )),
    );
  }
}

class IslandSeachBar extends StatelessWidget {
  const IslandSeachBar({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.85,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                offset: const Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1),
            BoxShadow(
                color: Colors.grey.shade100,
                offset: Offset(-5, -5),
                blurRadius: 15,
                spreadRadius: 1),
          ]),
      child: TextFormField(
        onFieldSubmitted: (value) {
          Provider.of<Dogs>(context, listen: false).filterBreeds(value);
        },
        decoration: InputDecoration(
          hintText: 'Search for a breed',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          contentPadding: const EdgeInsets.only(top: 12, bottom: 10, left: 15),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(color: Colors.white.withOpacity(0.05), width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.white.withOpacity(0.05), width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          errorStyle: TextStyle(
            color: Colors.red[400],
            fontWeight: FontWeight.w200,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
