import 'package:animalogy/Story2/Story2P10.dart';
import 'package:animalogy/Story2/Story2P12.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Story2P11 extends StatefulWidget {
  const Story2P11({Key? key}) : super(key: key);

  @override
  State<Story2P11> createState() => _Story2P11State();
}

class _Story2P11State extends State<Story2P11> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  late double width;
  late double height;
  late AudioPlayer player;
  bool playing = false;
  bool animate = false;
  bool standardSelected = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    play();
    playing = true;

    //  storing to localdata
    storePageData();

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 9));
    animation = Tween<double>(begin: 0.0, end: 300.0).animate(animationController)
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
    await prefs.setString('currentPage', 'story2P11');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  Future<void> play() async {
    await player.setAsset('assets/audio/20.mp3');
    player.play();
    setState(() {
      playing = true;
    });
  }

  Future<void> pause() async {
    await player.setAsset('assets/audio/20.mp3');
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
      backgroundColor: const Color(0xFF855f3c),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Stack(children: <Widget>[
              const Center(
                child: Image(
                    image: AssetImage('assets/Backgrounds/20.png'),
                    alignment: Alignment.center,
                    fit: BoxFit.cover
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      isSelected: standardSelected,
                      icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white, size: 35,),
                      onPressed: () {
                        setState(() {
                          standardSelected = !standardSelected;
                        });
                        pause();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Story2P10()));
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: IconButton(
                        isSelected: standardSelected,
                        onPressed: () async {
                          setState(() {
                            standardSelected = !standardSelected;
                          });
                          playPause();
                        },
                        icon: playing
                            ? const Icon(Icons.pause, size: 35, color: Colors.white,)
                            : const Icon(Icons.play_arrow, size: 35, color: Colors.white,)
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      isSelected: standardSelected,
                      hoverColor: Colors.black.withOpacity(0.8),
                      icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 35,),
                      onPressed: () {
                        setState(() {
                          standardSelected = !standardSelected;
                        });
                        pause();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Story2P12()));
                      },
                    ),
                  ),
                ],
              ),
              Align(
                // alignment: AlignmentDirectional(0, 0.7),
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: const Offset(200, 100),
                  child: FadeTransition(
                    opacity: animationController,
                    child: ScaleTransition(
                      scale: animationController,
                      child: Container(
                        height: 140,
                        width: 220,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Meerkat/Neutral.png'),
                            ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}