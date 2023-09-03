import 'package:animalogy/Story1/StoryP5.dart';
import 'package:animalogy/Story1/StoryQuiz.dart';
import 'package:animalogy/ThemeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryP6 extends StatefulWidget {
  const StoryP6({Key? key}) : super(key: key);

  @override
  State<StoryP6> createState() => _StoryP6State();
}

class _StoryP6State extends State<StoryP6> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  late double width;
  late double height;
  late AudioPlayer player;
  bool playing = false;
  bool animate = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    play();
    playing = true;

    //  storing to localdata
    storePageData();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
    Tween<double>(begin: 0.0, end: -300.0).animate(animationController)
      ..addListener(() {
        setState(() {
          animate = true;
        });
      });
    animationController.forward();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  Future<void> storePageData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentPage', 'storyP6');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  Future<void> play() async {
    await player.setAsset('assets/audio/8.m4a');
    player.play();
    setState(() {
      playing = true;
    });
  }

  Future<void> pause() async {
    await player.setAsset('assets/audio/8.m4a');
    player.pause();
    setState(() {
      playing = false;
    });
  }

  Future<void> resume() async {
    player.play();
    setState(() {
      playing = true;
    });
  }

  void playPause() {
    if (playing) {
      pause();
    } else {
      resume();
    }
  }

  @override
  void dispose() {
    player.dispose();
    animationController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kContainerColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(children: <Widget>[
            const AspectRatio(
              aspectRatio: 3.77 / 2,
              child: Image(
                  image: AssetImage('assets/Backgrounds/8.png'),
                  alignment: Alignment.center,
                  fit: BoxFit.fill),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0.7),
              child: Transform.translate(
                offset: const Offset(0, 150),
                child: FadeTransition(
                  opacity: animationController,
                  child: ScaleTransition(
                    scale: animationController,
                    child: Container(
                      height: 180,
                      width: 220,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Meerkat/Neutral.png'),
                          )),
                    ),
                  ),
                ),
              ),
            ),

            /*Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        onPressed: () {
                          animationController.forward();
                        },
                        child: const Text('Tap',
                        style: TextStyle(
                          color: Colors.transparent,
                        ),),
                        ),
                      ),*/
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: kDefaultIconLightColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    pause();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StoryP5()));
                  },
                  child: const Text(
                    'Previous',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                    onPressed: () async {
                      playPause();
                    },
                    icon: playing
                        ? Icon(
                      Icons.pause,
                      color: Colors.black,
                    )
                        : Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    )),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: kDefaultIconLightColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    pause();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StoryQuiz()));
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}