import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextPost extends StatelessWidget {
  final String postContent = 'Flutter allows developers to build apps '
      'for multiple platforms (iOS, Android, web, and desktop) from a single codebase, '
      'saving time and resources.';

  final String postContent2='Hot Reload enables real-time code changes to be reflected i'
      'nstantly without restarting the app, speeding up the development and testing process.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(postContent),
              ],
            )

          ),
          ElevatedButton(
            onPressed: () {
              Share.share('Check out this text: $postContent');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              minimumSize: Size(300, 50), // Width and height
            ),
            child: Text('Share',style: TextStyle(color: Colors.white),),
          ),
          SizedBox(height: 35,),
          Text(postContent2),
          SizedBox(height: 35,),
          ElevatedButton(
            onPressed: () {
              Share.share('Check out this text: $postContent2');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              minimumSize: Size(300, 50), // Width and height
            ),
            child: Text('Share',style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}