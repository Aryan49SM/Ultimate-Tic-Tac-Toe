# Ultimate Tic Tac Toe

Ultimate Tic Tac Toe is a Flutter-based mobile app that transforms the familiar Tic Tac Toe into a game of layered strategy. Every move you make impacts your mini board and determines your opponent’s next move. With a computer opponent powered by a mini-max algorithm enhanced with alpha-beta pruning, the game offers a consistently tough challenge.

## Features
- **Ultimate Tic Tac Toe Gameplay:** A unique 9x9 grid composed of 9 smaller Tic Tac Toe boards.
- **Multiplayer Modes:** Choose between a local two-player mode or challenge the computer.
- **Smart AI Opponent:** The computer uses a mini-max algorithm with alpha-beta pruning for optimal play.
- **Adjustable Difficulty:** Select from Easy, Medium, or Hard to tailor the AI challenge.
- **Undo & Restart:** Easily undo moves or restart the game to try different strategies.
- **Responsive UI:** Designed for portrait mode with a clean, intuitive interface.

## Game Rules
Ultimate Tic Tac Toe is played on a large 9x9 board divided into 9 mini boards. Players take turns placing their mark (X or O) in the mini boards. The twist is that the move you make determines which mini board your opponent must play in next. A mini board is won by the standard Tic Tac Toe rules. To win the overall game, you must win three mini boards in a row on the larger grid.

## Tech Stack
- **Flutter:** For building cross-platform mobile applications.
- **Dart:** Programming language for application logic.
- **Minimax Algorithm with Alpha-Beta Pruning:** Provides an efficient and challenging AI opponent.

## Algorithm
The AI opponent leverages a mini-max algorithm enhanced with alpha-beta pruning to evaluate possible moves. Depending on the selected difficulty:
- **Easy:** Utilizes basic checks for winning and defensive moves, often opting for a random move early in the game.
- **Medium:** Implements a shallower search (depth 3) with occasional randomness to vary gameplay.
- **Hard:** Conducts a deeper search (depth 5) for optimal move selection.

An evaluation function scores each mini board based on potential winning combinations, ensuring that the AI makes competitive moves

## Installation
1. **Clone the repository:**
   
   ```bash
   git clone https://github.com/Aryan49SM/Ultimate-Tic-Tac-Toe.git
   cd Ultimate-Tic-Tac-Toe
   ```
3. **Install Flutter**
   
4. **Install Dependencies:**
   
   ```bash
    flutter pub get
   ```
   
## Usage

1. **Run the App:**
```bash
flutter run
```

2. **Select Game Mode:**

   Open the side drawer in the app to choose between a local game or playing against the computer.

4. **Choose Difficulty:**

   If playing against the computer, select the desired difficulty level from the prompt.

6. **Play:**

   Tap on the grid to place your mark. The app will highlight available moves and enforce turn rules.

8. **Undo/Restart:**

   Use the on-screen buttons to undo the last move or restart the game.

## Screenshots
<p align="center">

  <img src="https://github.com/user-attachments/assets/326be05a-4322-41f7-b9f1-290c9d7f330b" alt="o_board" width="200" style="max-width:100%; height:auto;">
  <img src="https://github.com/user-attachments/assets/72315e12-386c-400e-9911-8445e8d328a4" alt="o_board" width="200" style="max-width:100%; height:auto;">
  <img src="https://github.com/user-attachments/assets/9d572342-c380-4a24-91e5-fc123c837071" alt="o_board" width="200" style="max-width:100%; height:auto;">
  <img src="https://github.com/user-attachments/assets/45ed872a-2009-491c-a6d9-d3950266dbf7" alt="x_board" width="200" style="max-width:100%; height:auto;">
  <img src="https://github.com/user-attachments/assets/cd74f6fc-dd4b-4108-a9e6-2744c65ef635" alt="x_board" width="200" style="max-width:100%; height:auto;">
</p>


