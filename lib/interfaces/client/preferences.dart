//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:klodden/interfaces/backend/cache.dart';

class Preferences extends StatefulWidget {
  //const TPC({Key key}) : super(key: key);

  @override
  State<Preferences> createState() => PreferencesState();
}

class PreferencesState extends State<Preferences> {
  final likes = TextEditingController();
  final dislikes = TextEditingController();
  var dislike = false;
  @override
  Widget build(BuildContext context) {
    likes.text = sharedPrefs.likes!;
    dislikes.text = sharedPrefs.dislikes!;
    return Center(
        child: Wrap(
            alignment: WrapAlignment.start,
            clipBehavior: Clip.hardEdge,
            runSpacing: 10.0,
            children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: dislike
                ? MediaQuery.of(context).size.height * 0.18
                : MediaQuery.of(context).size.height * 0.6,
            margin: EdgeInsets.all(4.0),
            padding: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              color: Color(0xFFEAFDF7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5.0,
                  blurRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              //Icon(Icons.favorite ),
              dislike
                  ? SizedBox()
                  : Padding(
                      padding: EdgeInsets.fromLTRB(6, 6, 6, 30),
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                            child: Text(
                          "I Like",
                          style: TextStyle(fontSize: 20),
                        )),
                        Icon(
                          Icons.face,
                          size: 40,
                        )
                      ]),
                    ),
              //Divider(thickness: 2,color:  Colors.white),
              dislike
                  ? SizedBox()
                  : Container(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: likes,
                        //lValue: sharedPrefs.likes,
                        textCapitalization: TextCapitalization.sentences,
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        readOnly: false,
                      ), //(" "),
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
              Expanded(child: SizedBox()),
              Row(mainAxisSize: MainAxisSize.max, children: [
                Expanded(child: SizedBox()),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 35,
                    ),
                    onPressed: () {
                      if (dislike) {
                        setState(() {
                          dislike = !dislike;
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                    child: !dislike
                        ? SizedBox()
                        : Icon(
                            Icons.face,
                            size: 35,
                          )),
              ]),
            ]),
          ),

          //dislike Container
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: !dislike
                ? MediaQuery.of(context).size.height * 0.18
                : MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              color: Color(0XFFF9CDCD),
              /*border: Border.all(
                        width:  2, 
                        color: Colors.black,
                        ),*/
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5.0,
                  blurRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              //Icon(Icons.close ),
              !dislike
                  ? SizedBox()
                  : Padding(
                      padding: EdgeInsets.fromLTRB(6, 6, 6, 30),
                      child: Row(mainAxisSize: MainAxisSize.max, children: [
                        Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                            child: Text(
                          "I DisLike",
                          style: TextStyle(fontSize: 20),
                        )),
                        Icon(
                          Icons.face_unlock_sharp,
                          size: 40,
                        )
                      ]),
                    ),
              // Divider(thickness: 2,color:  Colors.grey),
              !dislike
                  ? SizedBox()
                  : Container(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: dislikes,
                        textCapitalization: TextCapitalization.sentences,
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        //autofocus: true,
                        textAlign: TextAlign.center,
                        readOnly: false,
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
              Expanded(child: SizedBox()),
              Row(mainAxisSize: MainAxisSize.max, children: [
                Expanded(child: SizedBox()),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 35,
                    ),
                    onPressed: () {
                      if (!dislike) {
                        setState(() {
                          dislike = !dislike;
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                    child: dislike
                        ? SizedBox()
                        : Icon(
                            Icons.face_unlock_sharp,
                            size: 35,
                          )),
              ]),
            ]),
          ),
        ]));
  }
}
