import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'intropage/mainpage.dart';
import 'widgets/suitswidget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
  addSuitsP1();
  deckListShuffleP1();
  addSuitsCPU();
  deckListShuffleCPU();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hi-Lo CardGame',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Hi-Lo Card Game'),
      debugShowCheckedModeBanner: false,
      color: Colors.blueAccent,
      //scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}
