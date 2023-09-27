// import 'package:animalogy/Home/NavigationPage.dart';
// import 'package:animalogy/ThemeColor.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttermoji/fluttermoji.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);
//
//   @override
//   _DashboardState createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//
//   // late ConfettiController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     // _controller = ConfettiController(duration: const Duration(seconds: 5));
//     //   _controller.play();
//
//     //  storing to localdata
//     storePageData();
//
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//   }
//
//   Future<void> storePageData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('currentPage', 'dashboard');
//     final String? action = prefs.getString('currentPage');
//     print(action);
//   }
//
//   @override
//   void dispose() {
//     //   _controller.dispose();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kContainerColor,
//         body: SingleChildScrollView(
//             child: Center(
//               child: Column(
//                 children: <Widget>[
//                 //   ConfettiWidget(
//                 //   confettiController: _controller,
//                 //   blastDirectionality: BlastDirectionality.explosive,
//                 //   particleDrag: 0.05,
//                 //   emissionFrequency: 0.01,
//                 //   numberOfParticles: 50,
//                 //   gravity: 0.05,
//                 //   shouldLoop: true,
//                 //   colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple]
//                 // ), // manually specify the colors to be used
//                   SizedBox(height: 80,),
//                   Text("Welcome to", textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: kPurpleColor),),
//                   SizedBox(height: 10,),
//                   Text("Animalogy", textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: kYellowColor),),
//                   SizedBox(height: 40,),
//                   FluttermojiCircleAvatar(
//                     backgroundColor: Colors.grey[400],
//                     radius: 150,
//                   ),
//                   SizedBox(height: 50,),
//                   InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage()));
//                       },
//                       borderRadius: BorderRadius.circular(30),
//                       splashColor: kThemeColor,
//                       child: Container(
//                         height: 60,
//                         width: 200,
//                         padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.black,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               "Let's Begin",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               ),
//                             ),
//                             SizedBox(width: 12,),
//                             Icon(Icons.arrow_circle_right, color: Colors.white, size: 40,)
//                           ],
//                         ),
//                       )
//                   ),
//                 ],
//               ),
//             )
//         )
//     );
//   }
// }

import 'package:animalogy/Home/NavigationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animalogy/ThemeColor.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'dashboard');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kContainerColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: kPurpleColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Animalogy",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: kYellowColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            FluttermojiCircleAvatar(
              backgroundColor: Colors.grey[400],
              radius: 150,
            ),
            SizedBox(height: screenHeight * 0.1),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigationPage()),
                );
              },
              borderRadius: BorderRadius.circular(30),
              splashColor: kThemeColor,
              child: Container(
                height: 60,
                width: 200,
                padding: EdgeInsets.all(10),
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
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.arrow_circle_right,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
