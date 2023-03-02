import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Home/HomePage.dart';
import 'package:fluttermoji/fluttermoji.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFf9f5f1),
          elevation: 0,
        ),
        backgroundColor: Color(0xFFf9f5f1),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50,),
                Text("Welcome to Animalogy!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: kPurpleColor),),
                SizedBox(height: 20,),
                Image.asset('assets/wow-image.png', width: 400.0, height: 200.0,),
                SizedBox(height: 30,),
                Text("Enter your Name...", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: kPurpleColor),),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your name',
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => HomePage(nameController.text)));
                    // login();
                  },
                  borderRadius: BorderRadius.circular(30),
                  splashColor: kThemeColor,
                  child: Container(
                    height: 50,
                    width: 120,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kYellowColor,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_rounded, color: Colors.white,),
                        ],
                      ),
                    )
                  ),
              ],
            ),
          ),
        )
    );
  }
}
