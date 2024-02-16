import 'package:flutter/material.dart';
import 'package:xo_game/board_screen.dart';
import 'package:xo_game/login_screen.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        BoardScreen.routeName: (_) => const BoardScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
