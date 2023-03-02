import 'package:animalogy/Story2/Story2P12.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class Story3P1 extends StatefulWidget {
  const Story3P1({Key? key}) : super(key: key);

  @override
  State<Story3P1> createState() => _Story3P1State();
}

class _Story3P1State extends State<Story3P1> with TickerProviderStateMixin {
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
              MaterialPageRoute(builder: (context) => const Story3P1()));
        },
        child: Center(
          child: RotatedBox(
            quarterTurns:3,
            child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Backgrounds/36.png'),
                            fit: BoxFit.fill)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0,4.8),
                    child: Transform.translate(
                      offset: Offset(-120, animation.value),
                      child: Container(
                        height: 300,
                        width: 340,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Backgrounds/35.png'),
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
                      child: const Text(''),
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