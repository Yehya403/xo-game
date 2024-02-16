import 'package:flutter/material.dart';
import 'package:xo_game/board_button.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = 'BoardSc';

  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    BoardScreenArgs args =
        ModalRoute.of(context)?.settings.arguments as BoardScreenArgs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('XO Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player1Name}(X)',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'SCORE : $player1Score',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player2Name}(O)',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'SCORE : $player2Score',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  boardState[0],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 0,
                ),
                BoardButton(
                  boardState[1],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 1,
                ),
                BoardButton(
                  boardState[2],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  boardState[3],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 3,
                ),
                BoardButton(
                  boardState[4],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 4,
                ),
                BoardButton(
                  boardState[5],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  boardState[6],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 6,
                ),
                BoardButton(
                  boardState[7],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 7,
                ),
                BoardButton(
                  boardState[8],
                  onPlayerClickCallBack: onPlayerClick,
                  pos: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int count = 0;

  void onPlayerClick(int pos) {
    if (boardState[pos].isNotEmpty) {
      return;
    }
    if (count % 2 == 0) {
      boardState[pos] = 'X';
    } else {
      boardState[pos] = 'O';
    }
    count++;
    if (checkWinner('X')) {
      player1Score++;
      initBoard();
    } else if (checkWinner('O')) {
      player2Score++;
      initBoard();
    } else if (count == 9) {
      initBoard();
    }
    setState(() {});
  }

  bool checkWinner(String playerSymbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == playerSymbol &&
          boardState[i + 1] == playerSymbol &&
          boardState[i + 2] == playerSymbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == playerSymbol &&
          boardState[i + 3] == playerSymbol &&
          boardState[i + 6] == playerSymbol) {
        return true;
      }
    }
    if (boardState[0] == playerSymbol &&
        boardState[4] == playerSymbol &&
        boardState[8] == playerSymbol) {
      return true;
    }
    if (boardState[2] == playerSymbol &&
        boardState[4] == playerSymbol &&
        boardState[6] == playerSymbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    count = 0;
    boardState = ['', '', '', '', '', '', '', '', ''];
  }
}

class BoardScreenArgs {
  String player1Name;
  String player2Name;

  BoardScreenArgs(this.player1Name, this.player2Name);
}
