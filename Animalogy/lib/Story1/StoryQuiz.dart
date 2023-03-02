import 'package:animalogy/Story1/StoryQuizAns.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';

class StoryQuiz extends StatefulWidget {
  const StoryQuiz({Key? key}) : super(key: key);

  @override
  State<StoryQuiz> createState() => _StoryQuizState();
}

class _StoryQuizState extends State<StoryQuiz> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kContainerColor,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StoryQuizAns()));
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20,),
              Text("Quiz Time!", style: TextStyle(fontSize: 35, color: kPurpleColor, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Image.asset('assets/Map.png', fit: BoxFit.fill,),
              SizedBox(height: 50,),
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
                        backgroundColor: Colors.white,
                      ),
                      child: Text("Region 1", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
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
                      child: Text("Region 4", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const StoryQuizAns()));
                      },
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              )
            ],
          )
          // RotatedBox(
          //   quarterTurns:0,
          //   child:
          // ),
        ),
      ),
    );
  }
}
