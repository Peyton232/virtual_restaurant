

import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

enum tile_state { covered, open}
int win_Count = 0;

class Tile{
  tile_state state = tile_state.covered;
  int val = 0;
  bool mine = false;
}


class MineSweeperPage extends StatefulWidget {

  _MineSweeperGame createState() => _MineSweeperGame();
}

class _MineSweeperGame extends State<MineSweeperPage> {

  final int num_row = 9;
  final int num_col = 9;
  final int num_mine = 11;

  List<Tile> board = <Tile>[];

  void new_Board() {
    win_Count = 0;

    //  creates board of class tile to create the data for each tile
    for(int i = 0;i<num_col*num_row;i++)
      {
        board.add(Tile());
      }



    int count = 0;
    int count2 = 0;
    int numMines = 0;
    Random rand = new Random();
    int x;

    //Creates randomized bomb placement and determines numbers for each tile
    while(count < num_mine)
    {
      if(count2 > 30)
        {
          break;
        }
      x = rand.nextInt(num_row*num_col);
      if(board[x].mine ==  false)
      {
        board[x].mine = true;
        numMines++;
        //print(numMines);
        if(x+1 < 81)
          {
            board[x+1].val = board[x+1].val + 1;
          }
        if(x-1 >= 0)
          {
            board[x-1].val = board[x-1].val + 1;
          }
        if(x-8 >= 0)
          {
            board[x-8].val = board[x-8].val + 1;
          }
        if(x-9 >= 0)
        {
          board[x-9].val = board[x-9].val + 1;
        }
        if(x-10 >= 0)
        {
          board[x-10].val = board[x-10].val + 1;
        }
        if(x+8 < 81)
        {
          board[x+8].val = board[x+8].val + 1;
        }
        if(x+9 < 81)
        {
          board[x+9].val = board[x+9].val + 1;
        }
        if(x+10 < 81)
        {
          board[x+10].val = board[x+10].val + 1;
        }
        count++;
      }
      count2++;
      //print(count);
    }
  }


  @override
  void initState(){

    new_Board();
    super.initState();
  }

  //Makes the board of widget tiles using gridview
  Widget make_Board(){

    List<Widget> board_tiles = <Widget>[];
    for(int i = 0;i < num_col*num_row;i++)
      {
        board_tiles.add(MineTile(
          covered: board[i].state == tile_state.covered,
          mine: board[i].mine,
          val: board[i].val,
        ));
      }

    //gridview
    return Center(
      child: Container(
        height: 540,
        width: 520,
        child:GridView.count(
          crossAxisCount: num_col,
          children: board_tiles,
          primary: true,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  //Makes the overall page view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          Text('Find all 11 Mines!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          make_Board(),
        ],
      ),
    );
  }
}

//class for tile used on the board
class MineTile extends StatefulWidget {
  bool covered;
  int val;
  bool mine;

  MineTile({
    this.covered,
    this.val,
    this.mine
  });
  _MineTile createState() => _MineTile(

  );
}

class _MineTile extends State<MineTile> {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.all(3),
          height: 5,
          width: 5,
          color: widget.covered ? Colors.black45 : Colors.blueGrey,
          child: Center(
            child: (widget.mine && widget.covered == false) ? Icon(Icons.local_fire_department_outlined, color: Colors.red,) : Text( widget.val == 0 || widget.covered ? '' : widget.val.toString(), style: TextStyle(fontSize: 23),),    //Testing (reveals all mines)     (widget.mine) ? Icon(Icons.local_fire_department_outlined, color: Colors.red,) : Text( widget.val == 0 || widget.covered ? '' : widget.val.toString(), style: TextStyle(fontSize: 23),),
          ),
        ),
      onTap: () {
          if(widget.covered == true)
            {
              setState((){
                widget.covered = false;
              });
                  win_Count++;
              if(widget.mine)
                {
                  print('You Lose!!!!!');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _lossPopup(context),
                  );
                }else if (win_Count >= 81 - 11)
                  {
                    print('You Win!');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _winPopup(context),
                    );
                  }

              //print(widget.covered);
            }
      },
    );
  }

  //Pop up for when the player loses
  Widget _lossPopup(BuildContext context) {
    return new AlertDialog(
      title: const Text('You Lose'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        new FlatButton(
          //  onpressed the button pops the popup and replaces the current MineSweeperPage from page stack with another of the same page
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/MineSweeperPage');
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('NEW GAME', style: TextStyle(color: Colors.green),),
        ),
        new FlatButton(
          //  onpressed the button pops both the popup and the MineSweeperPage from the page stack
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('CLOSE', style: TextStyle(color: Colors.green),),
        ),
      ],
    );
  }

  //Pop up for when the player winds
  Widget _winPopup(BuildContext context) {
    return new AlertDialog(
      title: const Text('You Win'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, '/MineSweeperPage');
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('NEW GAME', style: TextStyle(color: Colors.green),),
        ),
        new FlatButton(
        onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('CLOSE', style: TextStyle(color: Colors.green),),
        ),
      ],
    );
  }

}

