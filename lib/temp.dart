// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const UltimateTicTacToeApp());
// }

// class UltimateTicTacToeApp extends StatelessWidget {
//   const UltimateTicTacToeApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: UltimateTicTacToeHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class GameState {
//   List<List<String>> board;
//   List<String> winners;
//   int nextBoard;
//   String currentPlayer;

//   GameState(this.board, this.winners, this.nextBoard, this.currentPlayer);

//   GameState copy() {
//     return GameState(
//       List.generate(9, (i) => List.from(board[i])),
//       List.from(winners),
//       nextBoard,
//       currentPlayer,
//     );
//   }
// }

// class UltimateTicTacToeHomePage extends StatefulWidget {
//   const UltimateTicTacToeHomePage({super.key});

//   @override
//   State<UltimateTicTacToeHomePage> createState() =>
//       _UltimateTicTacToeHomePageState();
// }

// class _UltimateTicTacToeHomePageState extends State<UltimateTicTacToeHomePage> {
//   // List<List<String>> mainBoard =
//   //     List.generate(9, (_) => List.generate(9, (_) => ''));

//   // List<String> miniBoardWinners = List.generate(9, (_) => '');

//   List<List<String>> mainBoard = [
//     ["X", "X", "X", "", "", "", "", "", ""],
//     ["O", "O", "O", "", "", "", "X", "", "X"],
//     ["X", "X", "X", "X", "", "", "", "", ""],
//     ["O", "O", "O", "", "O", "X", "", "", ""],
//     ["X", "X", "X", "", "", "", "", "", ""],
//     ["O", "O", "O", "", "", "", "", "", ""],
//     ["X", "X", "X", "", "", "X", "O", "", ""],
//     ["O", "O", "O", "", "", "", "", "", ""],
//     ["X", "X", "O", "O", "O", "X", "O", "O", ""]
//   ];

//   List<String> miniBoardWinners = ["X", "O", "X", "O", "X", "O", "X", "O", ""];

//   String currentPlayer = 'X';
//   int nextBoard = -1;
//   int lastMiniBoardIndex = -1;
//   int lastCellIndex = -1;
//   bool isComputerTurn = false;
//   int thinkingTime = 0;
//   int evaluations = 0;
//   List<GameState> moveHistory = [];
//   String difficulty = 'Hard';
//   bool isDifficultySelectable = true;

//   bool isComputerGame = false;

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Scaffold(
//       drawer: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(
//                 color: Color(0xfff5d2d0),
//               ),
//               padding: const EdgeInsets.all(20),
//               child: Align(
//                 alignment: Alignment.bottomLeft,
//                 child: FittedBox(
//                   child: Text(
//                     'Ultimate Tic-Tac-Toe',
//                     style: textTheme.titleLarge,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.all(20),
//                 children: [
//                   Text(
//                     "New Game",
//                     style: textTheme.titleLarge?.copyWith(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       isComputerGame = true;
//                       Navigator.pop(context);
//                       resetGame();
//                       _openDifficultyDialog();
//                     },
//                     child: Row(
//                       children: [
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const Icon(
//                           Icons.computer,
//                           size: 28,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Computer",
//                           style: textTheme.bodyLarge,
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       isComputerGame = false;
//                       Navigator.pop(context);
//                       resetGame();
//                     },
//                     child: Row(
//                       children: [
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         const Icon(
//                           Icons.people,
//                           size: 28,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "Local",
//                           style: textTheme.bodyLarge,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         title: Text(isComputerGame ? 'Computer - $difficulty' : 'Local'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.undo),
//             onPressed: _undoMove,
//           ),
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               _showRestartDialog();
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (isComputerGame) ...[
//               Text(
//                 isComputerTurn ? 'Computer is thinking' : 'It\'s your turn',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: isComputerTurn ? Colors.blue : Colors.red,
//                 ),
//               ),
//             ] else ...[
//               Text(
//                 'It\'s $currentPlayer turn',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: currentPlayer == 'O' ? Colors.blue : Colors.red,
//                 ),
//               ),
//             ],
//             const SizedBox(height: 20),
//             AspectRatio(
//               aspectRatio: 1,
//               child: Container(
//                 decoration: const BoxDecoration(color: Colors.grey),
//                 child: GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 4.0,
//                     crossAxisSpacing: 4.0,
//                   ),
//                   itemCount: 9,
//                   itemBuilder: (context, index) {
//                     final bigLetter = miniBoardWinners[index];
//                     final isBigLetter = bigLetter != '';
//                     final isBigLetterX = bigLetter == 'X';
//                     return Container(
//                       padding:
//                           EdgeInsets.all(miniBoardWinners[index] != '' ? 0 : 8),
//                       color: Colors.white,
//                       child: ColoredBox(
//                         color: isBigLetter ? Colors.transparent : Colors.grey,
//                         child: Stack(
//                           children: [
//                             Opacity(
//                               opacity: isBigLetter ? 0.3 : 1,
//                               child: GridView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 gridDelegate:
//                                     const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 3,
//                                   mainAxisSpacing: 2.0,
//                                   crossAxisSpacing: 2.0,
//                                 ),
//                                 itemCount: 9,
//                                 itemBuilder: (context, subIndex) {
//                                   bool isLastMove =
//                                       lastMiniBoardIndex == index &&
//                                           lastCellIndex == subIndex;

//                                   final currentBoxLetter =
//                                       mainBoard[index][subIndex];

//                                   final isCurrentMoveIsBigLetter =
//                                       lastCellIndex > -1
//                                           ? miniBoardWinners[lastCellIndex] !=
//                                               ''
//                                           : false;

//                                   return GestureDetector(
//                                     onTap: isComputerGame && isComputerTurn
//                                         ? null
//                                         : () => _handleTap(index, subIndex),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: isLastMove
//                                             ? const Color(0xffd6d4d4)
//                                             : isCurrentMoveIsBigLetter ||
//                                                     (nextBoard == index)
//                                                 ? currentBoxLetter == ''
//                                                     ? (currentPlayer == 'X'
//                                                         ? const Color(
//                                                             0xfff5d2d0)
//                                                         : const Color(
//                                                             0xffd0e7f4))
//                                                     : Colors.white
//                                                 : Colors
//                                                     .white, // Normal grid color
//                                       ),
//                                       child: FittedBox(
//                                         child: Text(
//                                           currentBoxLetter,
//                                           style: TextStyle(
//                                             color: mainBoard[index][subIndex] ==
//                                                     'X'
//                                                 ? Colors.red
//                                                 : Colors.blue,
//                                             fontSize: 40.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                             if (isBigLetter)
//                               Positioned.fill(
//                                 child: ColoredBox(
//                                   color: isBigLetterX
//                                       ? const Color(0xfff5d2d0).withOpacity(0.5)
//                                       : const Color(0xffd0e7f4)
//                                           .withOpacity(0.5),
//                                   child: FittedBox(
//                                     child: Text(
//                                       miniBoardWinners[index],
//                                       style: TextStyle(
//                                         fontSize: 200,
//                                         color: isBigLetterX
//                                             ? Colors.red[900]
//                                             : Colors.blue,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             if (isComputerGame)
//               Text(
//                 'Last move: ${thinkingTime}ms, $evaluations evaluations',
//                 style: const TextStyle(fontSize: 16),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _handleTap(int miniBoardIndex, int cellIndex) {
//     if (nextBoard != -1 && miniBoardIndex != nextBoard) {
//       return;
//     }

//     if (mainBoard[miniBoardIndex][cellIndex] != '' ||
//         miniBoardWinners[miniBoardIndex] != '') {
//       return;
//     }

//     setState(() {
//       isDifficultySelectable = false;
//       // Save the current state before making a move
//       moveHistory.add(GameState(
//         List.generate(9, (i) => List.from(mainBoard[i])),
//         List.from(miniBoardWinners),
//         nextBoard,
//         currentPlayer,
//       ));

//       mainBoard[miniBoardIndex][cellIndex] = currentPlayer;
//       lastMiniBoardIndex = miniBoardIndex;
//       lastCellIndex = cellIndex;

//       if (_checkMiniBoardWinner(miniBoardIndex)) {
//         miniBoardWinners[miniBoardIndex] = currentPlayer;
//         if (_checkGameWinner()) {
//           _showGameOverDialog("$currentPlayer Wins!");
//           return;
//         }
//       }

//       if (_checkTie()) {
//         _showGameOverDialog("It's a Tie!");
//         return;
//       }

//       currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
//       nextBoard = (miniBoardWinners[cellIndex] == '' &&
//               _hasEmptyCells(mainBoard[cellIndex]))
//           ? cellIndex
//           : -1;

//       if (isComputerGame && currentPlayer == 'O') {
//         isComputerTurn = true;
//         Future.delayed(const Duration(milliseconds: 500), () {
//           _makeComputerMove();
//         });
//       }
//     });
//   }

//   void _makeComputerMove() {
//     if (!isComputerGame) return;

//     setState(() {
//       isComputerTurn = true;
//     });

//     final startTime = DateTime.now();
//     evaluations = 0; // Reset evaluations count before each move
//     final bestMove =
//         findBestMove(mainBoard, miniBoardWinners, nextBoard, 'O', this);
//     final endTime = DateTime.now();
//     thinkingTime = endTime.difference(startTime).inMilliseconds;

//     setState(() {
//       _handleTap(bestMove[0], bestMove[1]);
//       isComputerTurn = false;
//     });
//   }

//   void _undoMove() {
//     if (moveHistory.isNotEmpty && !isComputerTurn) {
//       setState(() {
//         // Undo the last two moves (player's move and computer's move)
//         if (moveHistory.length >= 2) {
//           GameState previousState = moveHistory[moveHistory.length - 2];
//           mainBoard = previousState.board;
//           miniBoardWinners = previousState.winners;
//           nextBoard = previousState.nextBoard;
//           currentPlayer = previousState.currentPlayer;
//           moveHistory.removeRange(moveHistory.length - 2, moveHistory.length);
//         }
//       });
//     }
//   }

//   bool _checkMiniBoardWinner(int miniBoardIndex) {
//     List<String> miniBoard = mainBoard[miniBoardIndex];
//     for (int i = 0; i < 3; i++) {
//       if (miniBoard[i * 3] == currentPlayer &&
//           miniBoard[i * 3 + 1] == currentPlayer &&
//           miniBoard[i * 3 + 2] == currentPlayer) {
//         return true;
//       }
//       if (miniBoard[i] == currentPlayer &&
//           miniBoard[i + 3] == currentPlayer &&
//           miniBoard[i + 6] == currentPlayer) {
//         return true;
//       }
//     }
//     if (miniBoard[0] == currentPlayer &&
//         miniBoard[4] == currentPlayer &&
//         miniBoard[8] == currentPlayer) {
//       return true;
//     }
//     if (miniBoard[2] == currentPlayer &&
//         miniBoard[4] == currentPlayer &&
//         miniBoard[6] == currentPlayer) {
//       return true;
//     }
//     return false;
//   }

//   bool _checkGameWinner() {
//     for (int i = 0; i < 3; i++) {
//       if (miniBoardWinners[i * 3] == currentPlayer &&
//           miniBoardWinners[i * 3 + 1] == currentPlayer &&
//           miniBoardWinners[i * 3 + 2] == currentPlayer) {
//         return true;
//       }
//       if (miniBoardWinners[i] == currentPlayer &&
//           miniBoardWinners[i + 3] == currentPlayer &&
//           miniBoardWinners[i + 6] == currentPlayer) {
//         return true;
//       }
//     }
//     if (miniBoardWinners[0] == currentPlayer &&
//         miniBoardWinners[4] == currentPlayer &&
//         miniBoardWinners[8] == currentPlayer) {
//       return true;
//     }
//     if (miniBoardWinners[2] == currentPlayer &&
//         miniBoardWinners[4] == currentPlayer &&
//         miniBoardWinners[6] == currentPlayer) {
//       return true;
//     }
//     return false;
//   }

//   // bool _checkTie() {
//   //   return !miniBoardWinners.contains('') && !_checkGameWinner();
//   // }
//   bool _checkTie() {
//     // Check if all mini-boards are filled (have a winner or are completely occupied)
//     return miniBoardWinners.every((winner) => winner != '') ||
//         mainBoard.every((miniBoard) => !miniBoard.contains('')) &&
//             !_checkGameWinner();
//   }

//   bool _hasEmptyCells(List<String> miniBoard) {
//     return miniBoard.contains('');
//   }

//   void _showGameOverDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Game Over"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             child: Text(
//               "Undo last move",
//               style: TextStyle(color: Colors.black.withOpacity(0.7)),
//             ),
//             onPressed: () {
//               _undoMove();
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text("Restart"),
//             onPressed: () {
//               resetGame();
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _showRestartDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Restart Game?"),
//         content: const Text("This will clear the current board!"),
//         actions: [
//           TextButton(
//             child: const Text("Cancel"),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text("Restart"),
//             onPressed: () {
//               Navigator.of(context).pop();
//               resetGame();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void resetGame() {
//     mainBoard = List.generate(9, (_) => List.generate(9, (_) => ''));
//     miniBoardWinners = List.generate(9, (_) => '');
//     currentPlayer = 'X';
//     nextBoard = -1;
//     lastMiniBoardIndex = -1;
//     lastCellIndex = -1;
//     thinkingTime = 0;
//     evaluations = 0;
//     moveHistory.clear();
//     isDifficultySelectable = true;
//     setState(() {});
//   }

//   List<int> findBestMove(List<List<String>> board, List<String> winners,
//       int nextBoard, String player, _UltimateTicTacToeHomePageState state) {
//     var gameState = GameState(board, winners, nextBoard, player);
//     print(' => Current game state: ${gameState.board}');
//     print(' => Current game winner: ${gameState.winners}');
//     print(' => Current game nextBoard: ${gameState.nextBoard}');
//     print(' => Current game currenttPlayer: ${gameState.currentPlayer}');

//     var availableMoves = getAvailableMoves(gameState);

//     if (state.moveHistory.length <= 6) {
//       var randomMoves = availableMoves
//           .where(
//               (_) => Random().nextBool()) // Randomly select a subset of moves
//           .take(1) // Select only one random move
//           .toList();

//       if (randomMoves.isNotEmpty) {
//         return randomMoves[0];
//       }
//     } else {
//       switch (state.difficulty) {
//         case 'Easy':
//           return findEasyMove(gameState, availableMoves);
//         case 'Medium':
//           return findMediumMove(gameState, availableMoves, state);
//         case 'Hard':
//         default:
//           return findHardMove(gameState, availableMoves, state);
//       }
//     }
//     return [-1, -1]; // will never get here
//   }

//   List<List<int>> getAvailableMoves(GameState state) {
//     List<List<int>> moves = [];
//     if (state.nextBoard == -1) {
//       for (int i = 0; i < 9; i++) {
//         if (state.winners[i] == '') {
//           for (int j = 0; j < 9; j++) {
//             if (state.board[i][j] == '') {
//               moves.add([i, j]);
//             }
//           }
//         }
//       }
//     } else {
//       for (int j = 0; j < 9; j++) {
//         if (state.board[state.nextBoard][j] == '') {
//           moves.add([state.nextBoard, j]);
//         }
//       }
//     }
//     return moves;
//   }

//   GameState makeMove(GameState state, int miniBoardIndex, int cellIndex) {
//     state.board[miniBoardIndex][cellIndex] = state.currentPlayer;
//     if (checkMiniBoardWinner(
//         state.board[miniBoardIndex], state.currentPlayer)) {
//       state.winners[miniBoardIndex] = state.currentPlayer;
//     }
//     state.nextBoard = (state.winners[cellIndex] == '' &&
//             hasEmptyCells(state.board[cellIndex]))
//         ? cellIndex
//         : -1;
//     state.currentPlayer = (state.currentPlayer == 'X') ? 'O' : 'X';
//     return state;
//   }

//   bool isGameOver(GameState state) {
//     return checkGameWinner(state.winners, 'X') ||
//         checkGameWinner(state.winners, 'O') ||
//         !state.winners.contains('');
//   }

//   double evaluateBoard(GameState state) {
//     if (checkGameWinner(state.winners, 'O')) return 1000;
//     if (checkGameWinner(state.winners, 'X')) return -1000;
//     if (!state.winners.contains('')) return 0; // Tie

//     int score = 0;

//     // Evaluate each mini-board
//     for (int i = 0; i < 9; i++) {
//       if (state.winners[i] == 'O') {
//         score += 100;
//       } else if (state.winners[i] == 'X') {
//         score -= 100;
//       } else {
//         score += evaluateMiniBoard(state.board[i], 'O') -
//             evaluateMiniBoard(state.board[i], 'X');
//       }
//     }

//     return score.toDouble();
//   }

//   int evaluateMiniBoard(List<String> miniBoard, String player) {
//     int score = 0;
//     List<List<int>> winPatterns = [
//       [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
//       [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
//       [0, 4, 8], [2, 4, 6] // Diagonals
//     ];

//     for (var pattern in winPatterns) {
//       int playerCount = 0;
//       int emptyCount = 0;

//       for (var index in pattern) {
//         if (miniBoard[index] == player) {
//           playerCount++;
//         } else if (miniBoard[index] == '') {
//           emptyCount++;
//         }
//       }

//       if (playerCount == 2 && emptyCount == 1) {
//         score += 10; // Two in a row with an empty cell
//       } else if (playerCount == 1 && emptyCount == 2) {
//         score += 1; // One in a row with two empty cells
//       }
//     }

//     return score;
//   }

//   bool checkMiniBoardWinner(List<String> miniBoard, String player) {
//     List<List<int>> winPatterns = [
//       [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
//       [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
//       [0, 4, 8], [2, 4, 6] // Diagonals
//     ];

//     for (var pattern in winPatterns) {
//       if (miniBoard[pattern[0]] == player &&
//           miniBoard[pattern[1]] == player &&
//           miniBoard[pattern[2]] == player) {
//         return true;
//       }
//     }
//     return false;
//   }

//   bool checkGameWinner(List<String> winners, String player) {
//     return checkMiniBoardWinner(winners, player);
//   }

//   bool hasEmptyCells(List<String> miniBoard) {
//     return miniBoard.contains('');
//   }
// }
