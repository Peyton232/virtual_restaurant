import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui';

class ConnectFour extends StatefulWidget {
  @override
  _ConnectFourState createState() => _ConnectFourState();
}

class _ConnectFourState extends State<ConnectFour> {
  var winner;
  var curColor = Colors.red;
  var curPlayer = "Red";
  List board_data = List.generate(7, (i) => List(7), growable: false);
  List board_place = [];
  var curI = 0;

  void new_Board() {
    board_place.clear();
    //print("hello");
    //print("hello");
    for (int i = 0; i < 7; i++) {
      board_place.add(6);
      for (int j = 0; j < 7; j++) {
        board_data[i][j] = Colors.white;
      }
      //print(board_data);
    }
    //print(board_place);
  }

  bool checkForWin(int i, int j) {
    var tempColor = board_data[i][j];

    int count_H = 1;
    int count_V = 1;
    int count_DL = 1;
    int count_DR = 1;
    print([count_H, count_V, count_DL, count_DR]);

    //  Horizontal Win Checks
    if (i + 1 < 7 && i + 1 >= 0 && board_data[i + 1][j] == tempColor) {
      count_H++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i - 1 < 7 && i - 1 >= 0 && board_data[i - 1][j] == tempColor) {
      count_H++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i + 2 < 7 && i + 2 >= 0 && board_data[i + 2][j] == tempColor) {
      count_H++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i - 2 < 7 && i - 2 >= 0 && board_data[i - 2][j] == tempColor) {
      count_H++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i + 3 < 7 && i + 3 >= 0 && board_data[i + 3][j] == tempColor) {
      count_H++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i - 3 < 7 && i - 3 >= 0 && board_data[i - 3][j] == tempColor) {
      count_H++;
      print([count_H, count_V, count_DL, count_DR]);
    }

    //  Vertical Win Checks
    if (j + 1 < 7 && j + 1 >= 0 && board_data[i][j + 1] == tempColor) {
      count_V++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j - 1 < 7 && j - 1 >= 0 && board_data[i][j - 1] == tempColor) {
      count_V++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j + 2 < 7 && j + 2 >= 0 && board_data[i][j + 2] == tempColor) {
      count_V++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j - 2 < 7 && j - 2 >= 0 && board_data[i][j - 2] == tempColor) {
      count_V++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j + 3 < 7 && j + 3 >= 0 && board_data[i][j + 3] == tempColor) {
      count_V++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j - 3 < 7 && j - 3 >= 0 && board_data[i][j - 3] == tempColor) {
      count_V++;
      print([count_H, count_V, count_DL, count_DR]);
    }

    //  Diagonal Right Win Checks
    if (i + 1 < 7 &&
        i + 1 >= 0 &&
        j + 1 < 7 &&
        j + 1 >= 0 &&
        board_data[i + 1][j + 1] == tempColor) {
      count_DR++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i - 1 < 7 &&
        i - 1 >= 0 &&
        j - 1 < 7 &&
        j - 1 >= 0 &&
        board_data[i - 1][j - 1] == tempColor) {
      count_DR++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i + 2 < 7 &&
        i + 2 >= 0 &&
        j + 2 < 7 &&
        j + 2 >= 0 &&
        board_data[i + 2][j + 2] == tempColor) {
      count_DR++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i - 2 < 7 &&
        i - 2 >= 0 &&
        j - 2 < 7 &&
        j - 2 >= 0 &&
        board_data[i - 2][j - 2] == tempColor) {
      count_DR++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i + 3 < 7 &&
        i + 3 >= 0 &&
        j + 3 < 7 &&
        j + 3 >= 0 &&
        board_data[i + 3][j + 3] == tempColor) {
      count_DR++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (i - 3 < 7 &&
        i - 3 >= 0 &&
        j - 3 < 7 &&
        j - 3 >= 0 &&
        board_data[i - 3][j - 3] == tempColor) {
      count_DR++;
      print([count_H, count_V, count_DL, count_DR]);
    }

    //  Diagonal Left Win Checks
    if (j - 1 < 7 &&
        j - 1 >= 0 &&
        i + 1 < 7 &&
        i + 1 >= 0 &&
        board_data[i + 1][j - 1] == tempColor) {
      count_DL++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j + 1 < 7 &&
        j + 1 >= 0 &&
        i - 1 < 7 &&
        i - 1 >= 0 &&
        board_data[i - 1][j + 1] == tempColor) {
      count_DL++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j - 2 < 7 &&
        j - 2 >= 0 &&
        i + 2 < 7 &&
        i + 2 >= 0 &&
        board_data[i + 2][j - 2] == tempColor) {
      count_DL++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j + 2 < 7 &&
        j + 2 >= 0 &&
        i - 2 < 7 &&
        i - 2 >= 0 &&
        board_data[i - 2][j + 2] == tempColor) {
      count_DL++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j - 3 < 7 &&
        j - 3 >= 0 &&
        i + 3 < 7 &&
        i + 3 >= 0 &&
        board_data[i + 3][j - 3] == tempColor) {
      count_DL++;
      print([count_H, count_V, count_DL, count_DR]);
    }
    if (j + 3 < 7 &&
        j + 3 >= 0 &&
        i - 3 < 7 &&
        i - 3 >= 0 &&
        board_data[i - 3][j + 3] == tempColor) {
      count_DL++;
      print([count_H, count_V, count_DL, count_DR]);
    }

    //Overall Win Check
    if (count_DR >= 4 || count_DL >= 4 || count_H >= 4 || count_V >= 4) {
      print("Winner is ${curPlayer}.");
      return true;
    }else
      {
        return false;
      }
  }

  @override
  void initState() {
    super.initState();
    new_Board();
  }

  Widget C4Tile(int i, int j) {
    int x;

    return GestureDetector(
      child: Container(
        color: Colors.green,
        height: 50,
        width: 50,
        child: Center(
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: board_data[i][j],
            ),
          ),
        ),
      ),
      onTap: () {
        print("List[${i}] was taped");
        curI = i;
        if (board_place[i] >= 0 && curI == i) {
          for (x = 6; x >= 0; x--) {
            if (board_data[i][x] == Colors.white) {
              //print("${i} -> ${curColor}");
              board_data[i][x] = curColor;
              break;
            }
          }

          ;
          setState(() {
            //print(board_place);
            //print(board_data[i]);
            board_place[i]--;
            if (checkForWin(i, x)) {
              showDialog(
                context: context,
                builder: (BuildContext context) => _winPopup(context),
              );
            } else {
              if (curColor == Colors.red) {
                curColor = Colors.blue;
                curPlayer = "Blue";
              } else if (curColor == Colors.blue) {
                curColor = Colors.red;
                curPlayer = "Red";
              }
            }
          });
        }
      },
    );
  }

  Widget colButton(int i) {
    return Container(
      height: 100,
      width: 75,
      child: ListView.builder(
          itemCount: 7,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int j) {
            return C4Tile(i, j);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connect 4"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Current Color: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: curColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              color: Colors.black26,
              height: 365,
              width: 525,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    return colButton(i);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  //Pop up for when the player winds
  Widget _winPopup(BuildContext context) {
    return new AlertDialog(
      title: Text('${curPlayer} Win'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/ConnectFour');
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text(
            'NEW GAME',
            style: TextStyle(color: Colors.green),
          ),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text(
            'CLOSE',
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
