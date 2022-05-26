import 'package:firebase_chat_app/screens/login_screen.dart';
import 'package:firebase_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_chat_app/components/workButtons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_Screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      // upperBound: 100.0, we dont need upperbound for using curve animation
      duration: Duration(seconds: 5),
    );

    //animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);

    controller.forward();
    // controller.reverse(from: 1.0);

    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  // if we use that animation running we have to dispose it with this mehtod
  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.greenAccent,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            WorkButtons(
              color: Colors.lightBlueAccent,
              onTap: () {
                //Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: Text("Login"),
            ),
            WorkButtons(
              color: Colors.blueAccent,
              onTap: () {
                //Go to login screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              text: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}


//  () {
//             //Go to login screen.
//             Navigator.pushNamed(context, LoginScreen.id);
//           },