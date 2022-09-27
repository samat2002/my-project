import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class NavigatorButton extends StatelessWidget {
  final String text;
  final String navigatorNamed;
  const NavigatorButton(
      {Key? key, required this.text, required this.navigatorNamed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextButton(
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
          backgroundColor: MaterialStateProperty.all(Colors.blue[300]),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {
          assetsAudioPlayer.open(
            Audio("assets/audios/Mouse Click.mp3"),
          );
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, navigatorNamed);
        },
        child: Text(text),
      ),
    );
  }
}
