import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../general/widgets/GenScaffold.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  String videoUrl = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
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
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(_controller),
                      ),
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
