import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'ImagePost.dart';
import 'TextPost.dart';
import 'VideoPost.dart';



class HomeController extends GetxController {
  // Variable to track the selected tab index
  var selectedIndex = 0.obs;

  // Method to update the selected tab index
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Post App',
      home: HomeScreen(),
    );
  }
}



class HomeScreen extends StatelessWidget {
  // Initialize the HomeController
  final HomeController homeController = Get.put(HomeController());

  // Define the pages for navigation
  final List<Widget> _pages = <Widget>[
    TextPost(),
    VideoPost(),
    ImagePost(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Obx(
            () => _pages[homeController.selectedIndex.value],  // Observe changes in selectedIndex
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          backgroundColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text'),
            BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'Video'),
            BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
          ],
          currentIndex: homeController.selectedIndex.value,  // Bind currentIndex to the controller
          onTap: homeController.onItemTapped,  // Update selectedIndex when tapped
        ),
      ),
    );
  }
}
