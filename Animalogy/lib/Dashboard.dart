import 'package:animalogy/ThemeColor.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Home/StoryFirst.dart';
import 'package:fluttermoji/fluttermoji.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  // late ConfettiController _controller;
  //
  // @override
  // void initState() {
  //   _controller = ConfettiController(duration: const Duration(seconds: 5));
  //   _controller.play();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kContainerColor,
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                //   ConfettiWidget(
                //   confettiController: _controller,
                //   blastDirectionality: BlastDirectionality.explosive,
                //   particleDrag: 0.05,
                //   emissionFrequency: 0.01,
                //   numberOfParticles: 50,
                //   gravity: 0.05,
                //   shouldLoop: true,
                //   colors: const [
                //     Colors.green,
                //     Colors.blue,
                //     Colors.pink,
                //     Colors.orange,
                //     Colors.purple
                //   ], // manually specify the colors to be used
                // ),
                  SizedBox(height: 80,),
                  Text("Welcome to", textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: kPurpleColor),),
                  SizedBox(height: 10,),
                  Text("Animalogy", textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: kYellowColor),),
                  SizedBox(height: 40,),
                  FluttermojiCircleAvatar(
                    backgroundColor: Colors.grey[400],
                    radius: 150,
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (context) => StoryFirst()));
                      },
                      borderRadius: BorderRadius.circular(30),
                      splashColor: kThemeColor,
                      child: Container(
                        height: 60,
                        width: 200,
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Let's Begin",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                            SizedBox(width: 12,),
                            Icon(Icons.arrow_circle_right, color: Colors.white, size: 40,)
                          ],
                        ),
                      )
                  ),
                ],
              ),
            )
        )
    );
  }
}
