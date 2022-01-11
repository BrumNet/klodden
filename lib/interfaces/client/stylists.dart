 import 'package:flutter/material.dart';

class Stylists extends StatelessWidget{
  //const TPC({Key key}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return Center(
      child:  OrientationBuilder(
        builder:   (context, orientation) {
           var wi =  orientation == Orientation.portrait ? MediaQuery.of(context).size.width/2 : MediaQuery.of(context).size.width/4; 
           //var hi =  MediaQuery.of(context).size.height/3;  
          return   Column(     
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            
                            SizedBox(height:MediaQuery.of(context).size.height*0.08,),
                            Text("Favorite Stylists"),
                            SizedBox(height:MediaQuery.of(context).size.height*0.08,),
                            Row(children: [
                             Flexible(child: Container( 
                            child: SingleChildScrollView( child: 
                            Wrap(  
             direction: Axis.horizontal,
            alignment: WrapAlignment.spaceEvenly, 
             spacing: 0,
            children: List.generate(1, (Index) 
            { return Container(
                 width:wi,
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
           Text("Stylists"),
           Divider(thickness: 2,color:  Colors.white),
           Container(
             child: Text(" "),
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
           
           );    


            })  
            )),),),
            Flexible(child: 
            Container(
                 width:wi,
                 height: MediaQuery.of(context).size.height*0.6, 
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
                    child:   
             Center( child: Container(
      child: IconButton(icon: Icon(Icons.add),onPressed: (){},),
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
      ),),   
           
           ),),
            ],)]);
            })
    );
  }
  } 