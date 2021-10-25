import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_assignment/controller/profile_controller.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController c = Get.put(ProfileController());

    return Stack(children: [
      Container(
        width: context.width,
        height: context.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF3366FF),
                Color(0xFF00CCFF),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Obx(
          () => CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
            ),
            items: c.items
                .map((item) => Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000)))
                .toList(),
          ),
        ),
      ),
      Positioned(
        top: 10.0,
        left: 10.0,
        child: ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.close_outlined, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
            primary: Colors.blue, // <-- Button color
            onPrimary: Colors.red, // <-- Splash color
          ),
        ),
      ),
      Positioned(
        bottom: 20.0,
        child: SizedBox(
          width: context.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  c.changeItems(c.profile.backgroundImages);
                  c.introduction();
                },
                child: Lottie.network(
                  'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/lottiefiles/dog.json',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                onTap: () {
                  c.changeItems(c.profile.interestImages);
                  c.hobbies();
                },
                child: Lottie.network(
                    'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/lottiefiles/funky_chicken.json',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.fill),
              ),
              GestureDetector(
                onTap: () {
                  c.changeItems(c.profile.teacherImages);
                  c.reviews();
                },
                child: Lottie.network(
                    'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/lottiefiles/favourite_app_icon.json',
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.fill),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
