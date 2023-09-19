import 'package:flutter/material.dart';

class Stylists extends StatelessWidget {
  //const TPC({Key key}) : super(key: key);
  var designers = ["Phantom Designs", "Qaaklo", "Destiny Wears"];
  @override
  Widget build(BuildContext context) {
    return Center(child: OrientationBuilder(builder: (context, orientation) {
      var wi = orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 4;
      //var hi =  MediaQuery.of(context).size.height/3;
      return Column(mainAxisSize: MainAxisSize.max, children: [
        Padding(padding: EdgeInsets.only(top: 40)),
        Text("Your Favorite Stylists"),
        SizedBox(
          height: 20,
        ),
        Flexible(
          child: Container(
            child: SingleChildScrollView(
                child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 0,
                    children: List.generate(1, (Index) {
                      return Container(
                        width: wi,
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFEAFDF7),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2.0,
                              blurRadius: 2.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Divider(thickness: 2, color: Colors.white),
                          Container(
                            child: Column(
                                children:
                                    List.generate(designers.length, (index) {
                              return ListTile(
                                  title: TextButton.icon(
                                icon: Icon(Icons.arrow_drop_down),
                                label: Text(designers[index]),
                                onPressed: () {},
                              ));
                            })),
                            height: MediaQuery.of(context).size.height * 0.6,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ]),
                      );
                    }))),
          ),
        ),
      ]);
    }));
  }
}
