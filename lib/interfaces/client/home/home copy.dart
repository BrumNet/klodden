import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../backend/cache.dart';
import '../../backend/server.dart';
import '../orderInfo.dart';

class Home extends StatelessWidget {
  //const TPC({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('uploads').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Align(
                alignment: Alignment.center,
                child: Text("Something went wrong. Please Try Again Later"));
          } //
          if (!snapshot.hasData) {
            return const Align(
                alignment: Alignment.center, child: Text("Loading"));
          } //
          if (snapshot.data!.docs.length == 1) {
            return Align(
                alignment: Alignment.center,
                child: Text(//"Please Check Your Connection and Refresh!":
                    "No Data Found"));
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            default:
              return OrientationBuilder(builder: (context, orientation) {
                var wi = orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width / 4;
                var hi = orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height / 2
                    : MediaQuery.of(context).size.height * 3 / 4;
                return GridView.count(
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0,
                    childAspectRatio: 0.5,
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 5,
                    children:
                        List.generate(snapshot.data!.docs.length, (index) {
                      final document = snapshot.data!.docs[index];
                      bool yh = sharedPrefs.favid!.contains(document['clothid'])
                          ? true
                          : false;
                      return Container(
                        width: wi,
                        //height: hi,
                        padding: const EdgeInsets.all(8),
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                          Expanded(
                              child: Container(
                                  width: wi,
                                  height: hi,
                                  child: // kIsWeb ?
                                      Image.network(
                                    document['image'],
                                    //'https://picsum.photos/250/400?image=8',
                                    //placeholder:(context,url)=> Container(color: Colors.brown[200],child: Center(child: Text("I Love Yenetua",textAlign: TextAlign.center,style: TextStyle(fontSize: 34, color: Colors.brown[300],fontWeight: FontWeight.bold)))),
                                    // errorWidget:(context,url,error)=>Container(color: Colors.brown[200],child: const Icon(Icons.error)),alignment: Alignment.center,
                                    //220,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                  ))),
                          Divider(thickness: 2, color: Colors.white),
                          Row(mainAxisSize: MainAxisSize.max, children: [
                            //onlik info assign to sign
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: FavComponent(document['clothid'], yh)),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton.icon(
                                    onPressed: () {
                                      showDialog(
                                          //barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: OrderInfo(
                                                  document['price'],
                                                  document['minDeposit'],
                                                  document['material'],
                                                  document['colour'],
                                                  document['style'],
                                                  document['gender'],
                                                  false),
                                            );
                                          });
                                    },
                                    label: Text('Order'),
                                    icon: Icon(Icons.shopping_cart))),
                          ])
                        ]),
                        color: Colors.teal[100],
                      );
                    }));
              });
          }
        });
  }
}

class FavComponent extends StatefulWidget {
  final String clothid;
  bool yh;
  FavComponent(this.clothid, this.yh);
  @override
  State<FavComponent> createState() => FavComponentState();
}

class FavComponentState extends State<FavComponent> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          sharedPrefs.favid!.contains(widget.clothid)
              ? sharedPrefs.favid!.remove(widget.clothid)
              : sharedPrefs.favid!.add(widget.clothid);
          setState(() {
            widget.yh = !widget.yh;
          });
          connectFav();
        },
        icon: Icon(
          Icons.favorite,
          color: widget.yh == true ? Colors.red : Colors.white,
        ));
  }
}
