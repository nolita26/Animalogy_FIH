import 'package:animalogy/Story2/Story2P9.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story2P8 extends StatefulWidget {
  const Story2P8({Key? key}) : super(key: key);

  @override
  State<Story2P8> createState() => _Story2P8State();
}

class _Story2P8State extends State<Story2P8> with TickerProviderStateMixin {
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
              MaterialPageRoute(builder: (context) => const Story2P9()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Backgrounds/17.png'),
                            fit: BoxFit.cover)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0,5.4),
                    child: Transform.translate(
                      offset: Offset(150, animation.value),
                      child: Container(
                        height: 250,
                        width: 120,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Meerkat/PNG/Neutral.png'),
                            )),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      onPressed: () {
                        animationController.forward();
                      },
                      child: const Text('Tap'),
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