import 'package:flutter/material.dart';
import '../widgets/responsivewidget.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 120, 198, 241),
            Color.fromARGB(255, 239, 182, 249),
            Color.fromARGB(255, 215, 241, 120)
          ])),
      child: Scaffold(
        body: SafeArea(
          child: ResponsiveWidget(
            mobile: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 60)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 375,
                      width: 325,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(20),
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      width: 5, color: Colors.blue)) +
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side:
                                      BorderSide(width: 5, color: Colors.red))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: const [
                            Padding(padding: EdgeInsets.all(20.0)),
                            Text(
                              'How To Play:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Com',
                                fontSize: 20,
                                letterSpacing: 7.0,
                                color: Colors.black,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(15.0)),
                            Text(
                              'To begin, press one of the two buttons to guess whether the following card is high or low.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'IndieFlower',
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(15.0)),
                            Text(
                              'If you guess it right, be sure to click or press the next button first to continue the game till you lose by not guessing it.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'IndieFlower',
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, //background color of button
                    side: BorderSide(
                        width: 3, color: Colors.red), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Com',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            desktop: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 400,
                        width: 550,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                        width: 5, color: Colors.blue)) +
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        width: 5, color: Colors.red))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: const [
                              Padding(padding: EdgeInsets.all(20.0)),
                              Text(
                                'How To Play:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Com',
                                  fontSize: 30,
                                  letterSpacing: 9.0,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(20.0)),
                              Text(
                                'To begin, press one of the two buttons to guess whether the following card is high or low.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'IndieFlower',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(20.0)),
                              Text(
                                'If you guess it right, be sure to click or press the next button first to continue the game till you lose by not guessing it.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'IndieFlower',
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(30.00)),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white, //background color of button
                    side: BorderSide(
                        width: 3, color: Colors.red), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Com',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.blue.withOpacity(0.3),
      ),
    );
  }
}
