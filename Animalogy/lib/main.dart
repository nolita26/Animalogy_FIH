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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:device_preview/device_preview.dart';

void main() {
  // await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

// void main() => runApp(
//   DevicePreview(builder: (context) => MyApp()),
// );

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
    super.initState();
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
    if (currentPage == 'firstPage') {
      setState(() {
      showPage = const FirstPage();
      });
    }
    else if (currentPage == 'homePage') {
      setState(() {
        showPage = HomePage({widget.username});
      });
    }
    else if (currentPage == 'avatarCreator') {
      setState(() {
        showPage = const AvatarCreator();
      });
    }
    else if (currentPage == 'dashboard') {
      setState(() {
        showPage = const Dashboard();
      });
    }
    else if (currentPage == 'navigationPage') {
      setState(() {
        showPage = NavigationPage();
      });
    }
    else if (currentPage == 'beginstoryP1' || currentPage == 'storyFirst' || currentPage == 'storySecond' || currentPage == 'storyP1' || currentPage == 'storyP2' || currentPage == 'storyP3' || currentPage == 'storyP4' || currentPage == 'storyP5' || currentPage == 'storyP6' || currentPage == 'storyQuiz' || currentPage == 'quizAnsW1' || currentPage == 'storyQuizAns' || currentPage == 'quizAnsW3' || currentPage == 'quizAnsW4') {
      setState(() {
        showPage = const BeginStoryP1();
      });
    }
    else if (currentPage == 'beginstoryP2' || currentPage == 'questions' || currentPage == 'story2P1' || currentPage == 'story2P2' || currentPage == 'story2P3' || currentPage == 'story2P4' || currentPage == 'story2P5' || currentPage == 'story2P6' || currentPage == 'story2P7' || currentPage == 'story2P8' || currentPage == 'story2P9' || currentPage == 'story2P10' || currentPage == 'story2P11' || currentPage == 'story2P12' || currentPage == 'story2P13' || currentPage == 'story2P14' || currentPage == 'story2P15') {
      setState(() {
        showPage = const BeginStoryP2();
      });
    }
    else if (currentPage == 'beginstoryP3' || currentPage == 'chatPage' || currentPage == 'darkPage') {
      setState(() {
        showPage = const BeginStoryP3();
      });
    }
   else {
      setState(() {
        showPage = const FirstPage();
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          // useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Animalogy',
          home: AnimatedSplashScreen(
            backgroundColor: const Color(0xFFf9f5f1),
            splashIconSize: 80,
            splash: 'assets/logo.png',
            nextScreen: currentPage != null ? showPage : const FirstPage(),
            splashTransition: SplashTransition.fadeTransition,
            duration: 3000,
          ),
        ),
    );
  }
}