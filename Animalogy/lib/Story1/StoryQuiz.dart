import 'package:animalogy/Story1/QuizAnsW1.dart';
import 'package:animalogy/Story1/QuizAnsW3.dart';
import 'package:animalogy/Story1/QuizAnsW4.dart';
import 'package:animalogy/Story1/StoryQuizAns.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryQuiz extends StatefulWidget {
  const StoryQuiz({Key? key}) : super(key: key);

  @override
  State<StoryQuiz> createState() => _StoryQuizState();
}

class _StoryQuizState extends State<StoryQuiz> {

  late double width;
  late double height;
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();

    //  storing to localdata
    storePageData();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'storyQuiz');
    final String? action = prefs.getString('currentPage');
    print(action);
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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kContainerColor,
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * 0.08,),
                const Text("Quiz Time!", style: TextStyle(fontSize: 35, color: kPurpleColor, fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                Image.asset('assets/Map.png', fit: BoxFit.fill,),
                const SizedBox(height: 30,),
                const Text("Which region is Meerkat from?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Region 1", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizAnsW1()));
                        },
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Region 2", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const StoryQuizAns()));
                        },
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Region 3", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizAnsW3()));
                        },
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("Region 4", style: TextStyle(fontSize: 16, color: Colors.black, fontStyle: FontStyle.normal),),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizAnsW4()));
                        },
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ],
            )
          ),
      ),
    );
  }
}
