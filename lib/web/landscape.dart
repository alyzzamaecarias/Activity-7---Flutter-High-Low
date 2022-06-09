import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import '../intropage/howtoplay.dart';
import '../widgets/stlesswidget.dart';
import '../widgets/suitswidget.dart';

class DesktopMode extends StatefulWidget {
  const DesktopMode({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopMode> createState() => _DesktopModeState();
}

class _DesktopModeState extends State<DesktopMode> {
  int xy = 0;
  int get imagePath => deckList[xy].keys;
  late FlipCardController _controller;
  int _counter = 0;
  int xy1 = 0;
  int get imgpath => deckList1[xy1].keys;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(padding: EdgeInsets.all(5)),
        Expanded(
          flex: 1,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '\nIs it HIGH OR LOW?\n',
                style: TextStyle(
                  fontFamily: 'Com',
                  letterSpacing: 5.0,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 239, 227, 8),
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        height: 200,
                        width: 100,
                        child: Flipcard(
                          imgpath: deckList[xy].imgpath,
                          key: ValueKey<int>(imgpath),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(25)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        height: 200,
                        width: 100,
                        child: FlipCard(
                          speed: 500,
                          controller: _controller,
                          flipOnTouch: false,
                          front: Image.asset(
                            'assets/images/card_back.jpg',
                            fit: BoxFit.fill,
                          ),
                          back: FlipCardDetails(
                            imagePath: deckList1[xy1].imgpath,
                            key: ValueKey<int>(imagePath),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Expanded(
                flex: 0,
                child: const Text(
                  'Choose',
                  style: TextStyle(
                    fontFamily: 'Com',
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Color.fromARGB(255, 239, 227, 8),
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                    color: Colors.black,
                    letterSpacing: 5.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceAround,
                    spacing: 20.0,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.redAccent, //background color of button
                          side: BorderSide(
                              width: 3,
                              color: Colors.white), //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.state?.controller?.forward();
                            if (deckList1[xy1].number >= deckList[xy].number) {
                              _counter++;

                              store.add(deckList1[xy1].imgpath);
                            } else {
                              _counter--;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          width: 3, color: Colors.red)),
                                  title: const Text(
                                      'Oh!No...Your guess is incorrect.'),
                                  content: const Text(
                                      'Game Over!!! Press OK to retry.'),
                                  actions: <Widget>[
                                    OutlinedButton(
                                      onPressed: () {
                                        print('Pressed');
                                        Navigator.popUntil(context, (route) {
                                          return route.settings.name == "/";
                                        });
                                        worldShuffle();
                                        store = [];
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "High",
                            style: TextStyle(
                              fontFamily: 'Dam',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.redAccent, //background color of button
                          side: BorderSide(
                              width: 3,
                              color: Colors.white), //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.state?.controller?.forward();
                            if (deckList1[xy1].number < deckList[xy].number) {
                              _counter++;

                              store.add(deckList1[xy1].imgpath);
                            } else {
                              _counter--;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          width: 3, color: Colors.red)),
                                  title: const Text(
                                      'Oh!No...Your guess is incorrect.'),
                                  content: const Text(
                                      'Game Over!!! Press OK to retry.'),
                                  actions: <Widget>[
                                    OutlinedButton(
                                      onPressed: () {
                                        print('Pressed');
                                        Navigator.popUntil(context, (route) {
                                          return route.settings.name == "/";
                                        });
                                        worldShuffle();
                                        store = [];
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Low",
                            style: TextStyle(
                              fontFamily: 'Dam',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.redAccent, //background color of button
                          side: BorderSide(
                              width: 3,
                              color: Colors.white), //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          setState(() {
                            xy++;
                            xy1++;
                            _controller.state?.controller?.reset();
                            if ((_counter == 52) && (_counter == 52))
                              onPressed:
                              () {
                                Navigator.popUntil(context, (route) {
                                  return route.settings.name == "/";
                                });
                                worldShuffle();
                              };
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontFamily: 'Dam',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, //background color of button
                          side: BorderSide(
                              width: 5,
                              color: Colors.red), //border width and color
                          elevation: 3, //elevation of button
                          fixedSize: const Size(50, 50),
                          shape: const CircleBorder(
                              //to set border radius to button

                              ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HowToPlay()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'i',
                            style: TextStyle(
                              fontFamily: 'Com',
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const Text(
                '\nLast (5) Guess Cards Display',
                style: TextStyle(
                  fontFamily: 'Com',
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 239, 227, 8),
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 400,
                        width: 600,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              Color.fromARGB(255, 244, 199, 207),
                              Color.fromARGB(255, 196, 246, 189),
                              Color.fromARGB(255, 203, 199, 240),
                              Color.fromARGB(255, 245, 247, 195)
                            ],
                          ),
                          border: Border.all(
                            color: Color.fromARGB(255, 243, 208, 242),
                            width: 1,
                          ),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((BuildContext context, int index) {
                            int reverseIndex = store.length - 1 - index;
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 200,
                                    margin:
                                        const EdgeInsets.fromLTRB(25, 5, 10, 5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Image.asset(
                                      store[reverseIndex],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          itemCount: store.length > 5 ? 5 : store.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5)),
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            right: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Score: $_counter',
                            style: const TextStyle(
                              fontFamily: 'Com',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 5)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white, //background color of button
                          side: BorderSide(
                              width: 5,
                              color: Colors.red), //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          setState(() {
                            worldShuffle();
                            Navigator.pop(context);
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontFamily: 'Com',
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
