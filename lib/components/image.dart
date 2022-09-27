import 'package:flutter/material.dart';

import '../constant.dart';

class TextInput extends StatelessWidget {
  const TextInput({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: textmargin,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: text,
        ),
      ),
    );
  }
}

class MainImage extends StatelessWidget {
  const MainImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 200,
        child: Hero(
            tag: 'logo',
            child: Image.network(
                'data:image/png;base64,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')));
  }
}