import 'package:animalogy/Home/StorySecond.dart';
import 'package:animalogy/Story1/StoryP2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryP1 extends StatefulWidget {
  const StoryP1({Key? key}) : super(key: key);

  @override
  State<StoryP1> createState() => _StoryP1State();
}

class _StoryP1State extends State<StoryP1> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  bool standardSelected = false;

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

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // animation =
    //     CurvedAnimation(parent: animationController, curve: Curves.elasticOut);

    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0.0, end: -300.0).animate(animationController)
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
    await prefs.setString('currentPage', 'storyP1');
    final String? action = prefs.getString('currentPage');
    print(action);
  }

  Future<void> play() async {
    await player.setAsset('assets/audio/3.m4a');
    player.play();
    setState(() {
      playing = true;
    });
  }

  Future<void> pause() async {
    await player.setAsset('assets/audio/3.m4a');
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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFca8c42),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Stack(children: <Widget>[
              const Center(
                child: Image(
                      image: AssetImage('assets/Backgrounds/3.png'),
                      alignment: Alignment.center,
                      fit: BoxFit.cover
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         primary: kDefaultIconLightColor,
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 10, vertical: 10),
                  //         textStyle: const TextStyle(
                  //             fontSize: 15, fontWeight: FontWeight.bold)),
                  //     onPressed: () {
                  //       pause();
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => StorySecond()));
                  //     },
                  //     child: const Text(
                  //       'Previous',
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StorySecond()));
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
                            : const Icon(Icons.play_arrow, size: 35, color: Colors.white,),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StoryP2()));
                      },
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         primary: kDefaultIconLightColor,
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 10, vertical: 10),
                  //         textStyle: const TextStyle(
                  //             fontSize: 15, fontWeight: FontWeight.bold)),
                  //     onPressed: () {
                  //       pause();
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => StoryP2()));
                  //     },
                  //     child: const Text(
                  //       'Next',
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Align(
                  // alignment: AlignmentDirectional(0, 0.7),
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: const Offset(-150, 100),
                    child: FadeTransition(
                      opacity: animationController,
                      child: ScaleTransition(
                        scale: animationController,
                        child: Container(
                          height: 200,
                          width: 220,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/Meerkat/Neutral-left.png'),
                              ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ]),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Align(
          //       alignment: Alignment.bottomLeft,
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             primary: kDefaultIconLightColor,
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 10, vertical: 10),
          //             textStyle: const TextStyle(
          //                 fontSize: 15, fontWeight: FontWeight.bold)),
          //         onPressed: () {
          //           pause();
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => StorySecond()));
          //         },
          //         child: const Text(
          //           'Previous',
          //           style: TextStyle(
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Align(
          //       alignment: Alignment.center,
          //       child: IconButton(
          //           onPressed: () async {
          //             playPause();
          //           },
          //           icon: playing
          //               ? Icon(
          //             Icons.pause,
          //             color: Colors.black,
          //           )
          //               : Icon(
          //             Icons.play_arrow,
          //             color: Colors.black,
          //           )),
          //     ),
          //     Align(
          //       alignment: Alignment.bottomRight,
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             primary: kDefaultIconLightColor,
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 10, vertical: 10),
          //             textStyle: const TextStyle(
          //                 fontSize: 15, fontWeight: FontWeight.bold)),
          //         onPressed: () {
          //           pause();
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => StoryP2()));
          //         },
          //         child: const Text(
          //           'Next',
          //           style: TextStyle(
          //             color: Colors.black,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}