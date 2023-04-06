import 'package:animalogy/Dashboard.dart';
import 'package:animalogy/Home/AvatarCreator.dart';
import 'package:animalogy/Home/FirstPage.dart';
import 'package:animalogy/Home/HomePage.dart';
import 'package:animalogy/Home/StorySecond.dart';
import 'package:animalogy/Story1/Questions.dart';
import 'package:animalogy/Story1/StoryP1.dart';
import 'package:animalogy/Story1/StoryP2.dart';
import 'package:animalogy/Story1/StoryP3.dart';
import 'package:animalogy/Story1/StoryP4.dart';
import 'package:animalogy/Story1/StoryP5.dart';
import 'package:animalogy/Story1/StoryP6.dart';
import 'package:animalogy/Story1/StoryQuiz.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animalogy/Home/StoryFirst.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String? currentPage = '';
  Widget showPage = Text('');

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    getData();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('currentPage');
    setState(() {
      currentPage = action;
    });

    if(currentPage == 'firstPage'){
      setState(() {
      showPage = FirstPage();
      });
    }
    /*else if (currentPage == 'homePage') {
      setState(() {
        showPage = HomePage(name);
      });
    }*/
    else if (currentPage == 'avatarCreator') {
      setState(() {
        showPage = AvatarCreator();
      });
    }
    else if (currentPage == 'dashboard') {
      setState(() {
        showPage = Dashboard();
      });
    }
    else if (currentPage == 'storyFirst') {
      setState(() {
        showPage = StoryFirst();
      });
    }
    else if (currentPage == 'storySecond') {
      setState(() {
        showPage = StorySecond();
      });
    }else if (currentPage == 'storyP1') {
      setState(() {
        showPage = StoryP1();
      });
    }
    else if (currentPage == 'storyP2') {
      setState(() {
        showPage = StoryP2();
      });
    }
    else if (currentPage == 'storyP3') {
      setState(() {
        showPage = StoryP3();
      });
    }
    else if (currentPage == 'storyP4') {
      setState(() {
        showPage = StoryP4();
      });
    }
    else if (currentPage == 'storyP5') {
      setState(() {
        showPage = StoryP5();
      });
    }
    else if (currentPage == 'storyP6') {
      setState(() {
        showPage = StoryP6();
      });
    }
    else if (currentPage == 'questions') {
      setState(() {
        showPage = Questions();
      });
    }
    else {
      setState(() {
        showPage = StoryQuiz();
      });
    }
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animalogy',
      home: AnimatedSplashScreen(
        backgroundColor: Color(0xFFf9f5f1),
        splashIconSize: 80,
        splash: 'assets/logo.png',
        nextScreen: currentPage != null ? showPage : const FirstPage() ,
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
      ),
    );
  }
}