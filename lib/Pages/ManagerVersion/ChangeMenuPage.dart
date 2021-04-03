import 'package:virtual_restaurant/Data/constants.dart';
import 'package:flutter/material.dart';
import 'package:virtual_restaurant/Data/globals.dart';
import 'package:virtual_restaurant/classes/menuItem.dart';

/*
This is where the manager can edit the meal of day

 that the customer can see
 */
// TODO: Add kidsMeal catagory back when it works
List<MenuItem> mChoiceList = [...entrees, ...appetizers, ...sides, ...desserts, ...drinks];


class AvalibleItems extends StatefulWidget {
  @override
  _AvalibleItems createState() => _AvalibleItems();
}

class _AvalibleItems extends State<AvalibleItems> {
  List<Widget> grid_items = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < mChoiceList.length; i++) {
      grid_items.add(ItemCard(place: i,));
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: Text(
            "Change Avalibility Of Items",
            style: kAppBarTextStyle,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: GridView.count(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                crossAxisCount: 3,
                childAspectRatio: 5 / 3,
                children: grid_items,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

//    Card for items in grid
class ItemCard extends StatefulWidget {
  int place;

  ItemCard({this.place});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        //print([mChoiceList.length, place]);
        setState(() {
          mChoiceList[widget.place].available =
          !mChoiceList[widget.place].available;
        });
        print([
          mChoiceList[widget.place].getItemName,
          mChoiceList[widget.place].available
        ]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: mChoiceList[widget.place].available ? kMintGreen : Colors.grey,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500], blurRadius: 3, offset: Offset(2, 2))
          ],
        ),
        child: Center(
          child: Text(mChoiceList[widget.place].getItemName),
        ),
      ),
    );
  }
}
