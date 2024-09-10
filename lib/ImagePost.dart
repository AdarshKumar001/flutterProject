import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class ImagePostController extends GetxController {
  // Method to share the image URL
  void shareImage(String url) {
    Share.share(url);
  }
}
class ImagePost extends StatelessWidget {
  final String imageUrl = 'https://cloudinary-marketing-res.cloudinary.com/images/w_1000,c_scale/v1679921049/'
      'Image_URL_header/Image_URL_header-png?_i=AA';

  final String imageUrl2 = 'https://images.squarespace-cdn.com/content/v1/60f1a490a90ed8713c41c36c/1629223610791'
      '-LCBJG5451DRKX4WOB4SP/37-design-powers-url-structure.jpeg';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagePostController>(
      init: ImagePostController(), // Initialize the controller
      builder: (controller) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // First image
                Image.network(imageUrl),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    controller.shareImage(imageUrl);  // Use the controller to share the image
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    minimumSize: Size(300, 50), // Width and height
                  ),
                  child: Text('Share First Image', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 80),

                // Second image
                Image.network(imageUrl2),
                SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    controller.shareImage(imageUrl2);  // Use the controller to share the second image
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Background color
                    minimumSize: Size(300, 50), // Width and height
                  ),
                  child: Text('Share Second Image', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
