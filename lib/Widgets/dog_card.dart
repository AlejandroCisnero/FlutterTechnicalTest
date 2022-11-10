import 'package:dog_breeds/Models/dog.dart';
import 'package:dog_breeds/Utils/dog_card_clipper.dart';
import 'package:flutter/material.dart';

class DogCard extends StatefulWidget {
  const DogCard({super.key, required this.dog});
  final Dog dog;

  @override
  State<DogCard> createState() => _DogCardState();
}

class _DogCardState extends State<DogCard> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isTwisted = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      upperBound: 0.7,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInBack,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isTwisted = true;
      } else if (status == AnimationStatus.dismissed) {
        isTwisted = false;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return RotationTransition(
      turns: _animation,
      child: GestureDetector(
        onTap: () {
          if (isTwisted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Container(
            margin: const EdgeInsets.all(15),
            width: screenSize.width * 0.20,
            height: screenSize.height * 0.15,
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(12),
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
            child: Stack(
              children: [
                Positioned(
                  bottom: screenSize.height * 0.03,
                  left: screenSize.width * 0.005,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        widget.dog.name,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: screenSize.width * 0.055,
                  child: Container(
                    width: screenSize.width * 0.37,
                    height: screenSize.height * 0.18,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.dog.imageUrl,
                        width: screenSize.width * 0.20,
                        height: screenSize.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: DogCardClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.orange[300]),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
