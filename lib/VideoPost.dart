import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';



class VideoPostController extends GetxController {
  late YoutubePlayerController youtubeController1;
  late YoutubePlayerController youtubeController2;

  @override
  void onInit() {
    super.onInit();

    // First video URL
    final videoId1 = YoutubePlayer.convertUrlToId('https://youtu.be/kfXy4W0aD40?si=BX2w61Wu9hGY56rj');
    youtubeController1 = YoutubePlayerController(
      initialVideoId: videoId1!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    // Second video URL
    final videoId2 = YoutubePlayer.convertUrlToId('https://youtu.be/LK7-_dgAVQE?si=iZzAV7qSHG90wpsg');
    youtubeController2 = YoutubePlayerController(
      initialVideoId: videoId2!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  // Sharing function
  void shareVideo(String url) {
    Share.share(url);
  }

  @override
  void onClose() {
    // Dispose of controllers
    youtubeController1.dispose();
    youtubeController2.dispose();
    super.onClose();
  }
}
class VideoPost extends GetView<VideoPostController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPostController>(
      init: VideoPostController(), // Initialize controller
      builder: (controller) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // First video player
                YoutubePlayer(
                  controller: controller.youtubeController1,
                  showVideoProgressIndicator: true,
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    controller.shareVideo('https://youtu.be/kfXy4W0aD40?si=BX2w61Wu9hGY56rj');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    minimumSize: Size(300, 50), // Width and height
                  ),
                  child: Text('Share First Video', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 35),

                // Second video player
                YoutubePlayer(
                  controller: controller.youtubeController2,
                  showVideoProgressIndicator: true,
                ),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    controller.shareVideo('https://youtu.be/LK7-_dgAVQE?si=iZzAV7qSHG90wpsg');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    minimumSize: Size(300, 50), // Width and height
                  ),
                  child: Text('Share Second Video', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
