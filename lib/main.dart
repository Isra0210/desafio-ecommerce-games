import 'package:flutter/material.dart';
import 'package:games/app/controller/controller.dart';
import 'package:games/app/home/home_view.dart';
import 'package:get/get.dart';

void main() {
  Get.put(Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
