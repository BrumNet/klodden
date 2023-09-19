//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorsPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ColorsPage> createState() => ColorsPageState();
}

class ColorsPageState extends State<ColorsPage> {
  //const TPC({Key key}) : super(key: key);
  var tre = false;
  var tre2 = false;
  //final colorcolors = sharedPrefs.colors!;
  var colorcolors = [
    "0xff443a49",
    "0xfff43fff",
    "0xffa43a00",
    "0x0f000000",
    "0xffff0049",
    "0xffba0049",
    "0xffffe349",
    "0xff44ff49",
    "0xf0f34fff" //predefined last button color
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
      ),
      ElevatedButton(
        child: Text("Favorites"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shadowColor: Colors.teal),
        onPressed: () {},
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
      Padding(
        padding: EdgeInsets.all(2.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          clipBehavior: Clip.hardEdge,
          spacing: 4.0,
          runSpacing: 3.0,
          children: List.generate(colorcolors.length, (index) {
            return Container(
              child: InkWell(
                onTap: () {},
                onHover: (val) {
                  setState(() => tre = val);
                },
                child: index != colorcolors.length - 1
                    ? TextButton(child: Text(''), onPressed: () {})
                    : IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Color pickerColor = Color(0xff443a49);
                          Color currentColor = Color(0xff443a49);

                          // ValueChanged<Color> callback
                          void changeColor(Color color) {
                            setState(() => pickerColor = color);
                          }

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Add a New Favorite!'),
                                  content: SingleChildScrollView(
                                    child: MaterialPicker(
                                      pickerColor: pickerColor,
                                      onColorChanged: changeColor,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('Add'),
                                      onPressed: () {
                                        setState(
                                            () => currentColor = pickerColor);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }),
              ),
              width: 50.0,
              height: 50.0,
              decoration: new BoxDecoration(
                color: Color(int.parse(colorcolors[index])),
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ),

/*
      SizedBox(height:MediaQuery.of(context).size.height*0.05,),
 

      Text("Suggested Colors"),
        SizedBox(height:MediaQuery.of(context).size.height*0.05,),
      Wrap(  
            alignment: WrapAlignment.center ,
            clipBehavior: Clip.hardEdge,
            spacing: 4.0,
            runSpacing: 3.0,
             
            children:  
             List.generate(1, (index) { return Container(child: InkWell( 
               onTap: (){},
               onHover: (val){
                 setState(() => tre2 = val); 
               },
               child: tre2 ==false ? 
               TextButton( child : Text('') ,onPressed: (){ })  : IconButton(icon: Icon(Icons.add ),onPressed: (){ }),
      ) ,
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color:  Colors.yellow,
        shape: BoxShape.circle,
      ),
      )   ; }), 
            ),
        */
    ]));
  }
}

class AddCont extends StatefulWidget {
  @override
  State<AddCont> createState() => AddContSt();
}

class AddContSt extends State<AddCont> {
  @override
  Widget build(BuildContext) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Color pickerColor = Color(0xff443a49);
          Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
          void changeColor(Color color) {
            setState(() => pickerColor = color);
          }

// raise the [showDialog] widget
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Pick a color!'),
                  content: SingleChildScrollView(
                    child: //ColorPicker( pickerColor: pickerColor, onColorChanged: changeColor,  ),
                        // Use Material color picker:
                        //
                        // child:
                        MaterialPicker(
                      pickerColor: pickerColor,
                      onColorChanged: changeColor,
                      //showLabel: true, // only on portrait mode
                    ),
                    //
                    // Use Block color picker:
                    //
                    // child: BlockPicker(
                    //   pickerColor: currentColor,
                    //   onColorChanged: changeColor,
                    // ),
                    //
                    // child: MultipleChoiceBlockPicker(
                    //   pickerColors: currentColors,
                    //   onColorsChanged: changeColors,
                    // ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text('Got it'),
                      onPressed: () {
                        setState(() => currentColor = pickerColor);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        },
      ),
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
    );
  }
}
