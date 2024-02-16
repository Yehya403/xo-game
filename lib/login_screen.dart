import 'package:flutter/material.dart';

import 'board_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginSc';
  String player1Name = '';
  String player2Name = '';

  LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Welcome'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Player 1 Name"),
              onChanged: (newText) {
                player1Name = newText;
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Player 2 Name"),
              onChanged: (newText) {
                player2Name = newText;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(BoardScreen.routeName,
                      arguments: BoardScreenArgs(player1Name, player2Name));
                },
                child: const Text('Start the game')),
          ],
        ),
      ),
    );
  }
}
