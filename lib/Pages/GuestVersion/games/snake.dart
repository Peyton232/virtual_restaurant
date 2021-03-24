import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class SnakeGame extends StatefulWidget {
  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final int columns = 34;
  final int rows = 20;
  final randomGen = Random(); //seed random

  //indexes of snake head and tail
  var snake = [
    [10, 31],
    [10, 30]
  ];

  //this value is changed later but if you do not start with something in this variable you get an error
  var food = [0, 1];
  var direction = 'up';     //start of position
  var playing = false;

  //game setup
  void startGame() {
    const duration = Duration(milliseconds: 300);   //it's slow but if you make this any faster you get weird errors

    snake = [
      // calculate snake head
      [(columns / 2).floor(), (rows / 2).floor()]
    ];

    //add to snake stack rest of body
    snake.add([snake.first[0], snake.first[1] + 1]); // Snake body

    //find new random location for new food
    createFood();

    playing = true;

    //game loop
    Timer.periodic(duration, (Timer timer) {
      move();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
  }

  void move() {
    setState(() {
      //move one spot in the current direction
      switch (direction) {
        case 'up':
          snake.insert(0, [snake.first[0], snake.first[1] - 1]);
          break;

        case 'down':
          snake.insert(0, [snake.first[0], snake.first[1] + 1]);
          break;

        case 'left':
          snake.insert(0, [snake.first[0] - 1, snake.first[1]]);
          break;

        case 'right':
          snake.insert(0, [snake.first[0] + 1, snake.first[1]]);
          break;
      }

      if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
        snake.removeLast();
      } else {
        createFood();
      }
    });
  }

  //pick random spot to spawn food
  void createFood() {
    food = [randomGen.nextInt(columns), randomGen.nextInt(rows)];
  }

  bool checkGameOver() {
    //if not playing or snake in wall game over
    if (!playing ||
        snake.first[1] < 0 ||
        snake.first[1] >= rows ||
        snake.first[0] < 0 ||
        snake.first[0] > columns) {
      return true;
    }

    //if snake hit itself, then game over
    for (var i = 1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][1] == snake.first[1]) {
        return true;
      }
    }

    return false;
  }

  void endGame() {
    playing = false;

    //show alert box for when the game is lost
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text(
              'Score: ${snake.length - 2}',
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  //actual design of snake page
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            //detect which way was swiped
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (direction != 'up' && details.delta.dy > 0) {
                  direction = 'down';
                } else if (direction != 'down' && details.delta.dy < 0) {
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (direction != 'left' && details.delta.dx > 0) {
                  direction = 'right';
                } else if (direction != 'right' && details.delta.dx < 0) {
                  direction = 'left';
                }
              },
              child: AspectRatio(
                aspectRatio: columns / (rows + 5),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,
                    ),
                    itemCount: columns * rows,
                    itemBuilder: (BuildContext context, int index) {
                      var color;
                      var x = index % columns;
                      var y = (index / columns).floor();

                      bool isSnakeBody = false;
                      for (var pos in snake) {
                        if (pos[0] == x && pos[1] == y) {
                          isSnakeBody = true;
                          break;
                        }
                      }

                      if (snake.first[0] == x && snake.first[1] == y) {
                        color = Colors.green;
                      } else if (isSnakeBody) {
                        color = Colors.green[200];
                      } else if (food[0] == x && food[1] == y) {
                        color = Colors.red;
                      } else {
                        color = Colors.grey[800];
                      }

                      return Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: playing ? Colors.red : Colors.blue,
                      ),
                      child: Text(
                        playing ? 'End' : 'Start',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        if (playing) {
                          playing = false;
                        } else {
                          startGame();
                        }
                      }),
                  Text(
                    'Score: ${snake.length - 2}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
