import 'package:animalogy/Story1/StoryP2.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class StoryP1 extends StatefulWidget {
  const StoryP1({Key? key}) : super(key: key);

  @override
  State<StoryP1> createState() => _StoryP1State();
}

class _StoryP1State extends State<StoryP1> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: -300).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StoryP2()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Backgrounds/31.png'),
                          fit: BoxFit.cover)),
                ),
                Align(
                  alignment: const AlignmentDirectional(0,3.8),
                  child: Transform.translate(
                    offset: Offset(-150, animation.value),
                    child: Container(
                      height: 250,
                      width: 220,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Meerkat/PNG/Neutral-left.png'),
                          )),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    onPressed: () {
                      animationController.forward();
                    },
                    child: const Text('Tap',
                    style: TextStyle(
                      color: Colors.transparent,
                    ),),
                    ),
                  ),
                ]),
            ),
          ),
        ),
      );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}