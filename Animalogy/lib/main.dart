import 'package:animalogy/Dashboard.dart';
import 'package:animalogy/Home/AvatarCreator.dart';
import 'package:animalogy/Home/FirstPage.dart';
import 'package:animalogy/Home/StorySecond.dart';
import 'package:animalogy/Story1/Questions.dart';
import 'package:animalogy/Story1/StoryP1.dart';
import 'package:animalogy/Story1/StoryP2.dart';
import 'package:animalogy/Story1/StoryP3.dart';
import 'package:animalogy/Story1/StoryP4.dart';
import 'package:animalogy/Story1/StoryP5.dart';
import 'package:animalogy/Story1/StoryP6.dart';
import 'package:animalogy/Story1/StoryQuiz.dart';
import 'package:animalogy/Story2/BeginStory2.dart';
import 'package:animalogy/Story2/Story2P1.dart';
import 'package:animalogy/Story2/Story2P10.dart';
import 'package:animalogy/Story2/Story2P11.dart';
import 'package:animalogy/Story2/Story2P12.dart';
import 'package:animalogy/Story2/Story2P13.dart';
import 'package:animalogy/Story2/Story2P14.dart';
import 'package:animalogy/Story2/Story2P15.dart';
import 'package:animalogy/Story2/Story2P2.dart';
import 'package:animalogy/Story2/Story2P3.dart';
import 'package:animalogy/Story2/Story2P4.dart';
import 'package:animalogy/Story2/Story2P5.dart';
import 'package:animalogy/Story2/Story2P6.dart';
import 'package:animalogy/Story2/Story2P7.dart';
import 'package:animalogy/Story2/Story2P8.dart';
import 'package:animalogy/Story2/Story2P9.dart';
import 'package:animalogy/Story3/BeginStory3.dart';
import 'package:animalogy/Story3/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animalogy/Home/StoryFirst.dart';
import 'package:sizer/sizer.dart';

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

  late double width;
  late double height;

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
    else if (currentPage == 'storyQuiz') {
      setState(() {
        showPage = StoryQuiz();
      });
    }
    else if (currentPage == 'questions') {
      setState(() {
        showPage = Questions();
      });
    }
    else if (currentPage == 'beginstoryP2') {
      setState(() {
        showPage = BeginStoryP2();
      });
    }
    else if (currentPage == 'questions') {
      setState(() {
        showPage = Questions();
      });
    }
    else if (currentPage == 'story2P1') {
      setState(() {
        showPage = Story2P1();
      });
    }
    else if (currentPage == 'story2P2') {
      setState(() {
        showPage = Story2P2();
      });
    }
    else if (currentPage == 'story2P3') {
      setState(() {
        showPage = Story2P3();
      });
    }
    else if (currentPage == 'story2P4') {
      setState(() {
        showPage = Story2P4();
      });
    }
    else if (currentPage == 'story2P5') {
      setState(() {
        showPage = Story2P5();
      });
    }
    else if (currentPage == 'story2P6') {
      setState(() {
        showPage = Story2P6();
      });
    }
    else if (currentPage == 'story2P7') {
      setState(() {
        showPage = Story2P7();
      });
    }
    else if (currentPage == 'story2P8') {
      setState(() {
        showPage = Story2P8();
      });
    }
    else if (currentPage == 'story2P9') {
      setState(() {
        showPage = Story2P9();
      });
    }
    else if (currentPage == 'story2P10') {
      setState(() {
        showPage = Story2P10();
      });
    }
    else if (currentPage == 'story2P11') {
      setState(() {
        showPage = Story2P11();
      });
    }else if (currentPage == 'story2P12') {
      setState(() {
        showPage = Story2P12();
      });
    }else if (currentPage == 'story2P13') {
      setState(() {
        showPage = Story2P13();
      });
    }
    else if (currentPage == 'story2P14') {
      setState(() {
        showPage = Story2P14();
      });
    }
    else if (currentPage == 'story2P15') {
      setState(() {
        showPage = Story2P15();
      });
    }else if (currentPage == 'beginstoryP3') {
      setState(() {
        showPage = BeginStoryP3();
      });
    }
    else {
      setState(() {
        showPage = ChatPage();
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
    return Sizer(
        builder: (context, orientation, deviceType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Animalogy',
        home: AnimatedSplashScreen(
          backgroundColor: Color(0xFFf9f5f1),
          splashIconSize: 80,
          splash: 'assets/logo.png',
          nextScreen: currentPage != null ? showPage : const FirstPage(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 3000,
        ),
      );

  });
  }
}