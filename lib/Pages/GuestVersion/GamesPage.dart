import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/games/ticTacToe.dart';
import 'package:virtual_restaurant/Pages/GuestVersion/games/snake.dart';
import 'package:virtual_restaurant/Data/constants.dart';

/*
This the page for 3 games. This can also be accessed in Kids Mode.
 */

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Games"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 25.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kOffWhite,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        height: 250,
                        child: Center(
                            child: Image.asset('images/ticcytaccy.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Tic-Tac-Toe",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Try to get three in a row, while keeping your opponent from winning!",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  minimumSize: Size(180, 60),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ticTacToe()),
                                  );
                                },
                                child: Text(
                                  "Play",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kOffWhite,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        height: 250,
                        child: Image.asset('images/snaky.png'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Snake",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 40),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Control the snake to eat the point. The farther you get the bigger it gets!",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  minimumSize: Size(180, 60),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SnakeGame()),
                                  );
                                },
                                child: Text(
                                  "Play",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kOffWhite,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        height: 250,
                        child: Center(child: Image.asset('images/MineSweeperImage.png'),),
                      ),
                    ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Text("Mine Sweeper" ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                            ),
                           ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Text("Click every square except the ones with a bomb!",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                        minimumSize: Size(180,60),
                                      ),
                                      onPressed: (){
                                        Navigator.pushNamed(context, "/MineSweeperPage");
                                      }, child: Text("Play", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            );
  }
}
