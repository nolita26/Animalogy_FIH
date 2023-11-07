import 'package:animalogy/Story3/ChatPage.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio/just_audio.dart';
import '../ThemeColor.dart';

class DarkPage extends StatefulWidget {
  const DarkPage({Key? key}) : super(key: key);

  @override
  State<DarkPage> createState() => _DarkPageState();
}

class _DarkPageState extends State<DarkPage> {

  late double width;
  late double height;
  late AudioPlayer player;
  bool playing = false;

  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
    play();
    playing = true;
  }

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'darkPage');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  Future<void> play() async {
    await player.setAsset('assets/audio/dark_sound.mp3');
    player.play();
    setState(() {
      playing = true;
    });
  }

  Future<void> pause() async {
    await player.setAsset('assets/audio/dark_sound.mp3');
    player.pause();
    setState(() {
      playing = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Flexible(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('assets/Backgrounds/dark_room.png'),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 100, 28, 250),
                  child: Container(
                    color: Colors.transparent, // Change the color as desired
                    child: Center(
                      child: TypewriterAnimatedTextKit(
                        text: const ['When your friend reach the house, they got drugged and kidnapped. You never heard from them again!'],
                        textStyle: const TextStyle(fontSize: 22.5, color: Colors.white, fontWeight: FontWeight.w600,),
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 100),
                        /*totalRepeatCount: 1,*/
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0.7),
                child: InkWell(
                    onTap: () {
                      pause();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
                    },
                    borderRadius: BorderRadius.circular(30),
                    splashColor: kThemeColor,
                  child: Container(
                    height: 50,
                    width: 120,
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back_outlined, color: Colors.white,),
                        SizedBox(width: 10),
                        Text('Back',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
