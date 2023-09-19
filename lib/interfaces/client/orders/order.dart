import "package:flutter/material.dart";

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      //Icon(Icons.shopping_cart),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Orders",
                textAlign: TextAlign.left,
              ))),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      Container(
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(14, (index) {
            return ListTile(
              style: ListTileStyle.list,
              selectedTileColor: Colors.white,
              selectedColor: Colors.teal,
              selected: false,
              title: Text('$index, You have a new order '),
              onTap: () {
                // Update the state of the app.
                // ...
                //setState((){varSl = true;});
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Icon(Icons.shopping_cart),
                        content: Text('Orders $index'),
                      );
                    });
              },
            );
          })),
        ),
        decoration: BoxDecoration(
            color: Color(0XFFEAFDF7),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 0.8,
      ),
    ]);
  }
}
