import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:animalogy/Home/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../UserDataModel.dart';

UserDataModel userDataModel = UserDataModel();

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  late double width;
  late double height;

  TextEditingController nameController = TextEditingController();

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'firstPage');
    final String? action = prefs.getString('currentPage');
    print(action);

    userDataModel.setUsername(nameController.text);
  }

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

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFf9f5f1),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFf9f5f1),
        body: SingleChildScrollView(
       //   child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50,),
                const Text(
                  "Welcome to Animalogy!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kPurpleColor),
                ),
                const SizedBox(height: 20,),
                Image.asset('assets/wow-image.png', width: 400.0, height: 200.0,),
                const SizedBox(height: 30,),
                const Text(
                  "Enter your Name...",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: kPurpleColor),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your name',
                    ),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 20,),
                InkWell(
                    onTap: () {
                      userDataModel.setUsername(nameController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(nameController.text)));
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: kThemeColor,
                    child: Container(
                      height: 50,
                      width: 120,
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kYellowColor,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
        //  ),
        )
    );
  }
}
