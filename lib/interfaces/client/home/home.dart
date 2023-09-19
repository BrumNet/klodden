import 'package:flutter/material.dart';

import '../../backend/cache.dart';
import '../../backend/server.dart';

class Home extends StatefulWidget {
  //const TPC({Key key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var displayinfo = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                //image: DecorationImage(image:
                //NetworkImage('https://picsum.photos/250/400?image=8'),
                //),
                //border: Border.all(width: 2.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.ablkv9-XQa8LH01kvoekQAHaLG?pid=ImgDet&rs=1',
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                height: MediaQuery.of(context).size.height * 0.7,
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: displayinfo == false
                        ? EdgeInsets.only(right: 30, bottom: 20)
                        : EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: displayinfo == false
                        ? IconButton(
                            icon: Icon(
                              Icons.info,
                              size: 35.0,
                              color: Colors.lightBlueAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                displayinfo = true;
                              });
                            },
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                                color: Color(0XFFEAFDF7),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6.0),
                                    bottomRight: Radius.circular(6.0))),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        displayinfo = false;
                                      });
                                    },
                                  ),
                                  Text("Information About Products"),
                                ]))))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                ;
              },
              child: FavComponent("", true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFEAFDF7),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            ElevatedButton(
              onPressed: () {
                ;
              },
              child: OrderComponent(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFFEAFDF7),
              ),
            ),
          ],
        ))
      ],
    ));
  }
}

class OrderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            )));
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: IconButton(
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
            )));
  }
}
