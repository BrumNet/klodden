 import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  //const TPC({Key key}) : super(key: key);
   

  @override
  Widget build (BuildContext context){
    return Container( width: MediaQuery.of(context).size.width,
                          child: Column(     
                          mainAxisSize: MainAxisSize.max, 
                          children: [ 
        SizedBox(height:MediaQuery.of(context).size.height*0.03,),
       Center(  child: Row( mainAxisSize: MainAxisSize.min,children: [
         TextButton(onPressed: (){}, child: Text('Body'),), 
         TextButton(onPressed: (){}, child: Text('My Body'),), 
       ],)  ),
        Center(
      child: Column(     
        mainAxisSize: MainAxisSize.min,
         children: [
        SizedBox(height:MediaQuery.of(context).size.height*0.03,),
        //Text("My Colors"),
        //SizedBox(height:MediaQuery.of(context).size.height*0.05,),
      Wrap(  
            alignment: WrapAlignment.center ,
            clipBehavior: Clip.hardEdge,
            spacing: 4.0,
            runSpacing: 3.0,
             
            children:  
             List.generate(5, (index) { return Container(
               width: MediaQuery.of(context).size.height*0.4, 
               child: TextFormField( 
                 decoration: InputDecoration(
                   label: Text('Label'),
                   border:  OutlineInputBorder(borderSide: BorderSide(),
                   borderRadius: BorderRadius.all(Radius.circular(4.0)), 
                   ),
                   //
                  ),
               ),
      //width: 50.0,
      //height: 50.0,
      
      )   ; }), 
            ),
            
            ])
    )   ]
                          ));
  }
  } 