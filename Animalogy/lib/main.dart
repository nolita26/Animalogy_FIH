import 'package:animalogy/Dashboard.dart';
import 'package:animalogy/Home/AvatarCreator.dart';
import 'package:animalogy/Home/FirstPage.dart';
import 'package:animalogy/Home/HomePage.dart';
import 'package:animalogy/Home/NavigationPage.dart';
import 'package:animalogy/Story1/BeginStory1.dart';
import 'package:animalogy/Story2/BeginStory2.dart';
import 'package:animalogy/Story3/BeginStory3.dart';
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
  String username = '';
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
    //widget.username = userDataModel.getUsername();
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
    else if (currentPage == 'homePage') {
      setState(() {
        showPage = HomePage({widget.username});
      });
    }
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
    else if (currentPage == 'navigationPage') {
      setState(() {
        showPage = NavigationPage();
      });
    }
    else if (currentPage == 'beginstoryP1') {
      setState(() {
        showPage = BeginStoryP1();
      });
    }
    else if (currentPage == 'beginstoryP2') {
      setState(() {
        showPage = BeginStoryP2();
      });
    }
    else if (currentPage == 'beginstoryP3') {
      setState(() {
        showPage = BeginStoryP3();
      });
    }
    else {
      setState(() {
        showPage = FirstPage();
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