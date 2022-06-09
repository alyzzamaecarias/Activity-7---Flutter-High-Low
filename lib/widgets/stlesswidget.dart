import '../intropage/howtoplay.dart';
import '../mobile/portrait.dart';
import 'responsivewidget.dart';
import '../web/landscape.dart';
import 'package:flutter/material.dart';

class Textbutton2 extends StatelessWidget {
  const Textbutton2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white, //background color of button
        side: BorderSide(width: 5, color: Colors.red), //border width and color
        elevation: 3, //elevation of button
        fixedSize: const Size(50, 50),
        shape: const CircleBorder(
            //to set border radius to button

            ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HowToPlay()));
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
    );
  }
}

class Textbutton1 extends StatelessWidget {
  const Textbutton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.redAccent, //background color of button
        side:
            BorderSide(width: 5, color: Colors.white), //border width and color
        elevation: 3, //elevation of button
        shape: RoundedRectangleBorder(
            //to set border radius to button
            borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondScreen()));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'New Game',
          style: TextStyle(
            fontFamily: 'Com',
            letterSpacing: 3.0,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Imagewidget extends StatelessWidget {
  const Imagewidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/front_card3.gif',
      height: 400,
      width: 200,
      fit: BoxFit.fitWidth,
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 120, 198, 241),
            Color.fromARGB(255, 233, 153, 248),
            Color.fromARGB(255, 120, 198, 241)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const SafeArea(
          child: ResponsiveWidget(
            mobile: MobileMode(),
            desktop: DesktopMode(),
          ),
        ),
      ),
    );
  }
}

class DesktopMod extends StatefulWidget {
  const DesktopMod({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopMod> createState() => _DesktopModState();
}

class _DesktopModState extends State<DesktopMod> {
  @override
  Widget build(BuildContext context) {
    return const LandscapeMode();
  }
}

class LandscapeMode extends StatelessWidget {
  const LandscapeMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
      Padding(
        padding: EdgeInsets.fromLTRB(50, 450, 50, 300),
      ),
      Expanded(
        child: Imagewidget(),
      ),
      SizedBox(width: 12.50),
      Expanded(
        child: Textbutton1(),
      ),
      SizedBox(width: 12.50),
      Expanded(
        child: Textbutton2(),
      ),
    ]);
  }
}

class MobileMod extends StatelessWidget {
  const MobileMod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: PortraitMode(),
    );
  }
}

class PortraitMode extends StatelessWidget {
  const PortraitMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
        SizedBox(height: 12.50),
        Expanded(
          child: Imagewidget(),
        ),
        SizedBox(height: 12.50),
        Expanded(
          child: Textbutton1(),
        ),
        SizedBox(height: 12.50),
        Expanded(
          child: Textbutton2(),
        ),
      ],
    );
  }
}

class Flipcard extends StatefulWidget {
  final String imgpath;
  const Flipcard({required Key key, required this.imgpath}) : super(key: key);

  @override
  State<Flipcard> createState() => _FlipcardState();
}

class _FlipcardState extends State<Flipcard> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imgpath,
      key: ValueKey<String>(widget.imgpath),
      height: 200,
      width: 100,
      fit: BoxFit.fill,
    );
  }
}

class FlipcardMobile extends StatefulWidget {
  const FlipcardMobile({Key? key, required this.imagpath}) : super(key: key);
  final String imagpath;

  @override
  State<FlipcardMobile> createState() => _FlipcardMobileState();
}

class _FlipcardMobileState extends State<FlipcardMobile> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagpath,
      key: ValueKey<String>(widget.imagpath),
      height: 100,
      width: 50,
      fit: BoxFit.fill,
    );
  }
}
