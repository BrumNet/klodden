 //import 'dart:html';

import 'package:flutter/material.dart';
import 'package:klodden/interfaces/backend/cache.dart';

class Preferences extends StatefulWidget{
  //const TPC({Key key}) : super(key: key);
 
  @override
  State<Preferences> createState() => PreferencesState( );
}

class PreferencesState extends State<Preferences> { 
 final  likes = TextEditingController() ; 
 final dislikes = TextEditingController(); 
  
  @override 
  Widget build (BuildContext context){
    likes.text = sharedPrefs.likes!;
    dislikes.text = sharedPrefs.dislikes!  ;
    return Center(
      child: Wrap(  
            alignment: WrapAlignment.spaceEvenly,
            clipBehavior: Clip.hardEdge,
            runSpacing: 4.0,
             
            children: [
               Container(
                 width:MediaQuery.of(context).size.width*0.4,
                 margin: EdgeInsets.all(4.0), 
                decoration: BoxDecoration
                    (
                      color: Colors.indigo[100],
                      border: Border.all(
                        width:  2, 
                        color: Colors.pink,
                        ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5.0,    
                            blurRadius: 5.0,
                      )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(     
        mainAxisSize: MainAxisSize.min,
         children: [
            Icon(Icons.favorite ),
           Text("Likes"),
           Divider(thickness: 2,color:  Colors.white),
           Container(
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
             height: MediaQuery.of(context).size.height*0.4,),
             Container(
      child: IconButton(icon: Icon(Icons.edit),onPressed: (){

      },),
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
      ), 
      SizedBox(height:MediaQuery.of(context).size.height*0.02,),
         ]
         ),
           
           ),  
          Container(
             width:MediaQuery.of(context).size.width*0.4,
                decoration: BoxDecoration
                    (
                      color: Colors.grey[100],
                      border: Border.all(
                        width:  2, 
                        color: Colors.black,
                        ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5.0,    
                            blurRadius: 5.0,
                      )
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(     
        mainAxisSize: MainAxisSize.min,
         children: [
           Icon(Icons.close ),
           Text("DisLikes"),
           Divider(thickness: 2,color:  Colors.grey),
           Container(
             child:  TextField(
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
             height: MediaQuery.of(context).size.height*0.4,), 
             Container(
      child: IconButton(icon: Icon(Icons.edit),onPressed: (){},),
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
      ), 
      SizedBox(height:MediaQuery.of(context).size.height*0.02,),
         ]
         ),
           
           ), 

            ]
            )
    );
  }
  } 