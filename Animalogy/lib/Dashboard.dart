import 'package:animalogy/Home/NavigationPage.dart';
import 'package:flutter/material.dart';
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
            const Text(
              "Welcome to",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: kPurpleColor,),
            ),
            Image.asset('assets/logo-nobg.png', width: 320.0, height: 100.0,
            ),
            // Text(
            //   "Animalogy",
            //   style: TextStyle(
            //     fontSize: 50,
            //     fontWeight: FontWeight.bold,
            //     color: kYellowColor,
            //   ),
            // ),
            const SizedBox(height: 10),
            FluttermojiCircleAvatar(
              backgroundColor: Colors.grey[400],
              radius: 150,
            ),
            const SizedBox(height: 40),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationPage()));
              },
              borderRadius: BorderRadius.circular(30),
              splashColor: kThemeColor,
              child: Container(
                height: 60,
                width: 200,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Let's Begin",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_circle_right, color: Colors.white, size: 40,)
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
