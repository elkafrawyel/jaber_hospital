import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../general/constants/MyColors.dart';
import '../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../general/widgets/GenScaffold.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  String videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterFly.mp4';
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
    _controller.setVolume(1.0);
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GeneralScaffold(
        back: true,
        title: "التعليم",
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done&& _controller.value.isInitialized) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: (){
                              if(_controller.value.isPlaying){
                                _controller.pause();
                              } else{
                                _controller.play();
                              }
                              setState(() {});
                            },
                            child: Icon(_controller.value.isPlaying? Icons.pause_circle: Icons.play_circle,
                                color: MyColors.primary, size: 36,),
                          ),
                        )
                      ],
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(height: 16.0),
              DefaultButton(
                height: 38,
                title: "تم الإنتهاء",
                onTap: () async {},
                margin: const EdgeInsets.symmetric(horizontal: 56, vertical: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
