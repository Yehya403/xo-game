import 'package:flutter/material.dart';

typedef OnPlayerClickCallBack = void Function(int);

class BoardButton extends StatelessWidget {
  String buttonText;
  OnPlayerClickCallBack onPlayerClickCallBack;
  int pos;

  BoardButton(this.buttonText,
      {super.key, required this.onPlayerClickCallBack, required this.pos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => onPlayerClickCallBack(pos),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
