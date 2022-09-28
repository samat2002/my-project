import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/navigator_button.dart';
import 'package:flutter_application_1/screen/homepage.dart';
import 'package:flutter_application_1/screen/registry_screen.dart';

import '../components/image.dart';
import '../constant.dart';
import 'log_in_screen.dart';

class MainScreen extends StatefulWidget {
  static const id = 'MainScreen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation animationColor;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 2), upperBound: 1);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animationColor = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(animationController);
    animationController.reverse(from: 1);
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const MainImage(),
                  const SizedBox(
                    height: 15,
                  ),
                  AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText("MyAnimeList", textStyle: headstyle),
                  ])
                ],
              ),
              const NavigatorButton(
                  text: "Log-in", navigatorNamed: SignInScreen.id),
              const NavigatorButton(
                  text: "Sig-up", navigatorNamed: RegistryScreen.id),
              const NavigatorButton(
                  text: "Entry without log-in", navigatorNamed: AnimeApp.id),
            ],
          ),
        ),
      ),
    );
  }
}
