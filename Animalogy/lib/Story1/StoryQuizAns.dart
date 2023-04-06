import 'package:animalogy/Story2/BeginStory2.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryQuizAns extends StatefulWidget {
  const StoryQuizAns({Key? key}) : super(key: key);

  @override
  State<StoryQuizAns> createState() => _StoryQuizAnsState();
}

class _StoryQuizAnsState extends State<StoryQuizAns> {

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
    await prefs.setString('currentPage', 'storyQuizAns');
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
    return Scaffold(
      backgroundColor: kContainerColor,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20,),
              Text("Correct Answer!", style: TextStyle(fontSize: 35, color: kPurpleColor, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Image.asset('assets/Map_Ans.png', fit: BoxFit.fill,),
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
    );
  }
}
