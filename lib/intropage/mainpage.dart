import 'package:flutter/material.dart';
import 'package:hi_lo_cardgame/web/landscape.dart';
import '../widgets/responsivewidget.dart';
import '../widgets/stlesswidget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Center(
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ScaleAnimatedText(
                  widget.title,
                  textStyle: const TextStyle(
                    fontFamily: 'Com',
                    color: Colors.white,
                    fontSize: 50.0,
                    letterSpacing: 8.0,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Color.fromARGB(255, 209, 47, 28),
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/header5.gif",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("ALYZZA MAE G. CARIAS (Developer)"),
                accountEmail: Text("alyzzamae.carias@bisu.edu.ph"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/developer.jpg"),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/header4.gif',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text("\nAbout Hi-Lo"),
                subtitle: Text(
                    '\n\nHi-Lo, or High-Low, is a fairly simple card game. It uses a standard deck of 52 cards, and it has players guess whether a certain card is higher or lower than one showing on the table.',
                    textAlign: TextAlign.justify),
                trailing: Icon(Icons.lightbulb),
                dense: false,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: ResponsiveWidget(
            mobile: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                MobileMod(),
              ],
            ),
            desktop: const DesktopMod(),
          ),
        ),
      ),
    );
  }
}

/*
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
*/
