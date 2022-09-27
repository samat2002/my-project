import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/text_input.dart';
import 'package:flutter_application_1/constant.dart';

import 'package:path/path.dart' as p;

import '../components/image.dart';
import 'log_in_screen.dart';

class RegistryScreen extends StatefulWidget {
  static const id = 'RegistryScreen';
  const RegistryScreen({Key? key}) : super(key: key);

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  late File _avatar;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String username;
  void _pickedImageFile({required File pickedImageFile}) {
    _avatar = pickedImageFile;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('RegistryScreen')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const MainImage()),
                    const Text('Create a new account', style: headstyle),
                  ],
                ),
              ),
            ),
            // UserImagePicker(
            //   callback: _pickedImageFile,
            // ),
            MyTextInput(
              hintText: 'Enter your username',
              onChanged: (value) {
                username = value;
              },
            ),
            MyTextInput(
              hintText: 'Enter your email',
              onChanged: (value) {
                email = value;
              },
            ),
            MyTextInput(
              hintText: 'Enter your password',
              onChanged: (value) {
                password = value;
              },
            ),
            MyButton(
              text: 'Next',
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                  if (userCredential.user != null) {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(email)
                        .set({
                      'username': username,
                      'uid': userCredential.user!.uid,
                    });
                    if (!mounted) return;
                    Navigator.pushNamed(context, SignInScreen.id);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    log('The password provider is to weak.');
                  } else if (e.code == 'email-already-in-use') {
                    log('The account already exists for that email.');
                  } else {
                    log(e.toString());
                  }
                } catch (e) {
                  log(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
