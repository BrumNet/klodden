import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:klodden/interfaces/backend/cache.dart';

import 'home/home.dart';
import 'orderInfo.dart';

class Designs extends StatefulWidget {
  //const TPC({Key key}) : super(key: key);
  var page;
  @override
  State<Designs> createState() => DesignsState();
  Designs(this.page);
}

class DesignsState extends State<Designs> {
  var page = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(
            height: 6.0,
          ),
          Divider(),
          SizedBox(
            height: 6.0,
          ),
          Center(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: widget.page == "Upload"
                        ? Color(0XFFEAFDF7)
                        : Colors.white,
                    foregroundColor: Colors.black),
                onPressed: () {
                  setState(() {
                    widget.page = 'Upload';
                  });
                },
                child: Text('Upload Design'),
              ),
              SizedBox(
                width: 6.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: widget.page == "Catalog"
                        ? Color(0XFFEAFDF7)
                        : Colors.white,
                    foregroundColor: Colors.black),
                onPressed: () {
                  setState(() {
                    widget.page = 'Catalog';
                  });
                },
                child: Text('Catalog'),
              ),
              SizedBox(
                width: 6.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: widget.page == "Designs"
                        ? Color(0XFFEAFDF7)
                        : Colors.white,
                    foregroundColor: Colors.black),
                onPressed: () {
                  setState(() {
                    widget.page = 'Designs';
                  });
                },
                child: Text('My Designs'),
              ),
            ],
          )),
          SizedBox(
            height: 6.0,
          ),
          Divider(),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: widget.page == "Upload" || page == 'Upload'
                ? Upload()
                : widget.page == "Designs" || page == 'Designs'
                    ? MyDesign()
                    : Catalog(),
          )
        ]));
  }
}

class MyDesign extends StatelessWidget {
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
              height: MediaQuery.of(context).size.height * 0.6,
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
                height: MediaQuery.of(context).size.height * 0.6,
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
                            onPressed: () {},
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
                                    onPressed: () {},
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

class Upload extends StatefulWidget {
  @override
  State<Upload> createState() => UploadState();
}

class UploadState extends State<Upload> {
  final price = TextEditingController();
  final minDeposit = TextEditingController();
  final material = TextEditingController();
  final color = TextEditingController();
  final style = TextEditingController();
  bool view = false;
  bool gender1 = false;
  String? gender;
  bool gender2 = false;
  bool gender3 = false;
  String process = "unclicked";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Wrap(
                alignment: WrapAlignment.start,
                clipBehavior: Clip.hardEdge,
                spacing: 4.0,
                runSpacing: 3.0,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      onPressed: () {
                        _getFromGallery();
                      },
                      child: Text(
                        'Upload Image',
                        style: TextStyle(fontSize: 11),
                      )),
                  SizedBox(
                    width: 6.0,
                  ),
                  process == "unclicked"
                      ? Icon(Icons.cancel)
                      : process == "clicked"
                          ? CircularProgressIndicator()
                          : Icon(Icons.done),
                  TextButton.icon(
                      label: Text('Unisex'),
                      icon: Icon(gender1 == false
                          ? Icons.check_box_outline_blank
                          : Icons.check_box_outlined),
                      onPressed: () {
                        gender = 'Unisex';
                        setState(() {
                          gender1 = !gender1;
                          gender2 = false;
                          gender3 = false;
                        });
                      }),
                  TextButton.icon(
                      label: Text('Female'),
                      icon: Icon(gender2 == false
                          ? Icons.check_box_outline_blank
                          : Icons.check_box_outlined),
                      onPressed: () {
                        gender = 'Female';
                        setState(() {
                          gender1 = false;
                          gender2 = !gender2;
                          gender3 = false;
                        });
                      }),
                  TextButton.icon(
                      label: Text('Male'),
                      icon: Icon(gender3 == false
                          ? Icons.check_box_outline_blank
                          : Icons.check_box_outlined),
                      onPressed: () {
                        gender = 'Male';
                        setState(() {
                          gender1 = false;
                          gender2 = false;
                          gender3 = !gender3;
                        });
                      }),
                ]),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: price,
              decoration: InputDecoration(
                label: Text('Price'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  //borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                //
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: minDeposit,
              decoration: InputDecoration(
                label: Text('Minimum Deposit'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  //borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                //
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: color,
              decoration: InputDecoration(
                label: Text('Color'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                //
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: style,
              decoration: InputDecoration(
                label: Text('Style'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                //
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: material,
              decoration: InputDecoration(
                label: Text('Material'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                //
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, foregroundColor: Colors.red),
                onPressed: () {
                  showDialog(
                      //barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: price.text == '' ||
                                  minDeposit.text == '' ||
                                  sharedPrefs.imagepath == null ||
                                  gender == null
                              ? Text(sharedPrefs.imagepath == null
                                  ? 'Image not Selected'
                                  : gender == null
                                      ? 'Kindly Select A Gender'
                                      : 'Price/Minimum Deposit Not Entered')
                              : OrderInfo(
                                  price.text,
                                  minDeposit.text,
                                  material.text,
                                  color.text,
                                  style.text,
                                  gender!,
                                  view),
                        );
                      });
                },
                child: Text('Preview')),
          ],
        ));
  }

  _getFromGallery() async {
    sharedPrefs.imagepath = '';
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
      imageQuality: 25,
    );
    //if(kIsWeb){
    sharedPrefs.imagepath = pickedFile?.path;
    view = true;
    setState(() => process = "selected");
    //else{ _cropImage(pickedFile.path);  }
  }
}

class Catalog extends StatelessWidget {
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
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
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
                height: MediaQuery.of(context).size.height * 0.6,
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
                            onPressed: () {},
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
                                    onPressed: () {},
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
