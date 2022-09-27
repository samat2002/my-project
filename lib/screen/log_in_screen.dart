import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/image.dart';

import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../components/input_with_error_text.dart';
import '../components/my_button.dart';
import '../components/my_text_input_with_error_text.dart';
import '../constant.dart';
import 'homepage.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // ignore: prefer_final_fields
  InputWithErrorText _email = InputWithErrorText();
  // ignore: prefer_final_fields
  InputWithErrorText _password = InputWithErrorText();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('SignInScreen')),
        body: ProgressHUD(
          child: Builder(
            builder: (BuildContext context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MainImage(),
                      const SizedBox(
                        width: 10,
                      ),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText('Sign-in', textStyle: headstyle),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                MyTextInputWithErrorText(
                  input: _email,
                  hintText: 'Enter your email',
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                MyTextInputWithErrorText(
                  input: _password,
                  hintText: 'Enter your password',
                  obscureText: true,
                  textInputType: TextInputType.text,
                ),
                MyButton(
                  text: 'Next',
                  onPressed: () async {
                    final progress = ProgressHUD.of(context);
                    progress?.showWithText('Loading...');
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email.valueText,
                          password: _password.valueText);
                      if (!mounted) return;
                      Navigator.pushNamed(context, AnimeApp.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        //log('No user found for that email.');
                        _email.errorText = 'No user found for that email.';
                      } else if (e.code == 'wrong-password') {
                        //log('Wrong password provided for that user.');
                        _password.errorText =
                            'Wrong password provided for that user.';
                      } else {
                        //log(e.toString());
                        _email.errorText = e.toString();
                      }
                    } catch (e) {
                      log(e.toString());
                    }
                    setState(() {});
                    progress?.dismiss();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
