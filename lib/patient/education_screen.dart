import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../general/blocks/user_cubit/user_cubit.dart';
import '../general/constants/MyColors.dart';
import '../general/models/UserModel.dart';
import '../general/utilities/http/dio/http/GenericHttp.dart';
import '../general/utilities/http/dio/modals/LoadingDialog.dart';
import '../general/utilities/tf_custom_widgets/widgets/DefaultButton.dart';
import '../general/utilities/utils_functions/ApiNames.dart';
import '../general/widgets/GenScaffold.dart';
import 'models/update_consent_response.dart';

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
                  if (snapshot.connectionState == ConnectionState.done && _controller.value.isInitialized) {
                    return Column(
                      children: [
                        Stack(
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
                        ),
                        const SizedBox(height: 12,),
                        SizedBox(
                          height: 8,
                          width: double.infinity,
                          child: VideoProgressIndicator(
                            _controller, colors: VideoProgressColors(
                              backgroundColor: Colors.grey,
                              bufferedColor: MyColors.secondary,
                              playedColor: MyColors.primary
                          ),
                            allowScrubbing: true,
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                        ),
                        const SizedBox(height: 28.0),
                        DefaultButton(
                          height: 40,
                          title: "تم الإنتهاء",
                          onTap: () async {
                            await updateWatchClip();
                          },
                          margin: const EdgeInsets.symmetric(horizontal: 56, vertical: 5),
                        ),
                      ],
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a loading spinner.
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateWatchClip() async {
    log('Watched Clip Called...');
    UserModel user = context.read<UserCubit>().state.model;
    UpdateConsentResponse data = await GenericHttp<UpdateConsentResponse>(context).callApi(
      name: "${ApiNames.patientWatchedClipPath}/${user.userData![0].sId}",
      returnType: ReturnType.Model,
      methodType: MethodType.Put,
      returnDataFun: (data) => data,
      toJsonFunc: (json) => UpdateConsentResponse.fromJson(json),
    );
    if(data.success??false){
      CustomToast.showSimpleToast(msg: data.message?.messageAr??"");
      Navigator.of(context).pop();
    } else{
      CustomToast.showSimpleToast(msg: data.message?.messageAr??"");
    }
  }
}
