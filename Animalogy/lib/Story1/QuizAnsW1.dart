import 'package:animalogy/Story1/QuizAnsW3.dart';
import 'package:animalogy/Story1/QuizAnsW4.dart';
import 'package:animalogy/Story1/StoryP5.dart';
import 'package:animalogy/Story1/StoryQuizAns.dart';
import 'package:animalogy/Story2/BeginStory2.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuizAnsW1 extends StatefulWidget {
  const QuizAnsW1({Key? key}) : super(key: key);

  @override
  State<QuizAnsW1> createState() => _QuizAnsW1State();
}

class _QuizAnsW1State extends State<QuizAnsW1> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StoryP5()));
        },
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20,),
                Text("Correct Answer!", style: TextStyle(fontSize: 35, color: kPurpleColor, fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Image.asset('assets/Map.png', fit: BoxFit.fill,),
                SizedBox(height: 40,),
                Text("Which region is Meerkat from?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                        child: Text("Region 1", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const QuizAnsW1()));
                        },
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                        child: Text("Region 2", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const StoryQuizAns()));
                        },
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: Text("Region 3", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const QuizAnsW3()));
                        },
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: Text("Region 4", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const QuizAnsW4()));
                        },
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const BeginStoryP2()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_rounded, color: Colors.black,),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
